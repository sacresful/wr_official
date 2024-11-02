--!strict
local partitions = require("./partitions")

local F35 = {}

print("Hello World!")

local F35VehicleBlueprint = {
  partitionGuid = Guid("EB06DA1E-4B21-11E0-AC22-92ED36F00269"),
  instanceGuid = Guid("3F18FCA6-A7D4-D3B5-28E5-44A5CAFFE6BE")
}

function F35:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found F35 Blueprint!!!") 
    local s_PropertyConnections = p_VehicleBlueprint.propertyConnections
    local s_EngineComponentData = s_PropertyConnections[99].source :: EngineComponentData
    local s_JetEngineConfigData = s_EngineComponentData.config
    local s_boost = s_JetEngineConfigData.boost
    s_JetEngineConfigData.rpmMax = 99999
    s_JetEngineConfigData.enginePowerMultiplier = 5
    s_boost.accelerationScale = 100
    s_boost.forwardStrength = 30
end

partitions.onInstanceLoad(
    F35VehicleBlueprint.partitionGuid,
    F35VehicleBlueprint.instanceGuid,
    F35,
    F35.OnVehicleBlueprintLoad
)

return nil