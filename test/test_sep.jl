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

# Update of multispin configuration must cause convergence

end # testset
