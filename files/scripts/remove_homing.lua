local entity_id = GetUpdatedEntityID()

local homing_comp = EntityGetComponent(entity_id, "HomingComponent")

if homing_comp ~= nil then
	for i,v in ipairs(homing_comp) do
		EntityRemoveComponent(entity_id, v)
	end
end

local lua_comp = EntityGetComponent(entity_id, "LuaComponent")

if lua_comp ~= nil then
	for i,v in ipairs(lua_comp) do
		local script = ComponentGetValue2(lua_comp, "script_source_file")
		print(tostring(script))
		if script == "data/scripts/projectiles/disc_bullet_big_trajectory.lua" or script == "data/scripts/projectiles/autoaim.lua" or script == "data/scripts/projectiles/homing_accelerating.lua" or script == "data/scripts/projectiles/homing_area.lua" or script == "data/scripts/projectiles/homing_cursor.lua" or script == "data/scripts/projectiles/homing_projectile.lua" then
			EntityRemoveComponent(entity_id, v)
		end
	end
end