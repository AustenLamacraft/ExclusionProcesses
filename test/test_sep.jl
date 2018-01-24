using Base.Test
using ExclusionProcesses

@testset "sep" begin

# A SEP update either does nothing or changes two spins
spin_state = SingleSpinState(10,5)
init_spins = copy(spin_state.spins)
update!(SEP, OpenBC, spin_state)
diff = xor.(init_spins, spin_state.spins)
@test sum(diff) == 2 || sum(diff) == 0

# For open boundary conditions the changed spins must be adjacent
@test diff[indmax(diff) + 1] == true || sum(diff) == 0

# Update of multispin configuration must cause convergence.
# This means that each `UInt64` must change in a way that increases the absolute
# value of the deviation from 32 of the number of 1s in its binary representation.
score(ms::UInt64) = abs(count_ones(ms) - 32)
ms_state = MultiSpinState(10,5)
init_scores = [score(site) for site in ms_state.spins]
update!(SEP, OpenBC, ms_state)
final_scores = [score(site) for site in ms_state.spins]
@test all(final_scores .>= init_scores)

end # testset
