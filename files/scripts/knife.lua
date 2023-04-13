local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local plr = EntityGetInRadiusWithTag(x, y, 96, "player_unit")

if plr[1] == nil then
	local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

	GamePrint("out of range")
	local melee = ComponentObjectGetValue2(comp, "damage_by_type", "melee")
	ComponentObjectSetValue2(comp, "damage_by_type", "melee", melee - 0.3)
	local script_comp = EntityGetFirstComponent(entity_id, "LuaComponent", "knife_comp")
	EntityRemoveComponent(entity_id, script_comp)
	EntityLoad("mods/cool_spell/files/actions/knife_gfx.xml", x, y)
end