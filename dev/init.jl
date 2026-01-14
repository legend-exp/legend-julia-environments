import Pkg

Pkg.setprotocol!(protocol = "ssh")

Pkg.activate(@__DIR__)

import Pkg
prj = Pkg.project()

prjfile = prj.path
prjdir = dirname(prjfile)

if !(basename(prjdir) == "dev" && basename(dirname(prjdir)) == "legend-julia-environments")
    error("This script must be run from the dev/ directory of the legend-julia-environments repository.")
end

devdir = joinpath(dirname(dirname(prj.path)), "pkgrepos")
ENV["JULIA_PKG_DEVDIR"] = devdir

devpkgs = first.(filter(s -> haskey(s.second, "path"), collect(prj.sources)))

Pkg.activate(; temp=true)
prjfile_tmp = Pkg.project().path
cp(prjfile , prjfile_tmp)
Pkg.develop(devpkgs)

Pkg.activate(prjdir)
Pkg.resolve()
Pkg.instantiate()
