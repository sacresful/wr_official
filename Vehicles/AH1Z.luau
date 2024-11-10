--!strict
-- apply z10 inertias for ah1z
local partitions = require("./partitions")

local AH1Z = {}

print("Mod initialized")

local AH1ZBlueprint = {
  partitionGuid = Guid("643135EA-6CA7-11DF-B6FA-F715AA601362"),
  instanceGuid = Guid("A676D498-A524-42AD-BE78-72B071D8CD6A")
}

function AH1Z:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found AH1Z Blueprint!!!")
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_ChassisComponentData = s_VehicleEntityData.components[1] :: ChassisComponentData
    local s_VehicleConfigData = s_ChassisComponentData.vehicleConfig :: VehicleConfigData
    s_VehicleConfigData.inertiaOverride.x = 35440
    s_VehicleConfigData.inertiaOverride.y = 72800
    s_VehicleConfigData.inertiaOverride.z = 4475
    s_VehicleConfigData.inertiaModifier.x = 1
    s_VehicleConfigData.inertiaModifier.y = 1
    s_VehicleConfigData.inertiaModifier.z = 1
end

partitions.onInstanceLoad(
    AH1ZBlueprint.partitionGuid,
    AH1ZBlueprint.instanceGuid,
    AH1Z,
    AH1Z.OnVehicleBlueprintLoad
)

return nil
