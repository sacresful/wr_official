local partitions = require("./partitions")

local Tow = {}

print("Hello World!")

local TowBlueprint = {
  partitionGuid = Guid("8E341E03-FC52-42FF-BF60-0ECCE7641237"),
  instanceGuid = Guid("0B7AC09F-E5EA-490B-B46A-FC18ADE468B6")
}

function Tow:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found Tow Blueprint!!!")
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    s_fireLogic = s_FiringFunctionData.fireLogic
    local s_Ammo = s_FiringFunctionData.ammo
    local s_Shot = s_FiringFunctionData.shot
    local s_ProjectileData = s_Shot.projectileData
    s_ProjectileData.timeToLive = 50
    s_Ammo.magazineCapacity = 8
    s_Ammo.numberOfMagazines = 8
    s_Shot.initialSpeed.z = 1000
    s_fireLogic.rateOfFire = 1000
    s_fireLogic.holdAndRelease.maxHoldTime = 30
    s_Ammo.traceFrequency = 0.1
end

partitions.onInstanceLoad(
    TowBlueprint.partitionGuid,
    TowBlueprint.instanceGuid,
    Tow,
    Tow.OnWeaponFiringDataAssetLoad
)

return nil