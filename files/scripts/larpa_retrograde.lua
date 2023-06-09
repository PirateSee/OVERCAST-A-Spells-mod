dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = EntityGetRootEntity( GetUpdatedEntityID() )
local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )

local variablestorages = EntityGetComponent( entity_id, "VariableStorageComponent" )
local projectile_file = ""

if ( variablestorages ~= nil ) then
	for j,storage_id in ipairs(variablestorages) do
		local var_name = ComponentGetValue( storage_id, "name" )
		if ( var_name == "projectile_file" ) then
			projectile_file = ComponentGetValue2( storage_id, "value_string" )
		end
	end
end

if ( #projectile_file > 0 ) then
	local length = 1700
	local vel_x, vel_y = GameGetVelocityCompVelocity(entity_id)
	
	vel_x = vel_x * -1 + Random(-5, 5)
	vel_y = vel_y * -1 + Random(-5, 5)

	pos_x = pos_x + Random(-3, 3)
	pos_y = pos_y + Random(-3, 3)

	local eid = shoot_projectile_from_projectile( entity_id, projectile_file, pos_x, pos_y, vel_x, vel_y )
	EntityAddTag( eid, "projectile_cloned" )
end