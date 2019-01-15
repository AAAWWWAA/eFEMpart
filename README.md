# eFEMpart
Finite Element code in the [Julia language](https://julialang.org/) focused on fluid-dynamics applications, with possibility of including a particle simulator. This is in contrast to a previous "eFEM" package, which did not include the particle simulator code. 

This repository allows the use of Finite Elements discretizations to solve
common problems in fluid dynamics. 

# Installation

## Linux

- download Julia 1.0.* from (link to download page)
- copy eFEMpart folder into location where it won't move
- add above folder path into '~/,julia/config/startup.jl' file. It's possible that you will need to create this file yourself. To add the path, include the line `push!(LOAD_PATH,"/home/peastham/Projects/eFEMpart/src/")` into the `startup.jl` file. In the future I'll probably write a script that does this for you.

## Mac OS

I'll get back to you on this one...

## Windows

eFEMpart is not supported as of yet on Windows. Sorry.

# Dependencies

The following packages can optionally be installed as dependencies:

- [JLD](https://github.com/JuliaIO/JLD.jl)
- [Plots](http://docs.juliaplots.org/latest/)
- [PyPlot](https://github.com/JuliaPy/PyPlot.jl)
- [PyCall](https://github.com/JuliaPy/PyCall.jl)
- [LaTeXStrings](https://github.com/stevengj/LaTeXStrings.jl)

To add any of the above, follow the [instructions for installing packages](https://docs.julialang.org/en/v1.0/stdlib/Pkg/#Pkg.add)

# Meshes

For simple geometries (rectangles...), you can use the built-in 
geometry code but for more complicated geometries we suggest building your mesh with 
an external library (such as [GMSH](http://gmsh.info/)).

# Equations

As of right now, the following equations are solvable:

* Poisson's Equation (`:Poisson2D`)

<p align="center"><img src="/tex/a1e55dd0d6f8247d8b884e241419c34e.svg?invert_in_darkmode&sanitize=true" align=middle width=75.003885pt height=17.399144399999997pt/></p>

* Darcy's Equation (`:Darcy2D`)

<p align="center"><img src="/tex/3ba9ca5ab07d4c987d667c9f4956512c.svg?invert_in_darkmode&sanitize=true" align=middle width=118.8451539pt height=19.726228499999998pt/></p>

* Advection-Diffusion Equation (`:AdvDiff2D`)

<p align="center"><img src="/tex/50aaf8695606a64a2aba3412a4cd7ca3.svg?invert_in_darkmode&sanitize=true" align=middle width=178.72117724999998pt height=19.726228499999998pt/></p>

* Stokes' Equation (`:Stokes2D`)

<p align="center"><img src="/tex/f7e35892f79b733caf605eb9762d82c0.svg?invert_in_darkmode&sanitize=true" align=middle width=170.03593694999998pt height=19.726228499999998pt/></p>
<p align="center"><img src="/tex/efbfbcd0f130f2b91fea06b34868e681.svg?invert_in_darkmode&sanitize=true" align=middle width=66.2097216pt height=11.232861749999998pt/></p>

* Brinkman's Equation (`:Brinkman2D`)

<p align="center"><img src="/tex/07e57a540d72768f0e3d8ca41934ad8a.svg?invert_in_darkmode&sanitize=true" align=middle width=200.24691225pt height=19.726228499999998pt/></p>
<p align="center"><img src="/tex/efbfbcd0f130f2b91fea06b34868e681.svg?invert_in_darkmode&sanitize=true" align=middle width=66.2097216pt height=11.232861749999998pt/></p>

* Brinkman's Multiphase Equation (`:BrinkmanMP2D`)

<p align="center"><img src="/tex/8b86a228922df2e57a458e4cbd5379e8.svg?invert_in_darkmode&sanitize=true" align=middle width=186.47236739999997pt height=17.399144399999997pt/></p>
<p align="center"><img src="/tex/efbfbcd0f130f2b91fea06b34868e681.svg?invert_in_darkmode&sanitize=true" align=middle width=66.2097216pt height=11.232861749999998pt/></p>

All parameterized equations can be solvable with either constant or variable-in-space parameters. Additionally, Axisymmetric version of the Advection-Diffusion and Stokes equations are available with the Operator Types of `:AdvDiffAS` and `:StokesAS`, respectively. 

# Auxiliary Information

Boundary conditions are treated intuitively, based on the mesh given. The functions `Dirichlet`, `Neumann`, and `Robin` allow assignment of boundaries to have certain boundary conditions, and the functions `Dirichlet`, `Neumann`, `Forcing` allow for the definition of the actual boundary conditions at these boundaries. See [examples](examples/) for how this is used in practice.

# Visualization

We export all solutions in a [legacy VTK format](https://www.vtk.org/VTK/img/file-formats.pdf). For visualizing these files, we suggest using [VisIt](https://wci.llnl.gov/simulation/computer-codes/visit/)

# Examples 

Check out the [examples folder](examples/) to see how to use our syntax.

Equations in this `README` were generated by the GitHub app [TeXify](https://github.com/apps/texify)