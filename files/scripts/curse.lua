local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
SetRandomSeed( x, y+entity_id )

if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "HomingComponent",
    {
		target_who_shot="1",
		homing_targeting_coeff="15.0",
		homing_velocity_multiplier="0.9",
		detect_distance="250",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/chaotic_arc.lua",
		execute_every_n_frame="4",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/line_arc.lua",
		execute_every_n_frame="1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "SineWaveComponent",
    {
		_enabled="1",
		sinewave_freq="0.8",
		sinewave_m="0.8",
		lendetime="-1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/avoiding_arc.lua",
		execute_every_n_frame="3",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/bounce_spark.lua",
		execute_every_n_frame="1",
		execute_times="1",
		remove_after_executed="1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/decelerating_shot.lua",
		execute_every_n_frame="1",
		remove_after_executed="1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/autoaim.lua",
		execute_every_n_frame="1",
		remove_after_executed="1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/clipping_shot.lua",
		execute_every_n_frame="1",
		remove_after_executed="1",
    } )
end
if Random(1, 5) == 1 then
    EntityAddComponent( entity_id, "LuaComponent",
    {
		script_source_file="data/scripts/projectiles/spiraling_shot.lua",
		execute_every_n_frame="3",
    } )
end
EntityAddComponent( entity_id, "LuaComponent",
{
	script_source_file="data/scripts/projectiles/fizzle.lua",
	execute_every_n_frame="1",
	remove_after_executed="1",
} )