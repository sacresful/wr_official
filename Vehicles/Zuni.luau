local partitions = require("./partitions")

local Zuni = {}

print("Hello World!")

local ZuniBlueprint = {
  partitionGuid = Guid("0565AC82-0E48-4B83-BDA0-147FBDE5D6F8"),
  instanceGuid = Guid("AEC62A3B-5FA3-4D1C-9CA8-716DB51FC9AE")
}

function Zuni:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found Zuni Blueprint!!!")
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Ammo = s_FiringFunctionData.ammo
    local s_Shot = s_FiringFunctionData.shot
    s_Ammo.numberOfMagazines = 8
    s_Shot.initialSpeed.z = 2000
end

partitions.onInstanceLoad(
    ZuniBlueprint.partitionGuid,
    ZuniBlueprint.instanceGuid,
    Zuni,
    Zuni.OnWeaponFiringDataAssetLoad
)

return nil