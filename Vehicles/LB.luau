--!strict
local partitions = require("./partitions")

local LB = {}

print("Hello World!")

local LBVehicleBlueprint = {
  partitionGuid = Guid("FD8AB747-FF4D-11DD-A7B1-F7C6DEEC9D32"),
  instanceGuid = Guid("FD8AB748-FF4D-11DD-A7B1-F7C6DEEC9D32")
}

function LB:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found LB Blueprint!!!") 
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_Components = s_VehicleEntityData.components :: DataContainer
    local s_Index = s_Components[1]
    local s_ChassisComponentData = s_Index :: ChassisComponentData
    local s_Componentss = s_ChassisComponentData.components :: DataContainer
    local s_CompnentIndex = s_Componentss[21]
    local s_EngineComponentData = s_CompnentIndex :: EngineComponentData
    local s_PropellerEngineConfigData = s_EngineComponentData.config :: PropellerEngineConfigData
    local s_Boost = s_PropellerEngineConfigData.boost :: Boost
    local s_RotorParameters = s_PropellerEngineConfigData.rotorConfig :: RotorParameters
    s_Boost.forwardStrength = 30.0
    s_Boost.reverseStrength = 50.0
    s_Boost.accelerationScale = 5.0
    s_PropellerEngineConfigData.rpmMax = 10000.0
    s_PropellerEngineConfigData.enginePowerMultiplier = 100.0
    s_PropellerEngineConfigData.internalAccelerationFactor = 20.0
    s_RotorParameters.collectiveThrottleInputScale = 30
end

partitions.onInstanceLoad(
    LBVehicleBlueprint.partitionGuid,
    LBVehicleBlueprint.instanceGuid,
    LB,
    LB.OnVehicleBlueprintLoad
)

return nil