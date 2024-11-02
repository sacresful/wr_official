--!strict
local partitions = require("./partitions")

local M1A2 = {}

print("Hello World!")

local M1A2VehicleBlueprint = {
  partitionGuid = Guid("B069BA89-EECF-11DD-8117-9421284A74E5"),
  instanceGuid = Guid("B06A08AB-EECF-11DD-8117-9421284A74E5")
}

function M1A2:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found M1A2 Blueprint!!!") 
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_VehicleComponentData = s_VehicleEntityData.components[0]
end

partitions.onInstanceLoad(
    M1A2VehicleBlueprint.partitionGuid,
    M1A2VehicleBlueprint.instanceGuid,
    M1A2,
    M1A2.OnVehicleBlueprintLoad
)

return nil