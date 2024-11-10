--!strict
-- test
local partitions = require("./partitions")

local WeaponProjectile = {}

print("Mod initialized")

local WeaponProjectileLod = {
  partitionGuid = Guid("8F7B512E-C8B7-4EB3-B01B-280D0C215310"),
  instanceGuid = Guid("2DF8548D-2489-47E4-B606-5D423075BA66")
}

function WeaponProjectile:OnMeshLodGroupLoad(p_MeshLodGroup: MeshLodGroup)
    print("***** Found WeaponProjectile Blueprint!!!") 
    p_MeshLodGroup.lod1Distance = 1000
    p_MeshLodGroup.lod2Distance = 3000
    p_MeshLodGroup.lod3Distance = 6000
    p_MeshLodGroup.lod4Distance = 10000
    p_MeshLodGroup.lod5Distance = 14000
    p_MeshLodGroup.lod6Distance = 18000
end

partitions.onInstanceLoad(
    WeaponProjectileLod.partitionGuid,
    WeaponProjectileLod.instanceGuid,
    WeaponProjectile,
    WeaponProjectile.OnMeshLodGroupLoad
)

return nil