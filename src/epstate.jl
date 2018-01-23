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

SingleSpinState(n_sites::Int) = SingleSpinState(bitrand(n_sites))
SingleSpinState(n_sites::Int, n_particles::Int) = SingleSpinState(random_spins(n_sites, n_particles))


"""
    MultiSpinState(state::Vector{UInt})

State of several processes (up to 64). The `spins` field gives spin
configurations, encoded in the bitstring forming `UInt`.
"""
struct MultiSpinState <: EPState
    spins::Vector{UInt}
end

MultiSpinState(n_sites::Int) = MultiSpinState(rand(UInt, n_sites))
MultiSpinState(n_sites::Int, n_particles) = MultiSpinState(random_multispins(n_sites, n_particles))


"""
Returns vector of `UInt64`s corresponding to random configurations with fixed particle number.
"""
function random_multispins(n_sites::Int, n_particles::Int)

    configs = hcat([random_spins(n_sites, n_particles) for _ in 1:64]...)

    integer_configs = []

    for j in 1:n_sites
        bit_string = join(Vector{Int}(configs[j,:])) 
        append!(integer_configs, parse(UInt64, bit_string, 2))
    end

    return integer_configs
end

random_spins(n_sites::Int, n_particles::Int) = shuffle(vcat(trues(n_particles),falses(n_sites - n_particles)))


"""
Returns distinct configurations
"""
function configs(multi::MultiSpinState)
end

end
