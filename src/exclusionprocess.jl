module exclusionprocess

export EP, update!

import .epstate: EPState


abstract type ExclusionProcess end

update!(::Type{T}, state::EPState) where {T<:ExclusionProcess} =
throw(ArgumentError("Update not defined for exclusion process $T."))

mutable struct EP <: ExclusionProcess
    state::EPState
end

abstract type Update end

end
