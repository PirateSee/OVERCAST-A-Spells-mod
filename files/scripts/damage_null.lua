local entity_id = GetUpdatedEntityID()

local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

ComponentSetValue2(comp, "damage", 0)