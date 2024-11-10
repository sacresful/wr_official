--!strict
-- remove dust on siege
local partitions = require("./partitions")

local Levolution = {}

print("Hello World!")

local LevolutionProjectileBlueprint = {
  partitionGuid = Guid("8F8CFEC1-E04C-4805-BC88-E21562A58756"),
  instanceGuid = Guid("CFE79B20-2540-40AD-82A5-D586325BDEDF")
}

function Levolution:OnVisualEnvironmentBlueprintLoad(p_VisualEnvironmentBlueprint: VisualEnvironmentBlueprint)
    print("***** Found Levolution Blueprint!!!")
    local s_VisualEnvironmentEntityData = p_VisualEnvironmentBlueprint.object :: VisualEnvironmentEntityData
    local s_VisualEnvironmentEntityComponents = s_VisualEnvironmentEntityData.components
  --  local s_FogComponentData = s_VisualEnvironmentEntityComponents[2] :: FogComponentData
    local s_SkyComponentData = s_VisualEnvironmentEntityComponents[3] :: SkyComponentData
    s_SkyComponentData.enable = false
end

partitions.onInstanceLoad(
    LevolutionProjectileBlueprint.partitionGuid,
    LevolutionProjectileBlueprint.instanceGuid,
    Levolution,
    Levolution.OnVisualEnvironmentBlueprintLoad
)

return nil