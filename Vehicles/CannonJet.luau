--!strict
local partitions = require("./partitions")

local CannonJet = {}

print("Hello World!")

local CannonJetProjectileBlueprint = {
  partitionGuid = Guid("71B9175E-431B-405F-8E7A-6CA6745BEE47"),
  instanceGuid = Guid("6A9AE47F-F31C-4492-A4D5-66CA9D9391B4")
}

function CannonJet:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found CannonJet Blueprint!!!") 
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Shot = s_FiringFunctionData.shot
    s_Shot.projectileData =

end

partitions.onInstanceLoad(
    CannonJetProjectileBlueprint.partitionGuid,
    CannonJetProjectileBlueprint.instanceGuid,
    CannonJet,
    CannonJet.OnWeaponFiringDataAssetLoad
)

return nil