--!strict
local partitions = require("./partitions")

local AK12 = {}

print("Hello World!")

local AK12SoldierWeaponBlueprint = {
  partitionGuid = Guid("AE353FA9-58C8-41F0-B6FF-2E65C28D2D4A"),
  instanceGuid = Guid("286A045F-C526-4339-A0F5-5FA5FB681D20")
}

function AK12:OnWeaponBlueprintLoad(p_SoldierWeaponBlueprint: SoldierWeaponBlueprint)
    print("***** Found AK12 Blueprint!!!")
    local s_SoldierWeaponData = p_SoldierWeaponBlueprint.object :: SoldierWeaponData
    local s_WeaponFiringData = s_SoldierWeaponData.weaponFiring
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Shot = s_FiringFunctionData.shot
    s_Shot.initialSpeed.z = 50
end

partitions.onInstanceLoad(
    AK12SoldierWeaponBlueprint.partitionGuid,
    AK12SoldierWeaponBlueprint.instanceGuid,
    AK12,
    AK12.OnWeaponBlueprintLoad
)

return nil