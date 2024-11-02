--!strict
local partitions = require("./partitions")

local M1A2 = {}

print("Hello World!")

local M1A2ProjectileBlueprint = {
  partitionGuid = Guid("3967F092-5858-42F6-90A3-9A800B7DAB1B"),
  instanceGuid = Guid("D1406A5C-D38B-4078-B9AE-AC88976AC565")
}

function M1A2:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found M1A2 Blueprint!!!") 
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Shot = s_FiringFunctionData.shot
    local s_BulletEntityData = s_Shot.projectileData
    s_FiringFunctionData.fireLogic.rateOfFire = 2000
    
end

partitions.onInstanceLoad(
    M1A2ProjectileBlueprint.partitionGuid,
    M1A2ProjectileBlueprint.instanceGuid,
    M1A2,
    M1A2.OnWeaponFiringDataAssetLoad
)

return nil