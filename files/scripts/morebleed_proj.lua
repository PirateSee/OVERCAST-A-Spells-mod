local entity_id = GetUpdatedEntityID()
local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")
ComponentSetValue2(comp, "blood_count_multiplier", 3)