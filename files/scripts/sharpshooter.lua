local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local plr = EntityGetInRadiusWithTag(x, y, 144, "player_unit")

if plr[1] == nil then
	local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

	local slice = ComponentObjectGetValue2(comp, "damage_by_type", "slice")
	ComponentObjectSetValue2(comp, "damage_by_type", "slice", slice + 0.3)
	local script_comp = EntityGetFirstComponent(entity_id, "LuaComponent", "sharpshooter_comp")
	EntityRemoveComponent(entity_id, script_comp)
	EntityLoad("mods/cool_spell/files/actions/sharpshooter_gfx.xml", x, y)
end