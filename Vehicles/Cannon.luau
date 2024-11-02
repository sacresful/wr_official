local partitions = require("./partitions")

local Cannon = {}

print("Hello World!")

local CannonBlueprint = {
  partitionGuid = Guid("0A232494-FB58-496E-BF30-FD9B39E12008"),
  instanceGuid = Guid("E4E1695E-E1BA-4940-B5FA-E1D72927CBBD")
}

function Cannon:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found Cannon Blueprint!!!")
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Ammo = s_FiringFunctionData.ammo
    local s_Shot = s_FiringFunctionData.shot
    local s_FireLogic = s_FiringFunctionData.fireLogic
    s_FireLogic.rateOfFire = 1000
    s_Ammo.numberOfMagazines = 10
    s_Ammo.magazineCapacity = 60
    s_Shot.numberOfBulletsPerShot = 3
    s_Shot.numberOfBulletsPerShell = 3
end

partitions.onInstanceLoad(
    CannonBlueprint.partitionGuid,
    CannonBlueprint.instanceGuid,
    Cannon,
    Cannon.OnWeaponFiringDataAssetLoad
)

return nil