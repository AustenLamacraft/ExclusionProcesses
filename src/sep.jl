module sep

export SEP

import ..exclusionprocess: ExclusionProcess
import ..epstate: EPState


mutable struct SEP <: ExclusionProcess
end

function update!(::Type{SEP}, state::EPState)
end

end
