module epstate

export EPState, SingleSpinState, MultiSpinState, spin_configs

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
    spins::BitVector

    SingleSpinState(init_spins::BitVector) = new(init_spins)

    SingleSpinState(n_sites::Int) = new(bitrand(n_sites))

    function SingleSpinState(n_sites::Int, n_particles::Int)
        if n_particles > n_sites
            throw(ArgumentError("n_partices must be <= n_sites"))
        end
        new(random_spins(n_sites, n_particles))
    end

end


"""
    MultiSpinState(state::Vector{UInt})

State of several processes (up to 64). The `spins` field gives spin
configurations, encoded in the bitstring forming `UInt`.
"""
struct MultiSpinState <: EPState
    spins::Vector{UInt}

    MultiSpinState(init_spins::Vector{UInt}) = new(init_spins)

    MultiSpinState(n_sites::Int) = new(rand(UInt, n_sites))

    function MultiSpinState(n_sites::Int, n_particles::Int)
        if n_particles > n_sites
            throw(ArgumentError("n_partices must be <= n_sites"))
        end
        new(random_multispins(n_sites, n_particles))
    end

end

"""
Returns vector of `UInt64`s corresponding to 64 random configurations with fixed particle number.
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

"""
Returns `BitArray` with random configuration of fixed particle number
"""
random_spins(n_sites::Int, n_particles::Int) = shuffle([trues(n_particles);falses(n_sites - n_particles)])

"""
Converts `UInt64` to 64 bit `BitArray`
"""
uint2spins(ms::UInt64) = BitArray(split(bin(ms, 64), "") .== "1")

"""
Returns 2D array giving the 64 configurations encoded in a `MultiSpinState`
"""
spin_configs(mss::MultiSpinState) = hcat([uint2spins(ms) for ms in mss.spins]...)

end
