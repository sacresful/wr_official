--!strict
local partitions = require("./partitions")

local World = {}

print("Hello World!")

local World = {
  partitionGuid = Guid("64991A4A-4C5E-11DE-B1F5-FE435F0A1D8F"),
  instanceGuid = Guid("6F61313B-C996-C1CB-CE6F-34392F6CC1E1")
}

function World:OnMeshLodGroupLoad(p_MeshLodGroup: MeshLodGroup)
    print("***** Found World Blueprint!!!") 
    p_MeshLodGroup.lod1Distance = 1000
    p_MeshLodGroup.lod2Distance = 3000
    p_MeshLodGroup.lod3Distance = 6000
    p_MeshLodGroup.lod4Distance = 10000
    p_MeshLodGroup.lod5Distance = 14000
    p_MeshLodGroup.lod6Distance = 18000
end

partitions.onInstanceLoad(
    World.partitionGuid,
    World.instanceGuid,
    World,
    World.OnMeshLodGroupLoad
)

return nil