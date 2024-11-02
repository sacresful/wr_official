--!strict
local partitions = require("./partitions")

local CannonJet = {}

print("Hello World!")

local CannonJetProjectileBlueprint = {
  partitionGuid = Guid("6C16C155-8766-4DF6-9143-008B52BD509E"),
  instanceGuid = Guid("A84812ED-6720-413C-92C3-EBC708223883")
}

function CannonJet:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found CannonJet Blueprint!!!") 
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    s_FiringFunctionData.fireLogic.rateOfFire = 2000
end

partitions.onInstanceLoad(
    CannonJetProjectileBlueprint.partitionGuid,
    CannonJetProjectileBlueprint.instanceGuid,
    CannonJet,
    CannonJet.OnWeaponFiringDataAssetLoad
)

return nil