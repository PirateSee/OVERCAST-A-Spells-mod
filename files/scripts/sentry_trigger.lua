local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local targets = EntityGetInRadiusWithTag( x, y, 32, "mortal" )

if targets[1] ~= nil then
	EntityKill(entity_id)
end