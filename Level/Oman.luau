--!strict
local partitions = require("./partitions")

local Levolution = {}

print("Hello World!")

local LevolutionProjectileBlueprint = {
  partitionGuid = Guid("80CDB61C-FF92-45B7-9824-7F132DEF5623"),
  instanceGuid = Guid("ACD1D80B-BEB1-4892-B305-FE14FB03C1F5")
}

function Levolution:OnVisualEnvironmentBlueprintLoad(p_VisualEnvironmentBlueprint: VisualEnvironmentBlueprint)
    print("***** Found Levolution Blueprint!!!")
    local s_VisualEnvironmentEntityData = p_VisualEnvironmentBlueprint.object :: VisualEnvironmentEntityData
    local s_VisualEnvironmentEntityComponents = s_VisualEnvironmentEntityData.components
    local s_FogComponentData = s_VisualEnvironmentEntityComponents[6] :: FogComponentData
    local s_SkyComponentData = s_VisualEnvironmentEntityComponents[8] :: SkyComponentData
   --  s_SkyComponentData.enable = false
    s_SkyComponentData.cloudLayer1Altitude = 1000
    s_FogComponentData.enable = false
   -- s_FogComponentData.heightFogEnable = false
    -- s_FogComponentData.heightFogAltitude = 9999
end

partitions.onInstanceLoad(
    LevolutionProjectileBlueprint.partitionGuid,
    LevolutionProjectileBlueprint.instanceGuid,
    Levolution,
    Levolution.OnVisualEnvironmentBlueprintLoad
)

return nil