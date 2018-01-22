module exclusionprocess

export ExclusionProcess, update!

import ..epstate: EPState
import ..boundarycondition: BoundaryCondition

abstract type ExclusionProcess end

"""
Generic update function. Needs methods added for each process and boundary condition.
"""
update!(::Type{S}, ::Type{T}, state::EPState) where {S<:ExclusionProcess, T<:BoundaryCondition}  =
throw(ArgumentError("Update not defined for exclusion process $S with boundary condition $T."))

abstract type Update end

end
