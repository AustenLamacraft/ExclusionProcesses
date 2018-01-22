module runsim

import ..exclusionprocess: ExclusionProcess
import ..epstate: EPState
import ..boundarycondition: BoundaryCondition


mutable struct Simulation
    ep::ExclusionProcess
    bc::BoundaryCondition
    state::EPState
    steps::Int
end

end
