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
struct SingleSpinState <: EPState
    spins::BitArray{1}
end

SingleSpinState(n_sites::Int) = SingleSpinState(rand(Bool, n_sites))
SingleSpinState(n_sites::Int, n_particles::Int) = SingleSpinState(shuffle(cat(1,trues(n_particles),falses(n_sites - n_particles))))

"""
    MultiSpinState(state::Vector{UInt})

State of several processes (up to 64). The `spins` field gives spin
configurations, encoded in the bitstring forming `UInt`.
"""
struct MultiSpinState <: EPState
    spins::Vector{UInt}
end

"""
Returns distinct configurations
"""
function configs(multi::MultiSpinState)
end

end
