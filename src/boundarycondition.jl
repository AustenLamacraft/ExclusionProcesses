module boundarycondition

export BoundaryCondition, OpenBC, PeriodicBC

"""
Abstract base class for boundary conditions.
"""
abstract type BoundaryCondition end

"""
Open boundary conditions.
"""
abstract type OpenBC <: BoundaryCondition end

"""
Periodic boundary conditions.
"""
abstract type PeriodicBC <: BoundaryCondition end

end
