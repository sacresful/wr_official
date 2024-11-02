--!strict
local partitions = require("./partitions")

local dawnbreaker = {}

print("Hello World!")

local dawnbreakerLevelData = {
  partitionGuid = Guid("972A5295-143C-4C62-A706-0A63B966BD75"),
  instanceGuid = Guid("E76C3D2F-396C-4371-B2EE-7889015715E0")
}

function dawnbreaker:OndawnbreakerLevelDataLoad(p_dawnbreakerLevelData: SubWorldData)
    print("***** Found dawnbreakerLevelData Blueprint!!!") 
    local s_linkConnections = p_dawnbreakerLevelData.linkConnections
    local s_linkConnection = s_linkConnections[24].target :: DataContainer
end

partitions.onInstanceLoad(
    dawnbreakerLevelData.partitionGuid,
    dawnbreakerLevelData.instanceGuid,
    dawnbreaker,
    dawnbreaker.OndawnbreakerLevelDataLoad
)

return nil