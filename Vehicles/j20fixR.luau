-- made by hieb, fixes j20
--local multi = require("multi")
--added:
local partitions = require("./partitions")

--loads J20
local Vehicle_J20= {}
Vehicle_J20.__index = Vehicle_J20
local J20 = Vehicle_J20
 
function J20:on_load(jet: VehicleBlueprint)
    
    print("J20 turning speed normalized")

    local m_jet = jet.object :: VehicleEntityData

    local m_jet_chassis: ChassisComponentData = m_jet.components[1] :: ChassisComponentData

    --normalizes center of mass to bring in line with F35, SU50
    m_jet_chassis.vehicleConfig.centerOfMass.z = 0

end

--multi.onMultiLoad(J20, J20.on_load,
--{partition = Guid("CF28AAE9-0C74-4FA9-9C0E-2B81ADA0E6D4"), instance = Guid("9C764397-C909-4456-8B53-811C64760156")})



partitions.onAllInstancesLoaded(J20, J20.on_load,
{partition = Guid("CF28AAE9-0C74-4FA9-9C0E-2B81ADA0E6D4"), instance = Guid("9C764397-C909-4456-8B53-811C64760156")})

return nil