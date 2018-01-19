module exclusionprocess

export EPState, SingleSpinState, MultSpinState, ExclusionProcess, initialize!, update!

abstract type EPState end

mutable struct SingleSpinState <: EPState
    state::Vector{Bool}
end

mutable struct MultiSpinState <: EPState
    state::Vector{UInt}
end

abstract type ExclusionProcess end

mutable struct EP <: ExclusionProcess
    state::EPState
end

initialize!{T<:EPState}(::Type{T}) =
throw(ArgumentError("Initialization not defined for state $T."))

update!{T<:ExclusionProcess}(::Type{T}) =
throw(ArgumentError("Update not defined for exclusion process $T."))

end
