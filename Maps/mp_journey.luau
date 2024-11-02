--!strict
local partitions = require("./partitions")

local mp_journey = {}

print("Hello World!")

local mp_journeyLevelData = {
  partitionGuid = Guid("263720BF-50E3-11E2-95B6-FB13B3FA4278"),
  instanceGuid = Guid("3507B628-FF47-A85C-437D-4057CF0D0DBF")
}

function mp_journey:Onmp_journeyLevelDataLoad(p_maxVehicleHeight)
    print("***** Found mp_jourenyLevelData Blueprint!!!") 
    p_maxVehicleHeight = 200000
end

partitions.onInstanceLoad(
    mp_journeyLevelData.partitionGuid,
    mp_journeyLevelData.instanceGuid,
    mp_journey,
    mp_journey.Onmp_journeyLevelDataLoad
)

return nil