module sep

export SEP

import ..exclusionprocess
import ..epstate: EPState
import ..boundarycondition: OpenBC, PeriodicBC

using ..exclusionprocess

"""
The Symmetric Exclusion Process (SEP).
"""
abstract type SEP <: ExclusionProcess end

function exclusionprocess.update!(::Type{SEP}, ::Type{PeriodicBC}, state::EPState)

    spins = state.spins
    size = length(spins)
    bond = rand(1:size)

    if bond == size
        spins[size], spins[1] = random_swap(spins[size], spins[1])
    else
        spins[bond], spins[bond + 1] = random_swap(spins[bond], spins[bond + 1])
    end

end

function exclusionprocess.update!(::Type{SEP}, ::Type{OpenBC}, state::EPState)

    spins = state.spins
    size = length(spins)
    bond = rand(1:size - 1)

    spins[bond], spins[bond + 1] = random_swap(spins[bond], spins[bond + 1])

end

"""
Executes swap of different bits in a random direction (i.e. 1 goes forward or back)
"""
function random_swap(I1, I2)
    S = rand([I1 & ~I2, ~I1 & I2])
    return xor(I1, S), xor(I2, S)
end


end
