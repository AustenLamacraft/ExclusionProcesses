module ExclusionProcesses

#Import your packages

# import Base: func1 #Any function you add dispatches to need to be imported directly

include("exclusionprocess.jl")
include("epstate.jl")
include("SEP.jl")


#export coolfunc, coolfunc2 #Export the functions you want users to use

end
