local entity_id = GetUpdatedEntityID()
local comp = EntityGetFirstComponent(entity_id, "AreaDamageComponent")
ComponentSetValue2(comp, "damage_per_frame", 0.1)