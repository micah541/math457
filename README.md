# math457
Julia etc for math 457


To use graphics, Juliabox does not seem to work, so you will have to install Julia on your machine.  This is easy enough.  In order to use the package Winston, you have to install it, which can be done via 

julia> Pkg.add("Winston")

To 'run' the file, use 

julia> include("quadratic.jl") 

remembering you may have to initialize it with a c value and uncomment some of the code the first time through.  
