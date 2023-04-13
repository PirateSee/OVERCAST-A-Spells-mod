local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

EntityLoad("mods/cool_spell/files/actions/overcast_emitter_2.0.xml", x, y+30)