--!strict
local partitions = require("./partitions")

local siege = {}
local jet = {}

print("Mod initalized")

local siegeWorldPartData = {
  partitionGuid = Guid("B8CAC563-077B-4BC2-858F-E9715B69A12F"),
  instanceGuid = Guid("9C36A166-6E41-45D8-9F66-1480899DBEC6")
}

local jetSpatialPrefabBlueprintGuids = {
  partitionGuid = Guid("9DF7AED7-74E9-4EC6-B71E-AF11BD0FF302"),
  instanceGuid = Guid("2E2C354D-C53F-4A65-8691-1162024335A1")
}

function siege:OnsiegeLevelDataLoad(p_siegeWorldPartData: WorldPartData)
    print("***** Found siegeWorldPartData Blueprint!!!") 
    local jetSpatialPrefabBlueprint= ResourceManager:findInstance(jetSpatialPrefabBlueprintGuids.partitionGuid, jetSpatialPrefabBlueprintGuids.instanceGuid)
    local s_ReferenceObjectData22 = p_siegeWorldPartData.objects[23] :: ReferenceObjectData
    s_ReferenceObjectData22.blueprint = jetSpatialPrefabBlueprint:clone()
end

partitions.onInstanceLoad(
    siegeWorldPartData.partitionGuid,
    siegeWorldPartData.instanceGuid,
    siege,
    siege.OnsiegeLevelDataLoad
)

return nil