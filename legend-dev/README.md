# LEGEND Julia development environment

Intended as a standalone development environment for LEGEND-related Julia
packages.

Run (only once)

```shell
julia init.jl
```

to initialize the development environment. This mainly clones the Git
repositories of the various LEGEND Julia packages into the `pkgs/` directory
and runs an initial `Pkg.instantiate()`.

Now use

```shell
julia --project=/path/to/legend-dev
```

to start a Julia REPL with the LEGEND development environment activated.
