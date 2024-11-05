--!strict
local partitions = require("./partitions")

local camo = {}

print("Hello World!")

local camo = {
  partitionGuid = Guid("30B3B1EE-40E9-450A-85C7-AE7220B6D3BC"),
  instanceGuid = Guid("9450E08E-8533-4908-81DD-29C8B0E5AE54")
}

function camo:OncamoLoad(p_camo: CamoUnlockAsset)
    print("***** Found camo Blueprint!!!") 
    p_camo.color1.x = 1
    p_camo.color2.y = 0
    p_camo.color3.z = 0
    p_camo.color4.w = 1
end

partitions.onInstanceLoad(
    camo.partitionGuid,
    camo.instanceGuid,
    camo,
    camo.OncamoLoad
)

return nil