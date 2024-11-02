--!strict
local partitions = require("./partitions")

local Minigun = {}

print("Hello World!")

local MinigunProjectileBlueprint = {
  partitionGuid = Guid("15A6F4C7-1700-432B-95A7-D5DE8A058ED2"),
  instanceGuid = Guid("9DF635E5-C412-474A-AB09-B1F3F67ED8E7")
}

function Minigun:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found Minigun Blueprint!!!")
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Ammo = s_FiringFunctionData.ammo
    local s_Shot = s_FiringFunctionData.shot
    s_FiringFunctionData.fireLogic.rateOfFire = 8000
    s_FiringFunctionData.fireLogic.rateOfFireForBurst = 2000
    s_FiringFunctionData.fireLogic.clientFireRateMultiplier = 1.25
    s_Ammo.magazineCapacity = 1000
    s_Ammo.numberOfMagazines = 10
    s_FiringFunctionData.fireLogic.reloadTime = 0.5
end

partitions.onInstanceLoad(
    MinigunProjectileBlueprint.partitionGuid,
    MinigunProjectileBlueprint.instanceGuid,
    Minigun,
    Minigun.OnWeaponFiringDataAssetLoad
)

return nil