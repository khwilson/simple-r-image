#' This file installs the requirements of this repository.
#' Note that the versions of the top-level packages have been
#' pinned but it's possible that some dependencies are not
install.packages('devtools', repos = "https://cloud.r-project.org", Ncpus = 3)
require(devtools)

install_version(
  "tidyverse",
  version = "1.3.0",
  repos = "https://cloud.r-project.org"
)

install_version(
  "estimatr",
  version = "0.22.0",
  repos = "https://cloud.r-project.org"
)

install_version(
  "randomizr",
  version = "0.20.0",
  repos = "https://cloud.r-project.org"
)

install_version(
  "lubridate",
  version = "1.7.9",
  repos = "https://cloud.r-project.org"
)

install_version(
  "blockTools",
  version = "0.6-3",
  repos = "https://cloud.r-project.org"
)

install_version(
  "here",
  version = "0.1",
  repos = "https://cloud.r-project.org"
)

install_version(
  "mice",
  version = "3.13.0",
  repos = "https://cloud.r-project.org"
)

install_version(
  "optparse",
  version = "1.6.6",
  repos = "https://cloud.r-project.org"
)

install_version(
  "did",
  version = "2.0",
  repos = "https://cloud.r-project.org"
)