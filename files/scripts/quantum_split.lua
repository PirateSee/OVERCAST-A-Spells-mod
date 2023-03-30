dofile_once("data/scripts/lib/utilities.lua")

local angle = 90*math.pi/180
local slowdown = 1

local entity_id    = EntityGetRootEntity( GetUpdatedEntityID() )
local pos_x, pos_y = EntityGetTransform( entity_id )

local storage_comp = get_variable_storage_component(entity_id, "projectile_file")
if not storage_comp then return end
projectile_file = ComponentGetValue2( storage_comp, "value_string" )

local vel_x, vel_y = GameGetVelocityCompVelocity(entity_id)

-- left
local vx, vy = vec_rotate(vel_x, vel_y, -angle)
vx, vy = vec_mult(vx, vy, slowdown)
local left_id = shoot_projectile_from_projectile( entity_id, projectile_file, pos_x, pos_y, vx, vy )
EntityLoadToEntity("data/entities/misc/quantum_split_fx_red.xml", left_id)
EntityAddTag( left_id, "quantum_red" ) -- for death fx
EntityAddTag( left_id, "projectile_cloned" )

-- right
vx, vy = vec_rotate(vel_x, vel_y, angle)
vx, vy = vec_mult(vx, vy, slowdown)
local right_id = shoot_projectile_from_projectile( entity_id, projectile_file, pos_x, pos_y, vx, vy )
EntityLoadToEntity("data/entities/misc/quantum_split_fx_blue.xml", right_id)
EntityAddTag( right_id, "quantum_blue" ) -- for death fx
EntityAddTag( right_id, "projectile_cloned" )

-- back
vx, vy = vec_rotate(vel_x, vel_y, angle*2)
vx, vy = vec_mult(vx, vy, slowdown)
local back_id = shoot_projectile_from_projectile( entity_id, projectile_file, pos_x, pos_y, vx, vy )
EntityLoadToEntity("mods/cool_spell/files/actions/quantum_split_fx_green.xml", back_id)
EntityAddTag( back_id, "quantum_green" ) -- for death fx
EntityAddTag( back_id, "projectile_cloned" )

-- nerf clones by removing things that may stack damage (edit: allow projectiles to penetrate terrain, since otherwise this spell would be pretty useless)
local function modify_projectile(e)
	local projectile_comp = EntityGetFirstComponent( e, "ProjectileComponent")
	component_readwrite( projectile_comp, { penetrate_entities = false }, function(comp)
		comp.penetrate_entities = false
	end)
end
modify_projectile(left_id)
modify_projectile(right_id)
modify_projectile(back_id)

-- quantum entanglement
local function add_quantum_entity_ref(id, next_id)
	EntityAddComponent( id, "VariableStorageComponent", 
	{ 
		name = "next_quantum_entity",
		value_int = next_id,
	})
	EntityAddComponent( id, "LuaComponent", 
	{ 
		script_source_file="mods/cool_spell/files/scripts/quantum_split_kill.lua",
		execute_on_removed=1,
		execute_every_n_frame=-1,
	})
end
add_quantum_entity_ref(entity_id, left_id)
add_quantum_entity_ref(left_id, right_id)
add_quantum_entity_ref(right_id, back_id)
add_quantum_entity_ref(back_id, entity_id)



