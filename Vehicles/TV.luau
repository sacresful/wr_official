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
    s_Shot.initialSpeed.z = 900
end

partitions.onInstanceLoad(
    TVProjectileBlueprint.partitionGuid,
    TVProjectileBlueprint.instanceGuid,
    TV,
    TV.OnWeaponFiringDataAssetLoad
)

return nil