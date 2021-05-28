#!/bin/bash

NUM_PER_PROCESSOR=100

docker pull ghcr.io/khwilson/simple-r
aws s3 cp s3://khwilson-us-east-1-mpd/code.tar.gz .
tar xzvf code.tar.gz

outcome=$1
# for outcome in num_minor_arrests num_use_of_force num_tickets total_sick_hours num_self_initiated num_non_traffic_self_initiated; do
  for base_seed in 1000 3000 5000 7000 9000 11000 13000; do
    for idx in $(seq $2); do
      seed=$(( $base_seed + $idx * $NUM_PER_PROCESSOR ))
      echo "Running: $outcome with seed $seed on index $idx"

      docker run --rm -d -v "$(pwd)/MPD-NMAAHC:/code/MPD-NMAAHC" ghcr.io/khwilson/simple-r bash -c "cd /code/MPD-NMAAHC; Rscript --vanilla main_multi.R -c $outcome -o output_$outcome_$seed.csv -n $NUM_PER_PROCESSOR -s $seed"
    done

    while [ true ]; do
      num_docker_seen=$(docker ps -a | wc -l)
      if [ $num_docker_seen -eq "1" ]; then
        break
      else
        sleep 5
      fi
    done

    # Go ahead and upload at the end of each group to make sure that we don't lose things
    for filename in $(ls MPD-NMAAHC/*output*.csv); do
      aws s3 cp "$filename" "s3://khwilson-us-east-1-mpd/outputs/$filename"
    done
  done
# done