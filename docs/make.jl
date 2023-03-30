using SimplePhaseDiagrams
using Documenter

DocMeta.setdocmeta!(SimplePhaseDiagrams, :DocTestSetup, :(using SimplePhaseDiagrams); recursive=true)

makedocs(;
    modules=[SimplePhaseDiagrams],
    authors="singularitti <singularitti@outlook.com> and contributors",
    repo="https://github.com/MineralsCloud/SimplePhaseDiagrams.jl/blob/{commit}{path}#{line}",
    sitename="SimplePhaseDiagrams.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MineralsCloud.github.io/SimplePhaseDiagrams.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MineralsCloud/SimplePhaseDiagrams.jl",
    devbranch="main",
)
