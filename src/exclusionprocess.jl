module exclusionprocess

export EP, update!

import ..epstate: EPState, SingleSpinState, MultiSpinState

abstract type ExclusionProcess end

update!(::Type{T}, state::EPState) where {T<:ExclusionProcess} =
throw(ArgumentError("Update not defined for exclusion process $T."))

abstract type Update end

end
