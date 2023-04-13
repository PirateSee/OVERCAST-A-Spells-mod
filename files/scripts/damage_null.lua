local entity_id = GetUpdatedEntityID()

local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

GamePrint("nullfiying damage")

ComponentSetValue2(comp, "damage", 0)