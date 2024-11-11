--!strict
-- 2v2 heli on flood zone
local partitions = require("./partitions")

local flood = {}

print("Mod initalized")

local floodWorldPartData = {
  partitionGuid = Guid("CBABA4FB-37CE-49A8-AE39-DFED34CD1ECB"),
  instanceGuid = Guid("A91C274A-89EF-4F6E-A846-84B00BC545AF")
}

local floodLevelData = {
  partitionGuid = Guid("143659F3-F125-11E1-B84F-E2C8B6C89FD7"),
  instanceGuid = Guid("21EEFF24-C31C-02F0-F0C1-7FC8C9BC04D1")
}

local AHSpatialPrefabBlueprintGuids = {
  partitionGuid = Guid("7D843B56-18C7-4E9D-ADBA-99BD16161B69"),
  instanceGuid = Guid("A5FD2A0A-6882-44B9-8E24-CCFF9421BA38")
}

function flood:OnfloodWorldPartDataLoad(p_floodWorldPartData: WorldPartData)
    print("***** Found floodWorldPartData Blueprint!!!") 
    local AHSpatialPrefabBlueprint= ResourceManager:findInstance(AHSpatialPrefabBlueprintGuids.partitionGuid, AHSpatialPrefabBlueprintGuids.instanceGuid)
    local s_ReferenceObjectData16 = p_floodWorldPartData.objects[17] :: ReferenceObjectData
    s_ReferenceObjectData16.blueprint = AHSpatialPrefabBlueprint:clone()
end

function flood:OnfloodLevelDataLoad(p_floodLevelData: LevelData)
  print("***** Found floodLevelData Blueprint!!!") 
  p_floodLevelData.maxVehicleHeight = 400
end

partitions.onInstanceLoad(
    floodWorldPartData.partitionGuid,
    floodWorldPartData.instanceGuid,
    flood,
    flood.OnfloodWorldPartDataLoad
)

partitions.onInstanceLoad(
    floodLevelData.partitionGuid,
    floodLevelData.instanceGuid,
    flood,
    flood.OnfloodLevelDataLoad
)

return nil