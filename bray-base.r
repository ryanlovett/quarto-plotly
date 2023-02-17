#!/usr/bin/env Rscript

source("/tmp/set-libs.r")

set_name = "Bray Base"

set_libs = c(
    "rmarkdown", "2.20",
    "plotly", "4.10.1",
    "reshape2", "1.4.4"
)

set_libs_install_version(set_name, set_libs)

# devtools::install_github("andrewpbray/boxofdata@8afd934")

print(paste("Done installing packages for",set_name))
