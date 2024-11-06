--!strict
local partitions = require("./partitions")

local Mi28 = {}
local AH1Z = {}

print("Mod initialized")

local Mi28Blueprint = {
  partitionGuid = Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"),
  instanceGuid = Guid("89BEA1D6-2FF4-11DE-8C23-DAB1D69416DE")
}

local AH1ZBlueprint = {
    partitionGuid = Guid("643135EA-6CA7-11DF-B6FA-F715AA601362"),
    instanceGuid = Guid("A676D498-A524-42AD-BE78-72B071D8CD6A")
}

function AH1Z:OnVehicleBlueprintLoad(p_VehicleBlueprintViper: VehicleBlueprint)
    print("***** Found AH1Z Blueprint!!!")
end

function Mi28:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found Mi28 Blueprint!!!")
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_Mi28ChassisComponentData = s_VehicleEntityData.components[1] :: ChassisComponentData
    s_Mi28ChassisComponentData = AH1Z.VehicleBlueprint.object.components[1]
end

partitions.onInstanceLoad(
    AH1ZBlueprint.partitionGuid, 
    AH1ZBlueprint.instanceGuid, 
    AH1Z,
    AH1Z.OnVehicleBlueprintLoad
)

partitions.onInstanceLoad(
    Mi28Blueprint.partitionGuid, 
    Mi28Blueprint.instanceGuid, 
    Mi28,
    Mi28.OnVehicleBlueprintLoad
)

return nil
