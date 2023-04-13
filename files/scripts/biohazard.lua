local entity_id = GetUpdatedEntityID()

local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

ComponentObjectSetValue2(comp, "damage_by_type", "radioactive", ComponentObjectGetValue2(comp, "damage_by_type", "radioactive") + 0.2)