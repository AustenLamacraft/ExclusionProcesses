module epstate

export EPState, SingleSpinState, MultiSpinState

"""
Abstract base class for a configuration of an exclusion process
"""
abstract type EPState end


"""
    SingleSpinState(state::Vector{Bool})

State of a single process. The `state` field gives spin configuration.
"""
mutable struct SingleSpinState <: EPState
    state::Vector{Bool}
end

mutable struct MultiSpinState <: EPState
    state::Vector{UInt}
end

end
