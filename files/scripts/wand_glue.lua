local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local wand = EntityGetClosestWithTag(x, y, "wand_glue")

EntityAddChild(wand, entity_id)