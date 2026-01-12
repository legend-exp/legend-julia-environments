import Pkg

Pkg.setprotocol!(protocol = "ssh")

if basename(dirname(Pkg.project().path)) != "legend-dev"
    Pkg.activate(@__DIR__)
end

import Pkg
prj = Pkg.project()

prjfile = prj.path
prjdir = dirname(prjfile)

ENV["JULIA_PKG_DEVDIR"] = joinpath(dirname(prj.path), "pkgs")

prjfile_orig = tempname(prjdir, suffix = "_Project.toml", cleanup = false)
cp(prjfile , prjfile_orig)
try
    Pkg.develop(collect(keys(prj.sources)))
finally
    mv(prjfile_orig, prjfile, force = true)
end

Pkg.instantiate()
