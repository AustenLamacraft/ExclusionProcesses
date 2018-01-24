using Base.Test
using ExclusionProcesses

@testset "epstate" begin

n_sites = 10

# Basic constructor
random_spins = bitrand(n_sites)
@test SingleSpinState(random_spins).spins == random_spins

# Randomly initialized states have correct number of particles
n_particles = rand(1:n_sites)
@test sum(SingleSpinState(n_sites,n_particles).spins) == n_particles

# Every configuration in a multi spin encoding has correct number of particles
configs = spin_configs(MultiSpinState(n_sites, n_particles))
@test all([sum(configs[i,:]) == n_particles for i=1:64])

end # testset
