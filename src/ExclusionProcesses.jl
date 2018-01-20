module ExclusionProcesses

# See http://www.stochasticlifestyle.com/finalizing-julia-package-documentation-testing-coverage-publishing/
export SingleSpinState, MultiSpinState


#Import your packages

# import Base: func1 #Any function you add dispatches to need to be imported directly

include("epstate.jl")
include("exclusionprocess.jl")
include("sep.jl")

#export coolfunc, coolfunc2 #Export the functions you want users to use

using .epstate
using .exclusionprocess

end
