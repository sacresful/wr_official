--!strict
local partitions = require("./partitions")

local Effect = {}

print("Hello World!")

local EffectBlueprint = {
  partitionGuid = Guid("0BA82E71-B24F-40CF-94F3-110F096BE8BD"),
  instanceGuid = Guid("0232C4F9-8DB6-45CB-BCAC-D9447D8E459F")
}

function Effect:OnEffectBlueprintLoad()
    print("***** Found Effect Blueprint!!!") 
end

partitions.onInstanceLoad(
    EffectBlueprint.partitionGuid,
    EffectBlueprint.instanceGuid,
    Effect,
    Effect.OnEffectBlueprintLoad
)

return nil