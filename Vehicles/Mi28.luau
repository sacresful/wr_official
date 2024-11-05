--!strict
local partitions = require("./partitions")

local Mi28 = {}

print("Mod initialized")

local Mi28Blueprint = {
  partitionGuid = Guid("89BE53B6-2FF4-11DE-8C23-DAB1D69416DE"),
  instanceGuid = Guid("89BEA1D6-2FF4-11DE-8C23-DAB1D69416DE")
}

function Mi28:OnVehicleBlueprintLoad(p_VehicleBlueprint: VehicleBlueprint)
    print("***** Found Mi28 Blueprint!!!")
    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
    local s_Components = s_VehicleEntityData.components
    local s_Index = s_Components[1]
    local s_VehicleComponentData = s_Index :: VehicleComponentData
    local s_Componentss = s_VehicleComponentData.components
    local s_CompnentIndex11 = s_Componentss[11]
    local s_CompnentIndex12 = s_Componentss[12]
    local s_CompnentIndex13 = s_Componentss[13]
    local s_CompnentIndex9 = s_Componentss[10]
    local s_WingComponentData10 = s_CompnentIndex11 :: WingComponentData
    local s_WingComponentData11 = s_CompnentIndex12 :: WingComponentData
    local s_WingComponentData12 = s_CompnentIndex13 :: WingComponentData
    local s_EngineComponentData = s_CompnentIndex9 :: EngineComponentData
    local s_PropellerEngineData = s_EngineComponentData.config :: PropellerEngineConfigData
    s_PropellerEngineData.horisontalMinEffectMod = 0.5
--    local s_VehicleEntityData = p_VehicleBlueprint.object :: VehicleEntityData
--    local s_VehicleEntityDataComponents = s_VehicleEntityData.components
--    local s_VehicleComponentData = s_VehicleEntityDataComponents[0] :: VehicleComponentData
--    local s_VehicleComponentDataComponents = s_VehicleComponentData.components
--    local s_WingComponentData10 = s_VehicleComponentDataComponents[10] :: WingComponentData
--    local s_WingComponentData11 = s_VehicleComponentDataComponents[11] :: WingComponentData
--    local s_WingComponentData12 = s_VehicleComponentDataComponents[12] :: WingComponentData

 -- Mi28.WingComponentData10 = AH1Z.WingComponentData11 TECHNICALLY
 -- Mi28.WingComponentData11 = AH1Z.WingComponentData10 TECHNICALLY
 -- Mi28.WingComponentData12 = AH1Z.WingComponentData12 TECHNICALLY
 -- This above might be completely wrong, that's where values were most similiar aka: lift 18 is in both 11 and 10, lift 5.3 is the same in 12 and 12.

    -- Might need to change WingComponentData11 and WingComponentData12, no idea which one is proper one. Although only change is dragrotationmodifier
    s_WingComponentData11.config.lift = 5.3
    s_WingComponentData11.config.drag = 2.65
    s_WingComponentData11.config.dragRotationModifier = 1.1
    s_WingComponentData11.config.flapTurnSpeed = 1
    s_WingComponentData11.config.visualFlapTurnSpeed = 1
    s_WingComponentData11.config.visualFlapAngleLimit = 90
    -- Makes wingcomponentdata10 match the values of wingcomponentdata11 in AH1Z
    s_WingComponentData10.config.lift = 18
    s_WingComponentData10.config.drag = 10
    s_WingComponentData10.config.dragRotationModifier = 1
    s_WingComponentData10.config.flapTurnSpeed = 1
    s_WingComponentData10.config.visualFlapTurnSpeed = 1
    s_WingComponentData10.config.visualFlapAngleLimit = 90

    s_WingComponentData12.config.lift = 5.3
    s_WingComponentData12.config.dragRotationModifier = 1
    s_WingComponentData12.config.flapTurnSpeed = 1
    s_WingComponentData12.config.visualFlapTurnSpeed = 1
    s_WingComponentData12.config.visualFlapAngleLimit = 90
end

partitions.onInstanceLoad(
    Mi28Blueprint.partitionGuid,
    Mi28Blueprint.instanceGuid,
    Mi28,
    Mi28.OnVehicleBlueprintLoad
)

return nil

-- Differences:
-- AH1Z - 
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.Input.ThrottleInertiaOutDuration 1.20 instead of 1.25
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.Input.ThrottleInertiaInDuration 1.20 instead of 1.25
-- Z-10W - 
    --  WingComponentData in Z10W and AH1Z is the same. Just in different order. 5.3 -> 18 -> 5.3, and i think 5.3 -> 5.3 -> 18
    --
-- Mi28 -
    -- Compared to z10 and ah1z ->
    -- WingComponentDatas are different. There are 3 of them and all of them dont match z10s or vipers.
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.EngineComponentData[9].HorisontalMinEffect 0.65 instead of 0.5
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].Lift 18 instead of 5.3
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].Drag 3 instead of 2.65
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].DragRotationModifier 1 instead of 1.1
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].FlapTurnSpeed 0 instead of 1
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].VisualFlapTurnSpeed 0 instead of 1
    -- VehicleEntityData.ChassisComponentData.VehicleConfig.WingComponentData[10].VisualFlapAngleLimit 0 instead of 90
    -- Center of mass is different, some other chassiscomponentdata values are different, although theyre different for all 3 helicopters. Z10 does not feel that different from viper.
    -- In physics data AngularVelocityDamping and LinearVelocityDamping is the same value of Friction and restitution, meanwhile viper has it set to -1