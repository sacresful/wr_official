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
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_VehicleEntityDataComponents = s_VehicleEntityData.components
    local s_ChassisComponentData = s_VehicleEntityDataComponents[0] :: ChassisComponentData
    print("Vehicle Entity Data:", s_VehicleEntityData)
    print("Chassis Component Data:", s_ChassisComponentData)
 --   print("Gearbox Config:", s_GearboxConfig)

 --   local s_GearboxConfig = s_ChassisComponentData.gearboxConfig
 --   local s_ForwardGearSpeeds = s_GearboxConfig.forwardGearSpeeds

 --       s_ForwardGearSpeeds[0] = 90
  --      s_ForwardGearSpeeds[1] = 140
    --    s_ForwardGearSpeeds[2] = 180
     --   s_ForwardGearSpeeds[3] = 220
       -- s_ForwardGearSpeeds[4] = 260

end

partitions.onInstanceLoad(
    F35VehicleBlueprint.partitionGuid,
    F35VehicleBlueprint.instanceGuid,
    F35,
    F35.OnVehicleBlueprintLoad
)

return nil