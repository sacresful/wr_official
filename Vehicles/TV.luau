--!strict
local partitions = require("./partitions")

local TV = {}

print("Hello World!")

local TVProjectileBlueprint = {
  partitionGuid = Guid("B0ABD608-1E4E-4F82-9742-BED2CEC60940"),
  instanceGuid = Guid("5AB2A0BF-556D-409D-B10F-F8C66FED4B07")
}

function TV:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found TV Blueprint!!!") 
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Shot = s_FiringFunctionData.shot
    local s_Ammo = s_FiringFunctionData.ammo
    local s_Firelogic = s_FiringFunctionData.fireLogic
    s_Firelogic.reloadTime = 0.1
    s_WeaponFiringData.deployTime = 0
    s_Ammo.magazineCapacity = 40
    s_Ammo.numberOfMagazines = 40
    s_Shot.initialPosition.x = -10

end

partitions.onInstanceLoad(
    TVProjectileBlueprint.partitionGuid,
    TVProjectileBlueprint.instanceGuid,
    TV,
    TV.OnWeaponFiringDataAssetLoad
)

return nil