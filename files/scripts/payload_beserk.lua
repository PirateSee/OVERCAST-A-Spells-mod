local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local dropper = EntityLoad("mods/cool_spell/files/actions/payload_beserk_dropper.xml", x, y)

EntityInflictDamage( dropper, 0.001, "NONE", "", "", 0, 0)