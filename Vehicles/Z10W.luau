--!strict
local partitions = require("./partitions")

local Z10W = {}

print("Mod initialized")

local Z10WBlueprint = {
  partitionGuid = Guid("60CEA49A-F360-11E1-B652-E40E5ECB9A29"),
  instanceGuid = Guid("92590DD2-0AD0-0BE8-9522-590C0A7605FA")
}

function Z10W:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found Z10W Blueprint!!!")
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_ChassisComponentData = s_VehicleEntityData.components[1] :: ChassisComponentData
    local s_VehicleConfigData = s_ChassisComponentData.vehicleConfig :: VehicleConfigData
    s_VehicleConfigData.inertiaOverride.x = 0
    s_VehicleConfigData.inertiaOverride.y = 0
    s_VehicleConfigData.inertiaOverride.z = 0
    s_VehicleConfigData.inertiaModifier.x = 1.19
    s_VehicleConfigData.inertiaModifier.y = 2.325
    s_VehicleConfigData.inertiaModifier.z = 1.17
end

partitions.onInstanceLoad(
    Z10WBlueprint.partitionGuid,
    Z10WBlueprint.instanceGuid,
    Z10W,
    Z10W.OnVehicleBlueprintLoad
)

return nil
