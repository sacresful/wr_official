--!strict
local partitions = require("./partitions")

local dawnbreaker = {}

print("Hello World!")

local dawnbreakerLevelData = {
  partitionGuid = Guid("7FF012A2-206A-49E4-88DF-78532D1D61D5"),
  instanceGuid = Guid("75C515EC-0123-4AC7-819A-C1C549AE0F41")
}

function dawnbreaker:OndawnbreakerLevelDataLoad(p_dawnbreakerLevelData: LevelData)
    print("***** Found dawnbreakerLevelData Blueprint!!!") 
    local s_maxVehicleHeight = p_dawnbreakerLevelData.maxVehicleHeight
    s_maxVehicleHeight = 25000
end

partitions.onInstanceLoad(
    dawnbreakerLevelData.partitionGuid,
    dawnbreakerLevelData.instanceGuid,
    dawnbreaker,
    dawnbreaker.OndawnbreakerLevelDataLoad
)

return nil