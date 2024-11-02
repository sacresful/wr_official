--!strict
local partitions = require("./partitions")

local JDAM2 = {}

print("Hello World!")

local JDAM2ProjectileBlueprint = {
  partitionGuid = Guid("575E8F27-30DC-4A9C-81FC-A8C3634B8A30"),
  instanceGuid = Guid("2EE31CD7-5494-4169-8715-27721D3EEAA9")
}

function JDAM2:OnVehicleBlueprintLoad(p_ProjectileBlueprint: ProjectileBlueprint)
    print("***** Found JDAM2 Blueprint!!!") 
    local s_MissileEntityData = p_ProjectileBlueprint.object :: MissileEntityData
    local s_VeniceExplosionEntityData = s_MissileEntityData.explosion
    s_VeniceExplosionEntityData.blastRadius = 1000
end

partitions.onInstanceLoad(
    JDAM2ProjectileBlueprint.partitionGuid,
    JDAM2ProjectileBlueprint.instanceGuid,
    JDAM2,
    JDAM2.OnVehicleBlueprintLoad
)

return nil