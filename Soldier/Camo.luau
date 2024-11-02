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
    local s_color1 = p_camo.color1 
    local s_color2 = p_camo.color2
    local s_color3 = p_camo.color3
    local s_color4 = p_camo.color4
    s_color1 = Vec4[1.0]
    s_color2 = Vec4[1.0]
    s_color3 = Vec4[1.0]
    s_color4 = Vec4[1.0]
end

partitions.onInstanceLoad(
    camo.partitionGuid,
    camo.instanceGuid,
    camo,
    camo.OncamoLoad
)

return nil