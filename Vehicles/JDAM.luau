--!strict
local partitions = require("./partitions")

local JDAM = {}

print("Hello World!")

local JDAMProjectileBlueprint = {
  partitionGuid = Guid("C44CE6A9-8CF7-4D9E-8968-88C1895A7A72"),
  instanceGuid = Guid("0D322435-5789-4B44-9A39-B8546E30670F")
}

function JDAM:OnWeaponFiringDataAssetLoad(p_WeaponFiringDataAsset: WeaponFiringDataAsset)
    print("***** Found JDAM Blueprint!!!")
    local s_WeaponFiringData = p_WeaponFiringDataAsset.data :: WeaponFiringData
    local s_FiringFunctionData = s_WeaponFiringData.primaryFire
    local s_Ammo = s_FiringFunctionData.ammo
    s_Ammo.magazineCapacity = 10
end

partitions.onInstanceLoad(
    JDAMProjectileBlueprint.partitionGuid,
    JDAMProjectileBlueprint.instanceGuid,
    JDAM,
    JDAM.OnWeaponFiringDataAssetLoad
)

return nil