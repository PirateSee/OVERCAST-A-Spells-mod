local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

EntityLoad("mods/cool_spell/files/actions/decaburst_gfx.xml", x , y)