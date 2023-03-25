local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

EntityLoad("mods/cool_spell/files/actions/select_closest.xml", x, y)