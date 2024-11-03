--!strict
local partitions = require("./partitions")

local AH1Z = {}

print("Hello World!")

local AH1ZDataContainerAsset = {
  partitionGuid = Guid("257269BC-C239-4530-8EC3-50684E18DDB5"),
  instanceGuid = Guid("848EFB65-CED2-4C69-AE6E-969589BA9C45")
}

function AH1Z:OnCameraLoosePartPhysicsDataLoad(p_CameraLoosePartPhysicsData: CameraLoosePartPhysicsData)
    print("***** Found AH1Z Blueprint!!!")
    local s_FakeHingeData = p_CameraLoosePartPhysicsData.fakePhysics
    s_FakeHingeData.maxSpeed = 5
    s_FakeHingeData.mass = 5
end

partitions.onInstanceLoad(
    AH1ZDataContainerAsset.partitionGuid,
    AH1ZDataContainerAsset.instanceGuid,
    AH1Z,
    AH1Z.OnCameraLoosePartPhysicsDataLoad
)

return nil