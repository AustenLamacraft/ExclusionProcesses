abstract type EPState <: AbstractArray end

type SingleSpinState <: EPState
    # Single spin encoding
end

type MultiSpinState <: EPState
    # Multispin encoding
end

struct ExclusionProcess
    state::EPState

    # needs an update method...

    update!::Function

end
