module runsim

export Simulation

import ..exclusionprocess: ExclusionProcess
import ..epstate: EPState
import ..boundarycondition: BoundaryCondition

"""
Basic simulation type.
"""
mutable struct Simulation
    ep::Type{S} where {S<:ExclusionProcess}
    bc::Type{T} where {T<:BoundaryCondition}
    state::EPState
    steps::Int
end

end
