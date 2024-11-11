--!strict
-- fucking around with f35
local partitions = require("./partitions")

local F35 = {}

print("Hello World!")

local F35Blueprint = {
  partitionGuid = Guid("EB06DA1E-4B21-11E0-AC22-92ED36F00269"),
  instanceGuid = Guid("3F18FCA6-A7D4-D3B5-28E5-44A5CAFFE6BE")
}

function F35:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found F35 Blueprint!!!")
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_Components = s_VehicleEntityData.components 
    local s_Index = s_Components[1]
    local s_ChassisComponentData = s_Index :: ChassisComponentData
    local s_Componentss = s_ChassisComponentData.components 
    local s_CompnentIndex = s_Componentss[10]
    local s_EngineComponentData = s_CompnentIndex :: EngineComponentData
    local s_JetEngineConfigData = s_EngineComponentData.config :: JetEngineConfigData
    local s_Boost = s_JetEngineConfigData.boost :: Boost
    s_Boost.forwardStrength = 30.0
    s_Boost.reverseStrength = 50.0
    s_Boost.accelerationScale = 5.0
    s_JetEngineConfigData.maxVelocity = 1000.0
    s_JetEngineConfigData.rpmMax = 1000.0

end

partitions.onInstanceLoad(
    F35Blueprint.partitionGuid,
    F35Blueprint.instanceGuid,
    F35,
    F35.OnVehicleBlueprintLoad
)

return nil