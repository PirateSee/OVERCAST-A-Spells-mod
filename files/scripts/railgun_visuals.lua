dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform(entity_id)

--EntityRemoveFromParent( entity_id )

local enemy_x, enemy_y = DEBUG_GetMouseWorld()

-- direction
local dir_x, dir_y = vec_sub(enemy_x, enemy_y, pos_x, pos_y)
dir_x,dir_y = vec_normalize(dir_x, dir_y)

-- get velocity and rotate it to align with ray
local vel_x = 300
local vel_y = 300
if vel_x == nil then return end
local speed = get_magnitude(vel_x, vel_y)

-- lerp direction and restore speed
vel_x,vel_y = vec_normalize(vel_x, vel_y)
vel_x = lerp(dir_x, vel_x, 1)
vel_y = lerp(dir_y, vel_y, 1)
vel_x,vel_y = vec_normalize(vel_x, vel_y)
vel_x = vel_x * speed
vel_y = vel_y * speed

local comp = EntityGetFirstComponent( entity_id, "VelocityComponent" )
ComponentSetValueVector2( comp, "mVelocity", vel_x, vel_y)

--[[local fx_comp = EntityGetComponent(entity_id, "ParticleEmitterComponent", "railgun_fx")

if dir_x > 0 then
	ComponentSetValue2(fx_comp[1], "y_pos_offset_min", -6)
	ComponentSetValue2(fx_comp[1], "y_pos_offset_max", -6)
	ComponentSetValue2(fx_comp[2], "y_pos_offset_min", 6)
	ComponentSetValue2(fx_comp[2], "y_pos_offset_max", 6)
else
	ComponentSetValue2(fx_comp[1], "y_pos_offset_min", 6)
	ComponentSetValue2(fx_comp[1], "y_pos_offset_max", 6)
	ComponentSetValue2(fx_comp[2], "y_pos_offset_min",-6)
	ComponentSetValue2(fx_comp[2], "y_pos_offset_max", -6)
end]]