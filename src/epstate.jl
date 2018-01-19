module epstate

export EPState, SingleSpinState, MultiSpinState

abstract type EPState end

mutable struct SingleSpinState <: EPState
    state::Vector{Bool}
end

mutable struct MultiSpinState <: EPState
    state::Vector{UInt}
end

end
