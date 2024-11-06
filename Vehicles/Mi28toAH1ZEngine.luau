--!strict
local partitions = require("./partitions")

local Mi28 = {}

print("Mod initialized")

local Mi28Blueprint = {
  partitionGuid = Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"),
  instanceGuid = Guid("89BEA1D6-2FF4-11DE-8C23-DAB1D69416DE")
}

local AH1ZGuids = {
    partitionGuid = Guid("643135EA-6CA7-11DF-B6FA-F715AA601362"),
    instanceGuid = Guid("A676D498-A524-42AD-BE78-72B071D8CD6A")
}

function Mi28:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found Mi28 Blueprint!!!")
    local ah1zBlueprint = ResourceManager:findInstance(AH1ZGuids.partitionGuid, AH1ZGuids.instanceGuid)
    local s_AH1ZVehicleEntityData = ah1zBlueprint.object :: VehicleEntityData
    local s_AH1ZChassisComponentData = s_AH1ZVehicleEntityData.components[1] :: ChassisComponentData
    local s_AH1ZEngineComponentData = s_AH1ZChassisComponentData.components[9] :: EngineComponentData
    local s_AH1ZEngineComponentData2 = s_AH1ZChassisComponentData.components[10] :: EngineComponentData

    local s_Mi28VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_Mi28VehicleComponentData = s_Mi28VehicleEntityData.components[1] :: VehicleComponentData
    s_Mi28VehicleComponentData.components[9] = s_AH1ZEngineComponentData:clone()
    s_Mi28VehicleComponentData.components[10] = s_AH1ZEngineComponentData2:clone()
end

partitions.onInstanceLoad(
    Mi28Blueprint.partitionGuid, 
    Mi28Blueprint.instanceGuid, 
    Mi28,
    Mi28.OnVehicleBlueprintLoad
)

return nil
