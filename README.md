# LEGEND Julia environments

The [Julia project environment](https://pkgdocs.julialang.org/v1/environments/)
`base` contains the major set of general Julia packages that the LEGEND Julia
software depends on.

The main use case of this pre-defined environment is Julia package installation
in software containers and central locations, in conjunction with
[`$JULIA_PKG_PRESERVE_TIERED_INSTALLED`](https://pkgdocs.julialang.org/v1/api/#Pkg.add).
