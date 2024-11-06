--!strict
local partitions = require("./partitions")

local dawnbreaker = {}
local dawnbreakerVehicle = {}

print("Mod initalized")

local dawnbreakerLevelData = {
  partitionGuid = Guid("7FF012A2-206A-49E4-88DF-78532D1D61D5"),
  instanceGuid = Guid("75C515EC-0123-4AC7-819A-C1C549AE0F41")
}


function dawnbreaker:OndawnbreakerLevelDataLoad(p_dawnbreakerLevelData: LevelData)
    print("***** Found dawnbreakerLevelData Blueprint!!!") 
    local s_LevelDescription = p_dawnbreakerLevelData.levelDescription :: LevelDescription
    local s_LevelDescriptionComponent = s_LevelDescription.components[4] :: VeniceGameplayLevelDescriptionComponent
    p_dawnbreakerLevelData.maxVehicleHeight = 500
    s_LevelDescriptionComponent.defaultTeam1Faction = 2
    s_LevelDescriptionComponent.defaultTeam2Faction = 0
    s_LevelDescriptionComponent.defaultTeam3Faction = 2
    s_LevelDescriptionComponent.defaultTeam4Faction = 0    
end

local dawnbreakerVehicles= {
  partitionGuid = Guid("9DE76D85-910E-4A5B-8AF6-CD6F0E08CC2B"),
  instanceGuid = Guid("0F347E52-FBC3-431C-BB46-122104680C12")
}

function dawnbreakerVehicle:OndawnbreakerVehiclesDataLoad(p_dawnbreakerVehicles: WorldPartData)
    print("***** Found dawnbreakerVehicles Blueprint!!!") 
    local s_ReferenceObjectData28 = p_dawnbreakerVehicles.objects[29] :: ReferenceObjectData
    local s_ReferenceObjectData29 = p_dawnbreakerVehicles.objects[30] :: ReferenceObjectData
    s_ReferenceObjectData28.excluded = true
    s_ReferenceObjectData29.excluded = true
end

partitions.onInstanceLoad(
    dawnbreakerLevelData.partitionGuid,
    dawnbreakerLevelData.instanceGuid,
    dawnbreaker,
    dawnbreaker.OndawnbreakerLevelDataLoad
)
partitions.onInstanceLoad(
    dawnbreakerVehicles.partitionGuid,
    dawnbreakerVehicles.instanceGuid,
    dawnbreakerVehicles,
    dawnbreakerVehicle.OndawnbreakerVehiclesDataLoad
)

return nil