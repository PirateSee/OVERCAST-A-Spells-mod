local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
SetRandomSeed( x, y )
local types = {"pink","green","blue","orange"}
local rnd = Random(1, #types)
local firework_name = "firework_" .. tostring(types[rnd]) .. ".xml"
EntityLoad("data/entities/particles/fireworks/" .. firework_name, x, y)
EntityKill(entity_id)