module ExclusionProcesses

# See http://www.stochasticlifestyle.com/finalizing-julia-package-documentation-testing-coverage-publishing/
export EPState, SingleSpinState, MultiSpinState, spin_configs, PeriodicBC, OpenBC, SEP,
        update!, Simulation



#Import your packages

# import Base: func1 #Any function you add dispatches to need to be imported directly

include("epstate.jl")
include("boundarycondition.jl")
include("exclusionprocess.jl")
include("sep.jl")
include("runsim.jl")

#export coolfunc, coolfunc2 #Export the functions you want users to use

using .epstate
using .boundarycondition
using .exclusionprocess
using .sep
using .runsim

end
