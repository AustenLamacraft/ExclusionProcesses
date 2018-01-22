module epstate

export EPState, SingleSpinState, MultiSpinState

"""
Abstract base class for a configuration of an exclusion process.

All deriving state classes have to define the field `spins` that encodes the
spin configuration. 
"""
abstract type EPState end

"""
    SingleSpinState(state::Vector{Bool})

State of a single process. The `spins` field gives spin configuration as Booleans.
"""
mutable struct SingleSpinState <: EPState
    spins::Vector{Bool}
end

"""
    MultiSpinState(state::Vector{UInt})

State of several processes (up to 64). The `spins` field gives spin
configurations, encoded in the bitstring forming `UInt`.
"""
mutable struct MultiSpinState <: EPState
    spins::Vector{UInt}
end

"""
Returns distinct configurations
"""
function configs(multi::MultiSpinState)
end

end
