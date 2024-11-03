--!strict
local partitions = require("./partitions")

local AH1Z = {}

print("Hello World!")

local AH1ZBFUICppScreenData = {
  partitionGuid = Guid("DA0A105C-6A5B-4CE2-AFC7-ADFD35E789E2"),
  instanceGuid = Guid("4EE2F218-0150-4C95-99B8-DB711F20E0A0")
}

function AH1Z:OnBFUICppScreenDataLoad(p_BFUICppScreenData: BFUICppScreenData)
    print("***** Found AH1Z Blueprint!!!")
    p_BFUICppScreenData.fieldOfView = 90
    
end

partitions.onInstanceLoad(
    AH1ZBFUICppScreenData.partitionGuid,
    AH1ZBFUICppScreenData.instanceGuid,
    AH1Z,
    AH1Z.OnBFUICppScreenDataLoad
)

return nil