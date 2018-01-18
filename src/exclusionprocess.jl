abstract type EPState <: AbstractArray
    # State of the exclusion process
end


struct ExclusionProcess
    state::EPState

    # needs an update method...

    update!::Function
    
end
