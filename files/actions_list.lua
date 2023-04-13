local reflecting = true

overcast_actions = {}

table.insert( overcast_actions,
{
	id          = "OVERCAST_IMPULSE_BULLET",
	name 		= "Impulse Shot",
	description = "Shoves things around",
	sprite 		= "mods/cool_spell/files/icons/impulseshot.png",
	related_projectiles	= {"mods/cool_spell/files/actions/impulseshot.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3",
	spawn_probability                 = "2,1,0.5,0.25",
	price = 120,
	mana = 10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/impulseshot.xml")
		c.fire_rate_wait = c.fire_rate_wait + 7
		c.screenshake = c.screenshake + 0.8
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_IMPULSE_BULLET_TRIGGER",
	name 		= "Impulse Shot With Trigger",
	description = "Shoves things around, and casts another spell after contact",
	sprite 		= "mods/cool_spell/files/icons/impulseshot_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/impulseshot.xml", 1},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                         = "0,1,2,3,4",
	spawn_probability                   = "1,0.5,0.5,0.5,0.5",
	price = 120,
	mana = 10,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/impulseshot.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 7
		c.screenshake = c.screenshake + 0.8
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_GUNPOWDER_DUMP",
	name 		= "Gunpowder Dump",
	description = "Dumps a big lump of gunpowder",
	sprite 		= "mods/cool_spell/files/icons/gunpowder_dump.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "1,2,3,4",
	spawn_probability                 = "1,1,1,1",
	price = 280,
	mana = 120,
	max_uses = 4,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/gunpowder_dump.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SODIUM_DUMP",
	name 		= "Sodium Dump",
	description = "Dumps a big lump of sodium",
	sprite 		= "mods/cool_spell/files/icons/sodium_dump.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "3,4,5,6,7", 
	spawn_probability                 = "0.25,0.5,0.5,0.5,0.5", 
	price = 320,
	mana = 120,
	max_uses = 3,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/sodium_dump.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )

--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_FLAMMABLE_GAS_RELEASE",
	name 		= "Flammable Gas Rlease",
	description = "Releases a bunch of Flamable Gas",
	sprite 		= "mods/cool_spell/files/icons/flame_gas_release.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 160,
	mana = 90,
	max_uses = 5,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/flame_gas_release.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )]]-- --already in vanila
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_SOAP_BULLET",
	name 		= "Soap Lobber",
	description = "Cleans up liquids",
	sprite 		= "mods/cool_spell/files/icons/soap_bullet.png",
	related_projectiles	= {"mods/cool_spell/files/actions/soap_bullet.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2", -- LIGHT_BULLET
	spawn_probability                 = "2,1,0.5", -- LIGHT_BULLET
	price = 120,
	mana = 10,
	max_uses = 20,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/soap_bullet.xml")
		c.fire_rate_wait = c.fire_rate_wait + 10
		c.screenshake = c.screenshake + 0.2
	end,
} )]]-- --non-functional
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_TOUCH_SODIUM",
	name 		= "Touch of Sodium",
	description = "Turns everything in a small area (including you!) into sodium",
	sprite 		= "mods/cool_spell/files/icons/sodium_dump.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 160,
	mana = 90,
	max_uses = 10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/touch_sodium.xml")
		c.fire_rate_wait = c.fire_rate_wait + 10
	end,
} )]]-- --functional, but kinda dumb so i removed it
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_TOUCH_SOAP",
	name 		= "Soap Touch",
	description = "Cleans up stuff in a small radius",
	sprite 		= "mods/cool_spell/files/icons/soap_bullet.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 160,
	mana = 90,
	max_uses = 10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/touch_soap.xml")
		c.fire_rate_wait = c.fire_rate_wait + 10
	end,
} )]]-- --non-functional, somewhat replaced by Projectile Vacuum Field (VACUUM_MOD)
table.insert( overcast_actions,
{
	id          = "OVERCAST_MATERIAL_SODIUM",
	name 		= "Pinch of sodium",
	description = "Salty",
	sprite 		= "mods/cool_spell/files/icons/material_sodium.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 100,
	mana = 1,
	max_uses = 300,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/material_sodium.xml")
		c.fire_rate_wait = c.fire_rate_wait - 15
		current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_MATERIAL_GOLD",
	name 		= "Pinch of Gold",
	description = "Money!",
	sprite 		= "mods/cool_spell/files/icons/material_gold.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "0,1,2,3,4,5,6,10", 
	spawn_probability                 = "0.1,0.1,0.1,0.1,0.1,0.1,0.1", 
	price = 200,
	mana = 1,
	max_uses = 3,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/material_gold.xml")
		c.fire_rate_wait = c.fire_rate_wait - 15
		current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
	end,
} )]]-- --functional its just kind of dumb
table.insert( overcast_actions,
{
	id          = "OVERCAST_X_SHAPE",
	name 		= "Formation - Tetragon",
	description = "Casts 4 spells in a tetragon pattern",
	sprite 		= "mods/cool_spell/files/icons/x_shape.png",
	type 		= ACTION_TYPE_DRAW_MANY,
	spawn_level                       = "1,2,3,4,5", -- T_SHAPE
	spawn_probability                 = "0.4,0.4,0.4,0.4,0.4", -- T_SHAPE
	price = 120,
	mana = 3,
	action 		= function()
		draw_actions(4, true)
		c.pattern_degrees = 180
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_HAZARD_SPARKS",
	name 		= "Hazard Sparks",
	description = "Deploys long-lasting spark projectiles",
	sprite 		= "mods/cool_spell/files/icons/hazard_spark.png",
	related_projectiles	= {"mods/cool_spell/files/actions/hazard_spark.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3",
	spawn_probability                 = "0.5,0.5,0.5,1",
	price = 50,
	mana = 12,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/hazard_spark.xml")
		c.fire_rate_wait = c.fire_rate_wait + 7
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_HAZARD_SPARKS_TRIGGER",
	name 		= "Hazard Sparks with Trigger",
	description = "Deploys long-lasting spark projectiles that cast another spell after expiring",
	sprite 		= "mods/cool_spell/files/icons/hazard_spark_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/hazard_spark.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4",
	spawn_probability                 = "0.1,0.1,0.25,0.5,0.25",
	price = 50,
	mana = 15,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/hazard_spark.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 8
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_HAZARD_SPARKS_TIMER",
	name 		= "Hazard Sparks with Timer",
	description = "Deploys long-lasting spark projectiles that cast another spell after a short time",
	sprite 		= "mods/cool_spell/files/icons/hazard_spark_timer.png",
	related_projectiles	= {"mods/cool_spell/files/actions/hazard_spark.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4",
	spawn_probability                 = "0.1,0.1,0.25,0.5,0.25",
	price = 50,
	mana = 15,
	action 		= function()
		add_projectile_trigger_timer("mods/cool_spell/files/actions/hazard_spark.xml", 90, 1)
		c.fire_rate_wait = c.fire_rate_wait + 8
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SUCTION_FIELD",
	name 		= "Gravity Field",
	description = "Causes the projectile to pull things in like a black hole!",
	sprite 		= "mods/cool_spell/files/icons/suction_field.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/suction_field.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,3,4,5,6", -- AREA_DAMAGE
	spawn_probability                 = "0.5,0.5,0.5,0.5,0.5", -- AREA_DAMAGE
	price = 140,
	mana = 50,
	--max_uses = 100,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/suction_field.xml,"
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SLOW",
	name 		= "Slow down",
	description = "Decreases the speed at which a projectile flies through the air",
	sprite 		= "mods/cool_spell/files/icons/slow.png",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3", -- SPEED
	spawn_probability                 = "1,0.5,0.5", -- SPEED
	price = 60,
	mana = 2,
	--max_uses = 100,
	custom_xml_file = "data/entities/misc/custom_cards/decelerating_shot.xml",
	action 		= function()
		c.speed_multiplier = c.speed_multiplier * 0.5
		c.fire_rate_wait = c.fire_rate_wait - 8
		shot_effects.recoil_knockback = shot_effects.recoil_knockback - 5.0
		
		if ( c.speed_multiplier >= 20 ) then
			c.speed_multiplier = math.min( c.speed_multiplier, 20 )
		elseif ( c.speed_multiplier < 0 ) then
			c.speed_multiplier = 0
		end
	
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SHAPE_ALL",
	name 		= "Formation - Everything",
	description = "Casts all spells left on the wand in a circle",
	sprite 		= "mods/cool_spell/files/icons/all_shape.png",
	type 		= ACTION_TYPE_DRAW_MANY,
	spawn_level                       = "4,5,6,10",
	spawn_probability                 = "0.1,0.15,0.15,0.7",
	price = 400,
	mana = 20,
	max_uses = 40,
	action 		= function()
		current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 20
		if ( #deck > 0 ) then
			draw_actions( #deck, true )
		end
		c.pattern_degrees = 180
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_QUANTUM_CROSS",
	name 		= "Quantum Cross",
	description = "Splits into 4 entangled projectiles in a cross pattern",
	sprite 		= "data/ui_gfx/gun_actions/quantum_split.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/quantum_cross.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,3,4,5,6", -- MANA_REDUCE
	spawn_probability                 = "0.5,0.5,0.5,0.5,1", -- MANA_REDUCE
	price = 240,
	mana = 25,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/quantum_cross.xml,"
		c.fire_rate_wait = c.fire_rate_wait + 6
		draw_actions( 1, true )
	end,
} )]]-- --functional, but useless
table.insert( overcast_actions,
{
	id          = "OVERCAST_VACUUM_MOD",
	name 		= "Projectile Vacuum Field",
	description = "Causes the projectile to suck up liquids and powders as it travels, and then release them upon expiring.",
	sprite 		= "mods/cool_spell/files/icons/projectile_vacuum_field.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/suction_field.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,3,4,5,6", -- AREA_DAMAGE
	spawn_probability                 = "0.5,0.5,0.5,0.5,0.5", -- AREA_DAMAGE
	price = 140,
	mana = 50,
	max_uses = 80,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/liquid_vacuum.xml,"
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_LASER_SIGHT",
	name 		= "Laser Sight",
	description = "Adds a handy laser sight to the tip of your wand",
	sprite 		= "mods/cool_spell/files/icons/laser_sight.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "1,2,3,4,5", -- LASER
	spawn_probability                 = "0.5,0.5,0.5,0.5,0.5", -- LASER
	price = 60,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/laser_sight.xml",
	action 		= function()
		c.spread_degrees = c.spread_degrees - 3
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_LASER_SIGHT_GREEN",
	name 		= "Green Laser",
	description = "Adds a handy green laser sight to the tip of your wand",
	sprite 		= "mods/cool_spell/files/icons/laser_sight_green.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "1,2,3,4,5", -- LASER
	spawn_probability                 = "0.5,0.5,0.5,0.5,0.5", -- LASER
	price = 60,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/laser_green.xml",
	action 		= function()
		c.spread_degrees = c.spread_degrees - 3
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PASSIVE_DIGGING_LASER",
	name 		= "Passive Drill",
	description = "Causes the tip of your wand to constantly emit a mining ray. Harmless to creatures",
	sprite 		= "mods/cool_spell/files/icons/passive_drill.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "2,3,4,5", -- LASER
	spawn_probability                 = "0.5,0.5,0.5,0.5", -- LASER
	price = 60,
	mana = 10,
	custom_xml_file = "mods/cool_spell/files/actions/passive_digging_laser_new.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_IF_INVENTORY",
	name 		= "Requirement - Even Slot",
	description = "The next spell is skipped if your wand is not in the 2nd or 4th slot in your hotbar",
	sprite 		= "mods/cool_spell/files/icons/if_even_slot.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_maths",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "10", -- MANA_REDUCE
	spawn_probability                 = "1", -- MANA_REDUCE
	price = 100,
	mana = 0,
	action 		= function( recursion_level, iteration )
		local endpoint = -1
		local elsepoint = -1
		local doskip = false
		local EZWand = dofile_once("mods/cool_spell/lib/EZWand.lua") --life saver
		local entity_id = GetUpdatedEntityID()
		local wand = EZWand.GetHeldWand()
		if not reflecting then
			if wand ~= nil then
				local comp = EntityGetFirstComponentIncludingDisabled( wand.entity_id, "ItemComponent" )
				local slot = ComponentGetValue2( comp, "inventory_slot" )
				if ( slot == 0 or slot == 2) then
					doskip = true
					GamePrint("Not an even slot!")
				end
			else
				print_error("[IF_INVENTORY] held wand is nil")
			end
			
			if ( #deck > 0 ) then
				for i,v in ipairs( deck ) do
					if ( v ~= nil ) then
						if ( string.sub( v.id, 1, 3 ) == "IF_" ) and ( v.id ~= "IF_END" ) and ( v.id ~= "IF_ELSE" ) then
							endpoint = -1
							break
						end
						
						if ( v.id == "IF_ELSE" ) then
							endpoint = i
							elsepoint = i
						end
						
						if ( v.id == "IF_END" ) then
							endpoint = i
							break
						end
					end
				end
				
				local envelope_min = 1
				local envelope_max = 1
				
				if doskip then
					if ( elsepoint > 0 ) then
						envelope_max = elsepoint
					elseif ( endpoint > 0 ) then
						envelope_max = endpoint
					end
					
					for i=envelope_min,envelope_max do
						local v = deck[envelope_min]
					
						if ( v ~= nil ) then
							table.insert( discarded, v )
							table.remove( deck, envelope_min )
						end
					end
				else
					if ( elsepoint > 0 ) then
						envelope_min = elsepoint
						
						if ( endpoint > 0 ) then
							envelope_max = endpoint
						else
							envelope_max = #deck
						end
						
						for i=envelope_min,envelope_max do
							local v = deck[envelope_min]
							
							if ( v ~= nil ) then
								table.insert( discarded, v )
								table.remove( deck, envelope_min )
							end
						end
					end
				end
			end
		end
		
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SPARKLER",
	name 		= "Plasma Sparkler",
	description = "Makes the tip of your wand glow! purely cosmetic",
	sprite 		= "mods/cool_spell/files/icons/sparkler.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3,4,5,6", -- HOMING
		spawn_probability                 = "0.2,0.2,0.2,0.2,0.2,0.2", -- HOMING
	spawn_requires_flag = "card_unlocked_paint",
	price = 10,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/sparkler.xml",
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait - 8
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SPARKLER_GREEN",
	name 		= "Green Sparkler",
	description = "Makes the tip of your wand glow! purely cosmetic",
	sprite 		= "mods/cool_spell/files/icons/sparkler_green.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3,4,5,6", -- HOMING
		spawn_probability                 = "0.2,0.2,0.2,0.2,0.2,0.2", -- HOMING
	spawn_requires_flag = "card_unlocked_paint",
	price = 10,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/green_sparkler.xml",
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait - 8
		draw_actions( 1, true )
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_WAND_VACUUM",
	name 		= "Wand Vacuum Field",
	description = "Causes nearby liquids and powders to be slowly voided around you",
	sprite 		= "mods/cool_spell/files/icons/wand_vacuum.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3,4,5,6", -- HOMING
		spawn_probability                 = "0.2,0.2,0.2,0.2,0.2,0.2", -- HOMING
	price = 120,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/scripts/wand_vacuum.xml",
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 2
		draw_actions( 1, true )
	end,
} )]]-- --non-functional
table.insert( overcast_actions,
{
	id          = "OVERCAST_LEAKY_PIPE_WAND",
	name 		= "Leaky Wand",
	description = "Causes your wand to slowly drip water",
	sprite 		= "mods/cool_spell/files/icons/leaky_pipe.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "1,2,3,4,5,6", -- HOMING
		spawn_probability                 = "0.2,0.2,0.2,0.2,0.2,0.2", -- HOMING
	price = 80,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/leaky_wand.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )

table.insert( overcast_actions,
{
	id          = "OVERCAST_THETA",
	name 		= "Theta",
	description = "Copies the wand's always cast spells",
	sprite 		= "mods/cool_spell/files/icons/theta.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_duplicate",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "5,6,10", -- MANA_REDUCE
	spawn_probability                 = "0.2,0.2,0.8", -- MANA_REDUCE
	price = 200,
	mana = 5,
	action 		= function( recursion_level, iteration )
		c.fire_rate_wait = c.fire_rate_wait + 1
		
		local data = {}
		local EZWand = dofile_once("mods/cool_spell/lib/EZWand.lua") --life saver
		local entity_id = GetUpdatedEntityID()
		local wand = EZWand.GetHeldWand()
		if not reflecting then
			if wand ~= nil then
				local spells, attached_spells = wand:GetSpellsCount()
				print(tostring(attached_spells))
				if attached_spells ~= nil or attached_spells ~= 0 then
					while attached_spells > 0 do
						data = hand[attached_spells]
						local rec = check_recursion( data, recursion_level )
						print(attached_spells .. ": " .. tostring(data.id))
						if ( data ~= nil ) and ( rec > -1 ) then
							data.action( rec )
						end
						attached_spells = attached_spells - 1
					end
				else
					GamePrint("no allways cast spells found!")
				end
			else
				print_error("[THETA] held wand is nil")
			end
		end

		--draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions, -- CRASHH!!
{
	id          = "OVERCAST_BETA", --aka, draw the top card from discard
	name 		= "Beta",
	description = "Copies the last spell from the previous casting block",
	sprite 		= "mods/cool_spell/files/icons/beta.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_duplicate",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "5,6,10", -- MANA_REDUCE
	spawn_probability                 = "0.1,0.1,1", -- MANA_REDUCE
	price = 200,
	mana = 30,
	action 		= function( recursion_level, iteration )
		c.fire_rate_wait = c.fire_rate_wait + 15
		
		local data = {}
		

		if ( #discarded > 0 ) then
			data = discarded[#discarded]
		else
			data = nil
		end
		
		local rec = check_recursion( data, recursion_level )
		
		if ( data ~= nil ) and ( rec > -1 ) then
			data.action( rec )
		end
		
		--draw_actions( 1, true )
	end,
} )

table.insert( overcast_actions,
{
	id          = "OVERCAST_IF_MANA",
	name 		= "Requirement - Mana",
	description = "The next spell is skipped if your wand has less then a third of its mana capacity",
	sprite 		= "mods/cool_spell/files/icons/if_mana.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_maths",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "10", -- MANA_REDUCE
	spawn_probability                 = "1", -- MANA_REDUCE
	price = 100,
	mana = 0,
	action 		= function( recursion_level, iteration )
		local endpoint = -1
		local elsepoint = -1
		local doskip = false
		local EZWand = dofile_once("mods/cool_spell/lib/EZWand.lua") --life saver
		local entity_id = GetUpdatedEntityID()
		local wand = EZWand.GetHeldWand()
		if not reflecting then
			if wand ~= nil then
				if ( wand.mana < wand.manaMax/3 ) then
					doskip = true
					GamePrint("Insufficent Mana!")
				end
			else
				print_error("[IF_MANA] held wand is nil")
			end
		end
		
		if ( #deck > 0 ) then
			for i,v in ipairs( deck ) do
				if ( v ~= nil ) then
					if ( string.sub( v.id, 1, 3 ) == "IF_" ) and ( v.id ~= "IF_END" ) and ( v.id ~= "IF_ELSE" ) then
						endpoint = -1
						break
					end
					
					if ( v.id == "IF_ELSE" ) then
						endpoint = i
						elsepoint = i
					end
					
					if ( v.id == "IF_END" ) then
						endpoint = i
						break
					end
				end
			end
			
			local envelope_min = 1
			local envelope_max = 1
			
			if doskip then
				if ( elsepoint > 0 ) then
					envelope_max = elsepoint
				elseif ( endpoint > 0 ) then
					envelope_max = endpoint
				end
				
				for i=envelope_min,envelope_max do
					local v = deck[envelope_min]
				
					if ( v ~= nil ) then
						table.insert( discarded, v )
						table.remove( deck, envelope_min )
					end
				end
			else
				if ( elsepoint > 0 ) then
					envelope_min = elsepoint
					
					if ( endpoint > 0 ) then
						envelope_max = endpoint
					else
						envelope_max = #deck
					end
					
					for i=envelope_min,envelope_max do
						local v = deck[envelope_min]
						
						if ( v ~= nil ) then
							table.insert( discarded, v )
							table.remove( deck, envelope_min )
						end
					end
				end
			end
		end
		
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_IF_THIRD",
	name 		= "Requirement - Every Third",
	description = "The next spell is skipped 2 for casts, then isn't skipped",
	sprite 		= "mods/cool_spell/files/icons/if_third.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_maths",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "10", -- MANA_REDUCE
	spawn_probability                 = "1", -- MANA_REDUCE
	price = 100,
	mana = 0,
	action 		= function( recursion_level, iteration )
		local endpoint = -1
		local elsepoint = -1
		local doskip = true
		
		if ( reflecting == false ) then
			local status = tonumber( GlobalsGetValue( "GUN_ACTION_IF_THIRD_STATUS", "0" ) ) or 0
			GamePrint(status)
			
			if ( status >= 2 ) then
				doskip = false
				status = -1
			end
			
			status = status + 1
			GlobalsSetValue( "GUN_ACTION_IF_THIRD_STATUS", tostring( status ) )
		end
		
		if ( #deck > 0 ) then
			for i,v in ipairs( deck ) do
				if ( v ~= nil ) then
					if ( string.sub( v.id, 1, 3 ) == "IF_" ) and ( v.id ~= "IF_END" ) and ( v.id ~= "IF_ELSE" ) then
						endpoint = -1
						break
					end
					
					if ( v.id == "IF_ELSE" ) then
						endpoint = i
						elsepoint = i
					end
					
					if ( v.id == "IF_END" ) then
						endpoint = i
						break
					end
				end
			end
			
			local envelope_min = 1
			local envelope_max = 1
			
			if doskip then
				if ( elsepoint > 0 ) then
					envelope_max = elsepoint
				elseif ( endpoint > 0 ) then
					envelope_max = endpoint
				end
				
				for i=envelope_min,envelope_max do
					local v = deck[envelope_min]
				
					if ( v ~= nil ) then
						table.insert( discarded, v )
						table.remove( deck, envelope_min )
					end
				end
			else
				if ( elsepoint > 0 ) then
					envelope_min = elsepoint
					
					if ( endpoint > 0 ) then
						envelope_max = endpoint
					else
						envelope_max = #deck
					end
					
					for i=envelope_min,envelope_max do
						local v = deck[envelope_min]
						
						if ( v ~= nil ) then
							table.insert( discarded, v )
							table.remove( deck, envelope_min )
						end
					end
				end
			end
		end
		
		draw_actions( 1, true )
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_PROXIMITY_TRIGGER_FIELD",
	name 		= "Proximity Trigger Field",
	description = "Casts a spell when something enters the field",
	sprite 		= "mods/cool_spell/files/icons/proximity_trigger_field.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/proximity_trigger_field.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "2,3,5,6", -- PROJECTILE_GRAVITY_FIELD
	spawn_probability                 = "0.3,1,0.3,0.3", -- PROJECTILE_GRAVITY_FIELD
	price = 170,
	mana = 50,
	action 		= function()
		add_projectile_trigger_death("mods/cool_spell/files/actions/proximity_trigger_field.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )]]-- --non-functional
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_SELF", 
	name 		= "Selection - Mina",
	description = "Selects yourself. To be used with spells that require a selection",
	sprite 		= "mods/cool_spell/files/icons/select_self.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 200,
	mana = 20,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 1
		if not reflecting then
			local entity_id = GetUpdatedEntityID()
			GlobalsSetValue("cool_spell_stored_id", tostring(entity_id))
			if entity_id ~= nil then
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Selected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Selected: " .. entity_id)
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_HURT",
	name 		= "Selection Action - Injure",
	description = "Causes damaged to the selected entity",
	sprite 		= "mods/cool_spell/files/icons/selection_injure.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "10", -- SELECT_ACTION_HURT
	spawn_probability                 = "0.2", -- SELECT_ACTION_HURT
	price = 380,
	mana = 190,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 80
		current_reload_time = current_reload_time + 25
		
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			if EntityGetIsAlive(entity_id) then
				EntityInflictDamage( entity_id, 0.15, "DAMAGE_PROJECTILE", "Selection Action - Injure", "NONE", 0, 0)
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_CLOSEST",
	name 		= "Selection - Closest",
	description = "Selects the closest entity to its casting location. To be used with spells that require a selection",
	sprite 		= "mods/cool_spell/files/icons/select_closest.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/select_closest.xml"},
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 170,
	mana = 30,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/select_closest.xml")
		c.fire_rate_wait = c.fire_rate_wait + 5
		current_reload_time = current_reload_time + 3
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_SUMMON_HIGHLIGHTER",
	name 		= "Selection - Summon Highlighter",
	description = "Summons a highlighting wisp that will cause the selected entity to sparkle",
	sprite 		= "mods/cool_spell/files/icons/selection_inspect.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/selection_highlight.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 170,
	mana = 30,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/selection_highlight.xml")
		c.fire_rate_wait = c.fire_rate_wait + 50
		current_reload_time = current_reload_time + 20
	end,
} )]]-- --was for testing purposes, now redundant
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECTION_ACTION_CAST_AT",
	name 		= "Selection Action - Cast At",
	description = "Casts the next spell at the location of the selection",
	sprite 		= "mods/cool_spell/files/icons/selection_cast_at.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/selection_dummy.xml"},
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 170,
	mana = 30,
	action 		= function()
		add_projectile_trigger_death("mods/cool_spell/files/actions/selection_dummy.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 20
		c.spread_degrees = c.spread_degrees + 16
		current_reload_time = current_reload_time + 2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_CLOSEST_PROJ",
	name 		= "Selection - Closest Projectile",
	description = "Selects the closest projectile to its casting location. To be used with spells that require a selection",
	sprite 		= "mods/cool_spell/files/icons/select_closest_proj.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/chaos_polymorph_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/select_closest.xml"},
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 170,
	mana = 30,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/select_closest_proj.xml")
		c.fire_rate_wait = c.fire_rate_wait + 5
		current_reload_time = current_reload_time + 3
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_JARATE",
	name 		= "Selection Action - Jarate",
	description = "Jarates the selected entity",
	sprite 		= "mods/cool_spell/files/icons/selection_jarate.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 35
		current_reload_time = current_reload_time + 5
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_jarate" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local comp = EntityGetComponent( entity_id, "GameEffectComponent", "selection_jarated" )
				
				if comp ~= nil then
					EntityRemoveComponent( entity_id, comp )
				end
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/materials.bank", "materials/liquid_splash", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/jarated.xml", x, y)
				print(jarated)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_WET",
	name 		= "Selection Action - Wet",
	description = "Makes the selected entity wet",
	sprite 		= "mods/cool_spell/files/icons/selection_wet.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 200,
	mana = 15,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 35
		current_reload_time = current_reload_time + 5
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local player_id    = GetUpdatedEntityID()
			local pos_x, pos_y = EntityGetTransform( player_id )
			
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_wet" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/materials.bank", "materials/liquid_splash", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/wet.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_BLOODY",
	name 		= "Selection Action - Bloody",
	description = "Stains the selected entity with blood",
	sprite 		= "mods/cool_spell/files/icons/selection_blood.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 35
		current_reload_time = current_reload_time + 5
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_blood" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/materials.bank", "materials/liquid_splash", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/blood.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_SLIMY",
	name 		= "Selection Action - Slimy",
	description = "Covers the selected entity in slime",
	sprite 		= "mods/cool_spell/files/icons/selection_slime.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 35
		current_reload_time = current_reload_time + 5
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_slime" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/materials.bank", "materials/liquid_splash", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/slime.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_DRUNK",
	name 		= "Selection Action - Alcoholic",
	description = "Makes the selected entity drunk",
	sprite 		= "mods/cool_spell/files/icons/selection_alcohol.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 35
		current_reload_time = current_reload_time + 5
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_drunk" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/explosion.bank", "explosions/liquid", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/alcoholic.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_POLY",
	name 		= "Selection Action - Polymorph",
	description = "Breifly polymorphs the selected entity",
	sprite 		= "mods/cool_spell/files/icons/selection_poly.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "6,10", -- SELECTION_ADV
	spawn_probability                 = "0.2,0.6", -- SELECTION_ADV
	price = 430,
	mana = 150,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 7
		current_reload_time = current_reload_time + 25
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
		local children = EntityGetAllChildren(entity_id)
		if children ~= nil then
			for i,v in ipairs(children) do
				local comp = EntityGetComponent( v, "GameEffectComponent", "selection_poly" )
				if comp ~= nil then
					EntityKill(v)
					break
				end
			end
		end
		if EntityGetIsAlive(entity_id) then
			local x, y EntityGetTransform(entity_id)
			GamePlaySound("data/audio/Desktop/explosion.bank", "explosions/liquid", x, y)
			local jarated = EntityLoad("mods/cool_spell/files/effects/polymorph.xml", x, y)
			EntityAddChild( entity_id, jarated )
			if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
				GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
			else
				GamePrint("Affected: " .. entity_id)
			end
		else
			if entity_id ~= nil then
				GamePrint("Could not find entity " .. entity_id)
				GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
			end
		end
	end,
} )]]-- --non-functional
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_KILL_PROJ",
	name 		= "Selection Action - Annihilate Projectile",
	description = "Destroys the selected entity if its a projectile",
	sprite 		= "mods/cool_spell/files/icons/selection_annihilate_proj.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "10", -- SELECTION_ADV
	spawn_probability                 = "0.2", -- SELECTION_ADV
	price = 340,
	mana = 80,
	action 		= function( recursion_level, iteration )
		c.fire_rate_wait = c.fire_rate_wait + 50
		current_reload_time = current_reload_time + 15
		
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			if EntityHasTag(entity_id, "projectile") then
				EntityKill(entity_id)
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_MIRROR_PROJ",
	name 		= "Selection Action - Reflect Projectile",
	description = "Turns around the selected entity if its a projectile",
	sprite 		= "mods/cool_spell/files/icons/selection_reflect_proj.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_BASIC
	spawn_probability                 = "0.3,0.4,1,1", -- SELECTION_BASIC
	price = 280,
	mana = 40,
	action 		= function( recursion_level, iteration )
		c.fire_rate_wait = c.fire_rate_wait + 25
		current_reload_time = current_reload_time + 5
		dofile_once("data/scripts/lib/utilities.lua")
		add_projectile("mods/cool_spell/files/actions/mirror_delayer.xml") -- just used to delay the mirroring projectile effect to allow it to function on projectiles summoned from the same casting block
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_STORE",
	name 		= "Selection Action - Store",
	description = "Stores the selected entity ID, and retreives the stored ID",
	sprite 		= "mods/cool_spell/files/icons/selection_store.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "6,10", -- SELECTION_ADV
	spawn_probability                 = "0.2,0.6", -- SELECTION_ADV
	price = 380,
	mana = 20,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 5
		current_reload_time = current_reload_time + 3
		
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			
			local new_id = GlobalsGetValue("cool_spell_reserve_id", "0")
			GlobalsSetValue("cool_spell_reserve_id", entity_id)
			GlobalsSetValue("cool_spell_stored_id", new_id)
			if new_id == nil then new_id = 0 end
			if entity_id ~= nil and new_id ~= nil then
				GamePrint("Stored ID: " .. entity_id .. " And replaced it with: " .. new_id)
				GamePlaySound( "data/audio/Desktop/player.bank", "player/air_whoosh", x, y )
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_OVERCAST",
	name 		= "OVERCAST",
	description = "If your wand doesn't have enough mana to cast, it'll still cast, but wont be able to cast again until its mana has fully recharged",
	sprite 		= "mods/cool_spell/files/icons/overdraw.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "1,2,3,4,5,6,10", -- OVERCAST_FEATURED
	spawn_probability                 = "0.5,0.7,0.5,0.3,0.4,0.4,0.4", -- OVERCAST_FEATURED
	price = 120,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/overdraw.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions, --v1.1.1 spell
{
	id          = "OVERCAST_CONSERVE",
	name 		= "Ammo Conservation",
	description = "Applies a 50% chance not to consume a charge of limited use spells",
	sprite 		= "mods/cool_spell/files/icons/ammo_conserve.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4,5,6,10", -- OVERCAST_FEATURED
	spawn_probability                 = "0.5,0.7,0.5,0.3,0.4,0.4,0.4", -- OVERCAST_FEATURED
	price = 140,
	mana = 30,
	custom_xml_file = "mods/cool_spell/files/actions/conserve.xml",
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.spread_degrees = c.spread_degrees + 5
		current_reload_time = current_reload_time + 8
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions, -- v1.2.0 spell
{
	id          = "OVERCAST_RAILGUN",
	name 		= "Railgun",
	description = "Increases a projectile's damage, but makes a delay between clicking and firing. Put all modifiers AFTER this spell",
	sprite 		= "mods/cool_spell/files/icons/delay_charge.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/railgun.xml"},
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 90,
	mana = 8,
	spawn_requires_flag = "OVERCAST_card_unlocked_railgun",
	--max_uses = 150,
	custom_xml_file = "mods/cool_spell/files/actions/railgun_card.xml",
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 45
		current_reload_time = current_reload_time + 12
		add_projectile_trigger_death("mods/cool_spell/files/actions/railgun.xml", 1)
		c.speed_multiplier = c.speed_multiplier * 1.4
		c.gore_particles = c.gore_particles + 5
		c.spread_degrees = c.spread_degrees - 15
		c.damage_projectile_add = c.damage_projectile_add + 1.6
		c.damage_slice_add = c.damage_slice_add + 0.4
	end,
} )
--v1.1 spells below

--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_SEQUENCE_DUPE",
	name 		= "Sequence Dupe",
	description = "Casts the next casting block twice",
	sprite 		= "data/ui_gfx/gun_actions/buckshot.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/dynamite_unidentified.png",
	related_projectiles	= {"data/entities/projectiles/deck/buckshot_player.xml",3},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4", -- BUCKSHOT
	spawn_probability                 = "1,1,1,1,1", -- BUCKSHOT
	price = 160,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 8
		c.spread_degrees = c.spread_degrees + 14.0
		draw_actions( 1, true )
	end,
} )]]-- --non-functional
table.insert( overcast_actions,
{
	id          = "OVERCAST_SENTRY",
	name 		= "Sentry",
	description = "Deploys a floating crystal that casts the next 4 spells towards enemies. Prefers the selected entity",
	sprite 		= "mods/cool_spell/files/icons/sentry_icon.png",
	related_projectiles	= {"mods/cool_spell/files/actions/sentry_core.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5,6,10",
	spawn_probability                 = "0.2,0.3,0.5,0.6,0.7,1.2",
	price = 180,
	mana = 80,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/sentry_core.xml")
		--EntityLoad("mods/cool_spell/files/actions/sentry_laser.xml", x, y)
		add_projectile_trigger_death("mods/cool_spell/files/actions/sentry_gun.xml", 1)
		add_projectile_trigger_death("mods/cool_spell/files/actions/sentry_gun.xml", 1)
		add_projectile_trigger_death("mods/cool_spell/files/actions/sentry_gun.xml", 1)
		add_projectile_trigger_death("mods/cool_spell/files/actions/sentry_gun.xml", 1)
		current_reload_time = current_reload_time + 45
		c.fire_rate_wait = c.fire_rate_wait + 90
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECTION_SENTRY",
	name 		= "Selection Sentry",
	description = "Deploys a floating crystal that selects the nearest entity",
	sprite 		= "mods/cool_spell/files/icons/radar_sentry_icon.png",
	related_projectiles	= {"mods/cool_spell/files/actions/sentry_selection.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3",
	spawn_probability                 = "0.5,0.5,0.5,1",
	price = 70,
	mana = 12,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/sentry_selection.xml")
		current_reload_time = current_reload_time + 8
		c.fire_rate_wait = c.fire_rate_wait + 30
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_FOOD_POISONING",
	name 		= "Selection Action - Food Poisoning",
	description = "Makes the selected entity vomit for some time",
	sprite 		= "mods/cool_spell/files/icons/selection_food_poison.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 7
		current_reload_time = current_reload_time + 25
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_food_poison" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/explosion.bank", "explosions/liquid", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/food_poison.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_OIL",
	name 		= "Selection Action - Oil",
	description = "Covers the selected entity in oil",
	sprite 		= "mods/cool_spell/files/icons/selection_oil.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 220,
	mana = 25,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 7
		current_reload_time = current_reload_time + 25
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_oiled" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/explosion.bank", "explosions/liquid", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/oiled.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_FIREWORK_ROCKET",
	name 		= "Crude Firework Rocket",
	description = "A slow moving explosive rocket that gives off pretty colors",
	sprite 		= "mods/cool_spell/files/icons/firework.png",
	related_projectiles	= {"mods/cool_spell/files/actions/firework.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3", -- DYNAMITE
	spawn_probability                 = "1,1,1,1", -- DYNAMITE
	price = 160,
	mana = 50,
	max_uses    = 16,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/firework.xml")
		c.fire_rate_wait = c.fire_rate_wait + 50
		c.spread_degrees = c.spread_degrees + 4.0
		current_reload_time = current_reload_time + 7
		c.screenshake = c.screenshake + 1
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_FIREWORK_ROCKET_TRIGGER",
	name 		= "Crude Firework Rocket With Trigger",
	description = "A slow moving explosive rocket that gives off pretty colors and casts a spell on impact",
	sprite 		= "mods/cool_spell/files/icons/firework_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/firework.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4", -- DYNAMITE
	spawn_probability                 = "0.2,0.4,0.6,0.6", -- DYNAMITE
	price = 160,
	mana = 60,
	max_uses    = 16,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/firework.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 50
		c.spread_degrees = c.spread_degrees + 4.0
		current_reload_time = current_reload_time + 7
		c.screenshake = c.screenshake + 1
	end,
} )

--v.1.1.1 spells below

--moved up to OVERCAST_OVERCAST to make it properly disable

--v1.1.2 spells below
table.insert( overcast_actions,
{
	id          = "OVERCAST_SEA_ANOMALY",
	name 		= "Sea Of Anomalous Fluid",
	description = "Summons a large body of anomalous fluid below the caster",
	sprite 		= "mods/cool_spell/files/icons/sea_of_anomaly.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "3,4,5,6,7", 
	spawn_probability                 = "0.25,0.5,0.5,0.5,0.5", 
	price = 320,
	mana = 120,
	max_uses = 3,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/sea_of_anomaly.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_MATERIAL_ANOMALY",
	name 		= "Anomalous Fluid",
	description = "What could it do?",
	sprite 		= "mods/cool_spell/files/icons/material_anomaly.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 100,
	mana = 1,
	--max_uses = 300,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/material_anomaly.xml")
		c.fire_rate_wait = c.fire_rate_wait - 15
		current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_MATERIAL_OXIDIZING",
	name 		= "Oxidizing Dust",
	description = "Combusts upon contact with flamable material",
	sprite 		= "mods/cool_spell/files/icons/material_oxidizing.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 100,
	mana = 1,
	--max_uses = 300,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/material_oxidizing_dust.xml")
		c.fire_rate_wait = c.fire_rate_wait - 15
		current_reload_time = current_reload_time - ACTION_DRAW_RELOAD_TIME_INCREASE - 10
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SELECT_ACTION_ANOMALY",
	name 		= "Selection Action - Anomaly",
	description = "Makes the selected entity anomalous",
	sprite 		= "mods/cool_spell/files/icons/selection_anomaly.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	--spawn_requires_flag = "card_unlocked_selection",
	type 		= ACTION_TYPE_OTHER,
	recursive	= true,
	spawn_level                       = "4,5,6,10", -- SELECTION_STAIN
	spawn_probability                 = "0.1,0.1,0.3,0.3", -- SELECTION_STAIN
	price = 250,
	mana = 35,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 7
		current_reload_time = current_reload_time + 25
		
		add_projectile("mods/cool_spell/files/actions/selection_dummy.xml") --to make it apply cast delay
		if not reflecting then
			local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
			local children = EntityGetAllChildren(entity_id)
			if children ~= nil then
				for i,v in ipairs(children) do
					local comp = EntityGetComponent( v, "GameEffectComponent", "selection_anomaly" )
					if comp ~= nil then
						EntityKill(v)
						break
					end
				end
			end
			if EntityGetIsAlive(entity_id) then
				local x, y EntityGetTransform(entity_id)
				GamePlaySound("data/audio/Desktop/explosion.bank", "explosions/liquid", x, y)
				local jarated = EntityLoad("mods/cool_spell/files/effects/anomaly_selection.xml", x, y)
				EntityAddChild( entity_id, jarated )
				if GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) ~= nil then
					GamePrint("Affected: " .. GameTextGetTranslatedOrNot(EntityGetName(selected_entity)) .. " " .. entity_id)
				else
					GamePrint("Affected: " .. entity_id)
				end
			else
				if entity_id ~= nil then
					GamePrint("Could not find entity " .. entity_id)
					GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
				end
			end
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_TOUCH_OXIDIZING",
	name 		= "Touch of Oxidization",
	description = "Turns everything in a small area (including you!) into oxidizing dust", -- why, however yes
	sprite 		= "mods/cool_spell/files/icons/touch_oxidizing.png",
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "2,3,4,5", 
	spawn_probability                 = "0.75,0.75,0.75,0.75", 
	price = 160,
	mana = 90,
	max_uses = 10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/touch_oxidizing.xml") 
		c.fire_rate_wait = c.fire_rate_wait + 10
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SENTRY_TRIGGER",
	name 		= "Trigger Sentry",
	description = "Deploys a floating crystal that casts the next spell when an entity gets close",
	sprite 		= "mods/cool_spell/files/icons/trigger_sentry_icon.png",
	related_projectiles	= {"mods/cool_spell/files/actions/sentry_trigger.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3",
	spawn_probability                 = "0.5,0.5,0.5,1",
	price = 80,
	mana = 30,
	action 		= function()
		add_projectile_trigger_death("mods/cool_spell/files/actions/sentry_trigger.xml", 1)
		current_reload_time = current_reload_time + 12
		c.fire_rate_wait = c.fire_rate_wait + 30
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_ANOMALY_FIELD",
	name 		= "Circle Of Anomaly",
	description = "A field of anomalous magic",
	sprite 		= "mods/cool_spell/files/icons/anomaly_field.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/anomaly_field.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "2,3,4", -- BERSERK_FIELD
	spawn_probability                 = "0.3,0.6,0.3", -- BERSERK_FIELD
	price = 200,
	mana = 30,
	max_uses = 15,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/anomaly_field.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PILE",
	name 		= "Puddle of Chaos",
	description = "Summons a small body of a random material below the caster",
	sprite 		= "mods/cool_spell/files/icons/pile.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/random_dump.xml"},
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "4,5,6,10", 
	spawn_probability                 = "0.1,0.2,0.3,0.5", 
	price = 200,
	mana = 90,
	max_uses = 15,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/random_dump.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_RANDOM_TOUCH",
	name 		= "Touch of Chaos",
	description = "Transmutes everything in a short radius into a random material, including walls, creatures... and you",
	sprite 		= "mods/cool_spell/files/icons/touch_random.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/random_touch.xml"},
	type 		= ACTION_TYPE_MATERIAL,
	spawn_level                       = "4,5,6,10", 
	spawn_probability                 = "0.1,0.2,0.3,0.5", 
	price = 400,
	mana = 300,
	max_uses = 5,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/random_touch.xml")
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_VERTICAL_ARC",
	name 		= "Vertical Path",
	description = "Forces a projectile on a vertical path, but increases its damage",
	sprite 		= "mods/cool_spell/files/icons/vertical_arc.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/vertical_arc.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,3,5", -- HORIZONTAL_ARC
	spawn_probability                 = "0.4,0.4,0.4", -- HORIZONTAL_ARC
	price = 20,
	mana = 0,
	--max_uses = 150,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/vertical_arc.xml,"
		draw_actions( 1, true )
		c.damage_projectile_add = c.damage_projectile_add + 0.4
		c.fire_rate_wait    = c.fire_rate_wait - 6
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_BOTTLER",
	name 		= "Bottler",
	description = "Sucks up nearb liquids for a time, then drops a potion with what it grabbed",
	sprite 		= "mods/cool_spell/files/icons/bottler.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/bottler.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "0,1,2,3,4", 
	spawn_probability                 = "0.7,0.6,0.3,0.4,0.3", 
	price = 220,
	mana = 120,
	max_uses = 2,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/bottler.xml")
		c.fire_rate_wait    = c.fire_rate_wait - 30
		current_reload_time = current_reload_time + 4
	end,
} )
--v1.3.0 spells
table.insert( overcast_actions,
{
	id          = "OVERCAST_BROKEN_WAND",
	name 		= "Broken Wand Lobber",
	description = "Throws a broken wand",
	sprite 		= "mods/cool_spell/files/icons/broken_wand_lobber.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/berserk_field_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/broken_wand.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,2,3,4",
	spawn_probability                 = "0.7,0.6,0.3,0.4,0.3",
	price = 220,
	mana = 230,
	max_uses = 16,
	action 		= function()
		c.fire_rate_wait    = c.fire_rate_wait - 60
		current_reload_time = current_reload_time + 30
		add_projectile("mods/cool_spell/files/actions/broken_wand.xml")
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PINPOINT_LASER",
	name 		= "Pinpoint Bolt",
	description = "Fires a deadly accurate bolt",
	sprite 		= "mods/cool_spell/files/icons/pinpoint_laser.png",
	related_projectiles	= {"mods/cool_spell/files/actions/pinpoint_laser.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,3,4,5",
	spawn_probability                 = "0.4,0.4,0.4,0.4",
	price = 80,
	mana = 20,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/pinpoint_laser.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.spread_degrees = c.spread_degrees - 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PINPOINT_LASER_TRIGGER",
	name 		= "Pinpoint Bolt With Trigger",
	description = "Fires a deadly accurate bolt, that casts another spell on impact",
	sprite 		= "mods/cool_spell/files/icons/pinpoint_laser_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/pinpoint_laser.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5",
	spawn_probability                 = "0.3,0.3,0.2,0.4",
	price = 90,
	mana = 25,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/pinpoint_laser.xml", 2)
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.spread_degrees = c.spread_degrees - 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_BORE",
	name 		= "Bore",
	description = "Fires a drill capable of digging for some time",
	sprite 		= "mods/cool_spell/files/icons/bore.png",
	related_projectiles	= {"mods/cool_spell/files/actions/bore.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,1,3,4,5",
	spawn_probability                 = "0.3,0.5,0.4,0.4,0.3",
	price = 80,
	mana = 20,
	max_uses= 10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/bore.xml")
		c.fire_rate_wait = c.fire_rate_wait + 30
		current_reload_time = current_reload_time + 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_BORE_TIMER",
	name 		= "Bore With Timer",
	description = "Fires a drill capable of digging for some time, and casts a spell after a while",
	sprite 		= "mods/cool_spell/files/icons/bore_timer.png",
	related_projectiles	= {"mods/cool_spell/files/actions/bore.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,3,4,5",
	spawn_probability                 = "0.3,0.2,0.2,0.3",
	price = 80,
	mana = 20,
	max_uses= 10,
	action 		= function()
		add_projectile_trigger_timer("mods/cool_spell/files/actions/bore.xml", 60, 1)
		c.fire_rate_wait = c.fire_rate_wait + 30
		current_reload_time = current_reload_time + 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_BIOHAZARD",
	name 		= "Biohazard",
	description = "Trades some projectile damage for toxic damage",
	sprite 		= "mods/cool_spell/files/icons/biohazard.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/biohazard.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
	spawn_probability                 = "1,1,1,1", -- ELECTRIC_CHARGE
	price = 20,
	mana = 2,
	--max_uses = 150,
	custom_xml_file = "data/entities/misc/custom_cards/slimeball.xml",
	action 		= function()
		draw_actions( 1, true )
		c.damage_projectile_add = c.damage_projectile_add - 0.2
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/biohazard.xml,"
	end,
} ) -- non-functional there is no radioactive damage type for projectiles :(
	--Note[Conga]: Could add a child entity and run a lua script to add radioactive damage to the projectile, only issue would be the spell not showing how much radioactive damage it adds in the hud
table.insert( overcast_actions,
{
	id          = "OVERCAST_SPIKED",
	name 		= "Spiked",
	description = "Trades some projectile damage for slice damage, and applies self-homing",
	sprite 		= "mods/cool_spell/files/icons/sawblade.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/sawblade.xml", "data/entities/particles/tinyspark_white.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,4,5", -- ELECTRIC_CHARGE
	spawn_probability                 = "1,1,1,1", -- ELECTRIC_CHARGE
	price = 20,
	mana = 5,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.damage_projectile_add = c.damage_projectile_add - 0.2
		c.damage_slice_add = c.damage_slice_add + 0.4
		c.fire_rate_wait    = c.fire_rate_wait + 6
		c.speed_multiplier = c.speed_multiplier * 1.2
		c.friendly_fire		= true
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/sawblade.xml,data/entities/particles/tinyspark_white.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_CURSE",
	name 		= "Cursed Projectile",
	description = "Curses a projectile, giving it resistance-pericing curse damage but with side-effects...",
	sprite 		= "mods/cool_spell/files/icons/cursed.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/curse.xml,data/entities/particles/tinyspark_red.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,4,5,6,10",
	spawn_probability                 = "0.6,0.4,0.6,0.8,0.8",
	price = 140,
	mana = 10,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.damage_projectile_add = c.damage_projectile_add - 0.1
		c.damage_curse_add = c.damage_curse_add + 0.5
		c.fire_rate_wait    = c.fire_rate_wait + 13
		current_reload_time = current_reload_time + 2
		c.speed_multiplier = c.speed_multiplier * 1.2
		c.friendly_fire		= true
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/curse.xml,data/entities/particles/tinyspark_red.xml,"
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_IF_SELECTION",
	name 		= "Requirement - Selection Nearby",
	description = "The next spell is skipped if the selection isn't nearby",
	sprite 		= "mods/cool_spell/files/icons/if_third.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/spread_reduce_unidentified.png",
	spawn_requires_flag = "card_unlocked_maths",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "10", -- MANA_REDUCE
	spawn_probability                 = "1", -- MANA_REDUCE
	price = 100,
	mana = 0,
	action 		= function( recursion_level, iteration )
		local endpoint = -1
		local elsepoint = -1
		local doskip = true
		local selected_entity = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
		local entity_id = GetUpdatedEntityID()
		local x, y = EntityGetTransform(entity_id)
		
		function dump(o)
		   if type(o) == 'table' then
			  local s = '{ '
			  for k,v in pairs(o) do
				 if type(k) ~= 'number' then k = '"'..k..'"' end
				 s = s .. '['..k..'] = ' .. dump(v) .. ','
			  end
			  return s .. '} '
		   else
			  return tostring(o)
		   end
		end

		
		if ( reflecting == false ) then
			local targets = EntityGetInRadius( x, y, 96)
			for v in pairs(targets) do
				print(v .. " =? " .. selected_entity)
				if v == selected_entity then
					doskip = false
					GamePrint("entity in range")
					break
				end
			end
		end
		
		if ( #deck > 0 ) then
			for i,v in ipairs( deck ) do
				if ( v ~= nil ) then
					if ( string.sub( v.id, 1, 3 ) == "IF_" ) and ( v.id ~= "IF_END" ) and ( v.id ~= "IF_ELSE" ) then
						endpoint = -1
						break
					end
					
					if ( v.id == "IF_ELSE" ) then
						endpoint = i
						elsepoint = i
					end
					
					if ( v.id == "IF_END" ) then
						endpoint = i
						break
					end
				end
			end
			
			local envelope_min = 1
			local envelope_max = 1
			
			if doskip then
				if ( elsepoint > 0 ) then
					envelope_max = elsepoint
				elseif ( endpoint > 0 ) then
					envelope_max = endpoint
				end
				
				for i=envelope_min,envelope_max do
					local v = deck[envelope_min]
				
					if ( v ~= nil ) then
						table.insert( discarded, v )
						table.remove( deck, envelope_min )
					end
				end
			else
				if ( elsepoint > 0 ) then
					envelope_min = elsepoint
					
					if ( endpoint > 0 ) then
						envelope_max = endpoint
					else
						envelope_max = #deck
					end
					
					for i=envelope_min,envelope_max do
						local v = deck[envelope_min]
						
						if ( v ~= nil ) then
							table.insert( discarded, v )
							table.remove( deck, envelope_min )
						end
					end
				end
			end
		end
		
		draw_actions( 1, true )
	end,
} )]]-- --non-functional, will add next update probably
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_SQUARE",
	name 		= "Square Bolt",
	description = "Fires a deadly accurate bolt",
	sprite 		= "mods/cool_spell/files/icons/square_shooter.png",
	related_projectiles	= {"mods/cool_spell/files/actions/pinpoint_laser.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,3,4,5",
	spawn_probability                 = "0.4,0.4,0.4,0.4",
	price = 80,
	mana = 20,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/pinpoint_laser.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.spread_degrees = c.spread_degrees - 5
	end,
} )]]--

-- 2.0 spells

table.insert( overcast_actions,
{
	id          = "OVERCAST_KNIFE",
	name 		= "Bayonet",
	description = "Deals bonus melee damage at close range",
	sprite 		= "mods/cool_spell/files/icons/knife.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/knife.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4,5", -- DAMAGE
	spawn_probability                 = "0.6,0.6,0.6,0.6,0.6", -- DAMAGE
	price = 80,
	mana = 3,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.damage_melee_add = c.damage_melee_add + 0.3
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/knife.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_LARPA_PROGRADE",
	name 		= "Prograde Larpa",
	description = "Projectile casts copies of itself forwards",
	sprite 		= "mods/cool_spell/files/icons/larpa_prograde.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/larpa_prograde.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,3,4,5,10", -- FIREBALL_RAY
	spawn_probability                 = "0.1,0.1,0.2,0.4,0.2", -- FIREBALL_RAY
	price = 290,
	mana = 120,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/larpa_prograde.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_LARPA_RETROGRADE",
	name 		= "Retrograde Larpa",
	description = "Projectile casts copies of itself backwards",
	sprite 		= "mods/cool_spell/files/icons/larpa_retrograde.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/larpa_retrograde.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,3,4,5,10", -- FIREBALL_RAY
	spawn_probability                 = "0.1,0.1,0.2,0.4,0.2", -- FIREBALL_RAY
	price = 290,
	mana = 120,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 15
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/larpa_retrograde.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_CURSOR_FOLLOW",
	name 		= "Crosshair Homing",
	description = "Projectile follows your crosshair",
	sprite 		= "mods/cool_spell/files/icons/cursor_homing.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/cursor_follow.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4,5,6", -- HOMING
	spawn_probability                 = "0.1,0.4,0.4,0.4,0.4,0.4", -- HOMING
	price = 220,
	mana = 70,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 20
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/cursor_follow.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_DAMAGE_NULL",
	name 		= "Nullifed Damage",
	description = "Removes all projectile damage from a projectile",
	sprite 		= "mods/cool_spell/files/icons/damage_null.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/damage_null.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "2,4,5,6,10", -- DAMAGE_NULL
	spawn_probability                 = "0.5,0.5,1,1,1", -- DAMAGE_NULL
	price = 40,
	mana = 0,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait - 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/damage_null.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_ACID",
	name 		= "Acid Payload",
	description = "Makes a projectile drop some acid upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_acid.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_acid.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 200,
	mana = 70,
	max_uses = 80,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 15
		current_reload_time = current_reload_time + 8
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_acid.xml,"
		--c.material = "acid"
		--c.material_amount = c.material_amount + 10
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_WATER",
	name 		= "Water Payload",
	description = "Makes a projectile drop some water upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_water.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_water.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 80,
	mana = 20,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_water.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_POLY",
	name 		= "Poly Payload",
	description = "Makes a projectile drop some poly upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_poly.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_poly.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 160,
	mana = 40,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 15
		current_reload_time = current_reload_time + 8
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_poly.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_BESERK",
	name 		= "Beserkium Payload",
	description = "Makes a projectile drop some beserkium upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_beserk.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_beserk.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 100,
	mana = 20,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 10
		current_reload_time = current_reload_time + 2
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_beserk.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_OIL",
	name 		= "Oil Payload",
	description = "Makes a projectile drop some oil upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_oil.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_oil.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 100,
	mana = 20,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_oil.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PAYLOAD_POISON",
	name 		= "Poison Payload",
	description = "Makes a projectile drop some poison upon contact",
	sprite 		= "mods/cool_spell/files/icons/payload_poison.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/payload_poison.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,2,4,5,6,10", -- PAYLOAD
	spawn_probability                 = "0.2,0.2,0.2,0.4,0.5,1", -- PAYLOAD
	price = 140,
	mana = 40,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 10
		current_reload_time = current_reload_time + 1
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/payload_poison.xml,"
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_POISON_DART",
	name 		= "Cursed Poison Dart",
	description = "A deadly dart tipped with a deadly poisonous curse",
	sprite 		= "mods/cool_spell/files/icons/cursed_poison_dart.png",
	related_projectiles	= {"mods/cool_spell/files/actions/poison_dart_curse.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "4,5,6,10",
	spawn_probability                 = "0.2,0.4,0.4,0.4",
	price = 280,
	mana = 35,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/poison_dart_curse.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
		current_reload_time = current_reload_time + 3
		c.spread_degrees = c.spread_degrees + 2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_POISON_DART_TRIGGER",
	name 		= "Cursed Poison Dart With Trigger",
	description = "A deadly dart tipped with a deadly poisonous curse, and cast another spell upon collision",
	sprite 		= "mods/cool_spell/files/icons/cursed_poison_dart_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/poison_dart_curse.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "5,6,10",
	spawn_probability                 = "0.2,0.3,0.4",
	price = 280,
	mana = 40,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/poison_dart_curse.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 17
		current_reload_time = current_reload_time + 3
		c.spread_degrees = c.spread_degrees + 2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_POISON_DART_DULLED",
	name 		= "Poison Dart",
	description = "A sickining dart tipped with a potent poison",
	sprite 		= "mods/cool_spell/files/icons/poison_dart.png",
	related_projectiles	= {"mods/cool_spell/files/actions/poison_dart.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,3,4",
	spawn_probability                 = "0.4,0.4,0.4",
	price = 60,
	mana = 8,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/poison_dart.xml")
		c.fire_rate_wait = c.fire_rate_wait + 10
		c.spread_degrees = c.spread_degrees + 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SEVE_BUCKSHOT",
	name 		= "Septuple Bolt",
	description = "Fires seven small, fast bolts",
	sprite 		= "mods/cool_spell/files/icons/septuple_bolt.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/dynamite_unidentified.png",
	related_projectiles	= {"data/entities/projectiles/deck/buckshot_player.xml",7},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4,5", -- BUCKSHOT
	spawn_probability                 = "0.3,0.3,0.3,0.3,0.3", -- BUCKSHOT
	price = 230,
	mana = 60,
	action 		= function()
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		add_projectile("data/entities/projectiles/deck/buckshot_player.xml")
		c.fire_rate_wait = c.fire_rate_wait + 20
		c.spread_degrees = c.spread_degrees + 30.0
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20
	end,
})
table.insert( overcast_actions,
{
	id          = "OVERCAST_DECABURST",
	name 		= "Decaburst",
	description = "Fires 10 orbs in a circle, which after some time, fly towards your cursor. Deals melee damage at close range",
	sprite 		= "mods/cool_spell/files/icons/decaburst.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/dynamite_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/decaball.xml",10},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- DECABURST
	spawn_probability                 = "0.2,0.3,0.8,0.3", -- DECABURST
	price = 300,
	mana = 180,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball.xml")
		add_projectile("mods/cool_spell/files/actions/decaball_gfx.xml")
		
		c.pattern_degrees = 180
		c.fire_rate_wait = c.fire_rate_wait + 50
		current_reload_time = current_reload_time + 20
		c.spread_degrees = c.spread_degrees + 30.0
	end,
})
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_MANA_COLLECTOR",
	name 		= "Mana Leecher",
	description = "Deploys a field that restores your mana depending on how many enimies are nearby",
	sprite 		= "mods/cool_spell/files/icons/poison_dart.png",
	related_projectiles	= {"mods/cool_spell/files/actions/essence_to_mana.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "",
	spawn_probability                 = "",
	price = 60,
	mana = -10,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/essence_to_mana.xml")
		c.fire_rate_wait = c.fire_rate_wait + 8
		c.spread_degrees = c.spread_degrees + 2
	end,
} )]]-- -- functional, disabled since im not very happy with how it works 
table.insert( overcast_actions,
{
	id          = "OVERCAST_MINI_BLACK_HOLE",
	name 		= "Mini Black Hole",
	description = "Fires small black holes capable of eating through terrain",
	sprite 		= "mods/cool_spell/files/icons/mini_blackhole.png",
	related_projectiles	= {"mods/cool_spell/files/actions/mini_black_hole.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "0,2,4,5", -- BLACK_HOLE
	spawn_probability                 = "0.8,0.8,0.8,0.8", -- BLACK_HOLE
	price = 230,
	mana = 80,
	max_uses = 80,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/mini_black_hole.xml")
		c.fire_rate_wait = c.fire_rate_wait + 50
		c.screenshake = c.screenshake + 10
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_MINI_BLACK_HOLE_TIMER",
	name 		= "Mini Black Hole With Timer",
	description = "Fires small black holes capable of eating through terrain, and cast another spell upon expiring",
	sprite 		= "mods/cool_spell/files/icons/mini_blackhole_timer.png",
	related_projectiles	= {"mods/cool_spell/files/actions/mini_black_hole.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,4,5,6", -- BLACK_HOLE
	spawn_probability                 = "0.5,0.5,0.5,0.5", -- BLACK_HOLE
	price = 230,
	mana = 85,
	max_uses = 80,
	action 		= function()
		add_projectile_trigger_death("mods/cool_spell/files/actions/mini_black_hole.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 50
		c.screenshake = c.screenshake + 10
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 20
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_RAINBOW_ORB",
	name 		= "Rainbow Orb",
	description = "Prismatic orbs that deal 13 damage of a random damage type",
	sprite 		= "mods/cool_spell/files/icons/rainbow_launcher.png",
	related_projectiles	= {"mods/cool_spell/files/actions/rainbow_orb.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 230,
	mana = 40,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/rainbow_orb.xml")
		c.fire_rate_wait = c.fire_rate_wait + 18
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 10
		current_reload_time = current_reload_time + 2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_RAINBOW_ORB_TRIGGER",
	name 		= "Rainbow Orb With Trigger",
	description = "Prismatic orbs that deal 13 damage of a random damage type, and cast another spell upon impact",
	sprite 		= "mods/cool_spell/files/icons/rainbow_launcher_trigger.png",
	related_projectiles	= {"mods/cool_spell/files/actions/rainbow_orb.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 230,
	mana = 45,
	action 		= function()
		add_projectile_trigger_hit_world("mods/cool_spell/files/actions/rainbow_orb.xml", 1)
		c.fire_rate_wait = c.fire_rate_wait + 20
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 10
		current_reload_time = current_reload_time + 2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_RAINBOW_DAMAGE",
	name 		= "Prismatic",
	description = "Adds 5 damage of a random damage type",
	sprite 		= "mods/cool_spell/files/icons/rainbow_damage.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/rainbow_damage.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 150,
	mana = 10,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/rainbow_damage.xml,"
	end,
} )
--[[ table.insert( overcast_actions,
{
	id          = "OVERCAST_ALL_SEEING_PROJ",
	name 		= "Insight",
	description = "Your projectiles lift the fog of war",
	sprite 		= "mods/cool_spell/files/icons/rainbow_launcher.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/insight.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	--spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 150,
	mana = 10,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/insight.xml,"
	end,
} ) ]]-- --non-functional fog of war is kind of weird
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_ANTI_HOMING",
	name 		= "Cancel Homing",
	description = "Removes a projectile's ability to home\n(may not work with some homing spells)",
	sprite 		= "mods/cool_spell/files/icons/rainbow_launcher.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/rainbow_damage.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	--spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 150,
	mana = 10,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait + 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/remove_homing.xml,"
	end,
} )]]-- --non functional, most homing stuff is dependant on scripts
table.insert( overcast_actions,
{
	id          = "OVERCAST_DISC_HOMING",
	name 		= "Return Arc",
	description = "Makes a projectile arc back to where it was cast",
	sprite 		= "mods/cool_spell/files/icons/return_arc.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/disc_homing.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	--spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 90,
	mana = 5,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		c.fire_rate_wait = c.fire_rate_wait - 5
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/disc_homing.xml,"
		c.speed_multiplier = c.speed_multiplier * 1.2
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_HOLOBLADE",
	name 		= "Holoblade",
	description = "Attaches a blade made of pure energy to the tip of your wand",
	sprite 		= "mods/cool_spell/files/icons/holoblade.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "0,1,2", -- HOLOBLADE
	spawn_probability                 = "1.5,1.4,1.2", -- HOLOBLADE
	price = 60,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/holoblade.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_HOLOBLADE_MASTER",
	name 		= "Master Holoblade",
	description = "Attaches a rainbow blade made of pure energy to the tip of your wand",
	sprite 		= "mods/cool_spell/files/icons/holoblade_master.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 60,
	mana = 0,
	spawn_requires_flag = "overcast_card_unlocked_holoblade_master",
	custom_xml_file = "mods/cool_spell/files/actions/holoblade_master.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_SHARPSHOOTER",
	name 		= "Sharpshooter",
	description = "Deals 8 bonus slice damage if far away",
	sprite 		= "mods/cool_spell/files/icons/sharpshooter.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/sharpshooter.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4,5", -- DAMAGE
	spawn_probability                 = "0.6,0.6,0.6,0.6,0.6", -- DAMAGE
	price = 80,
	mana = 3,
	--max_uses = 150,
	action 		= function()
		draw_actions( 1, true )
		--c.damage_melee_add = c.damage_melee_add + 0.3
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/sharpshooter.xml,"
		c.spread_degrees = c.spread_degrees - 5
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_GRAVITY",
	name 		= "Kuu",
	description = "Makes your wand pull in objects. Does not pull in projectiles",
	sprite 		= "mods/cool_spell/files/icons/gravity.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 60,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/gravity.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_GRAVITY_ANTI",
	name 		= "Toinen Kuu",
	description = "Makes your wand push out objects. Does not push out projectiles",
	sprite 		= "mods/cool_spell/files/icons/gravity_anti.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 60,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/gravity_anti.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_INCREASE_SPREAD",
	name 		= "Increased Spread",
	description = "Slightly reduces the accuracy of your wand",
	sprite 		= "mods/cool_spell/files/icons/increase_spread.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/teleport_projectile_unidentified.png",
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "0,1,2,4,5,6", -- HEAVY_SPREAD
	spawn_probability                 = "0.8,0.8,0.8,0.8,0.8,0.8", -- HEAVY_SPREAD
	price = 100,
	mana = 0,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait - 4
		current_reload_time = current_reload_time - 1
		c.spread_degrees = c.spread_degrees + 25
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PLASMA_BOLT",
	name 		= "Plasma Bolt",
	description = "A quick and simple explosive projectile with a big blast radius, but does little damage to terrain",
	sprite 		= "mods/cool_spell/files/icons/plasma_bolt.png",
	related_projectiles	= {"mods/cool_spell/files/actions/plasma_bolt.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4,5", -- ROCKET
	spawn_probability                 = "1,1,1,0.5,0.5", -- ROCKET
	price = 70,
	mana = 55,
	max_uses= 32,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/plasma_bolt.xml")
		c.fire_rate_wait = c.fire_rate_wait + 30
		shot_effects.recoil_knockback = 100.0
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PLASMA_BOLT_LARGE",
	name 		= "Large Plasma Bolt",
	description = "A stronger Plasma Bolt",
	sprite 		= "mods/cool_spell/files/icons/plasma_bolt_large.png",
	related_projectiles	= {"mods/cool_spell/files/actions/plasma_bolt_large.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5,6", -- ROCKET_TIER_2
	spawn_probability                 = "0.5,1,1,1,1", -- ROCKET_TIER_2
	price = 70,
	mana = 80,
	max_uses= 25,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/plasma_bolt_large.xml")
		c.fire_rate_wait = c.fire_rate_wait + 45
		shot_effects.recoil_knockback = 120.0
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_PLASMA_BOLT_GIANT",
	name 		= "Giant Plasma Bolt",
	description = "The most powerful Plasma Bolt",
	sprite 		= "mods/cool_spell/files/icons/plasma_bolt_giant.png",
	related_projectiles	= {"mods/cool_spell/files/actions/plasma_bolt_giant.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5,6", -- ROCKET_TIER_3
	spawn_probability                 = "0.25,0.5,1,1,1", -- ROCKET_TIER_3
	price = 70,
	mana = 115,
	max_uses= 16,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/plasma_bolt_giant.xml")
		c.fire_rate_wait = c.fire_rate_wait + 60
		shot_effects.recoil_knockback = 160.0
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_RAILGUN_BULLET",
	name 		= "Railgun",
	description = "Increases a projectile's damage, but makes a delay between clicking and firing",
	sprite 		= "mods/cool_spell/files/icons/delay_charge.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sinewave_unidentified.png",
	related_projectiles	= {"mods/cool_spell/files/actions/railgun_shot.xml"},
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	--spawn_requires_flag = "card_unlocked_rainbow_trail",
	price = 90,
	mana = 5,
	--max_uses = 150,
	custom_xml_file = "mods/cool_spell/files/actions/railgun_card.xml",
	action 		= function()
		--c.fire_rate_wait = c.fire_rate_wait + 45
		add_projectile("mods/cool_spell/files/actions/railgun_shot.xml")
		--c.speed_multiplier = c.speed_multiplier * 1.2
		--c.damage_projectile_add = c.damage_projectile_add + 0.9
	end,
} )]]-- --funtional (sorta), was used as a test for the railgun modifier
table.insert( overcast_actions,
{
	id          = "OVERCAST_PINCH",
	name 		= "Pinch",
	description = "Deals 1 projectile damage to yourself. May be helpful to activate perks based on taking damage",
	sprite 		= "mods/cool_spell/files/icons/pinch.png",
	type 		= ACTION_TYPE_OTHER,
	spawn_level                       = "1,2,3,4",
	spawn_probability                 = "0.2,0.4,0.8,0.8",
	price = 30,
	mana = -1,
	--max_uses= 16,
	action 		= function()
		c.fire_rate_wait = c.fire_rate_wait + 20
		current_reload_time = current_reload_time - 5
		if not ModSettingGet("cool_spell.do_overcast") then -- code for this is in gun.lua, but if the append was disabled fall back to this (makes it not effected by modifiers)
			local entity_id = EntityGetWithTag("player_unit")
			EntityInflictDamage( entity_id[1], 0.04, "DAMAGE_PROJECTILE", "Pinch", "BLOOD_SPRAY", 0, 0)
		end
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_UPGRADE",
	name 		= "Augment",	
	description = "Signifigantly improves all stats of a projectile",
	sprite 		= "mods/cool_spell/files/icons/upgrade.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/teleport_projectile_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/upgrade.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "3,4,5,6,10",
	spawn_probability                 = "0.3,0.5,1,0.8,1",
	price = 140,
	mana = -20,
	max_uses = 10,
	never_unlimited = true,
	action 		= function()
		c.spread_degrees = c.spread_degrees - 20
		c.speed_multiplier = c.speed_multiplier * 1.4
		c.damage_projectile_add = c.damage_projectile_add + 0.7
		c.damage_slice_add = c.damage_slice_add + 0.4
		c.damage_curse_add = c.damage_curse_add + 0.1
		shot_effects.recoil_knockback = shot_effects.recoil_knockback + 15.0
		c.gore_particles    = c.gore_particles + 5
		c.friendly_fire = false
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/upgrade.xml,"
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_NOBLOOD",
	name 		= "Stitching",
	description = "Causes hit entities to not bleed for some time",
	sprite 		= "mods/cool_spell/files/icons/stiching.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/nobleed.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4",
	spawn_probability                 = "0.2,0.4,0.8,0.8",
	price = 140,
	mana = 5,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/nobleed.xml,"
		c.gore_particles    = 0
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_MOREBLOOD",
	name 		= "Bleeding",
	description = "Causes hit entities to bleed for 3 times more for some time",
	sprite 		= "mods/cool_spell/files/icons/bleeding.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/morebleed.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "1,2,3,4",
	spawn_probability                 = "0.2,0.4,0.8,0.8",
	price = 140,
	mana = 5,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/morebleed.xml,"
		c.gore_particles    = c.gore_particles * 3
		draw_actions( 1, true )
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_FOLLOW",
	name 		= "Tug",
	description = "Constantly pulls you towards the projectile",
	sprite 		= "mods/cool_spell/files/icons/tug.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/follow.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "3,4,5,6,10",
	spawn_probability                 = "0.3,0.5,1,0.8,1",
	price = 140,
	mana = 15,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/follow.xml,"
		c.speed_multiplier = c.speed_multiplier * 0.6
		c.fire_rate_wait = c.fire_rate_wait + 30
		current_reload_time = current_reload_time + 15
		--c.damage_melee_add = c.damage_melee_add + 0.2
		draw_actions( 1, true )
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_VISUALISER",
	name 		= "Visualiser",
	description = "Extra lines showing velocity information show up next to the projectile",
	sprite 		= "mods/cool_spell/files/icons/noblood.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/visual.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "3,4,5,6,10",
	spawn_probability                 = "0.3,0.5,1,0.8,1",
	price = 140,
	mana = 0,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/visual.xml,"
		draw_actions( 1, true )
	end,
} )]]--
table.insert( overcast_actions,
{
	id          = "OVERCAST_CHARGE_AMP",
	name 		= "Recharge Amp",
	description = "Increases mana charge speed when your not casting",
	sprite 		= "mods/cool_spell/files/icons/recharge_amp.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	type 		= ACTION_TYPE_PASSIVE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 90,
	mana = 0,
	custom_xml_file = "mods/cool_spell/files/actions/recharge_amp.xml",
	action 		= function()
		draw_actions( 1, true )
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_BOTTLE_LOBBER",
	name 		= "Bottle Lobber",
	description = "Tossin bottles",
	sprite 		= "mods/cool_spell/files/icons/bottle_lobber.png",
	related_projectiles	= {"mods/cool_spell/files/actions/bottle.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "2,3,4,5,6", -- ROCKET_TIER_3
	spawn_probability                 = "0.25,0.5,1,1,1", -- ROCKET_TIER_3
	price = 70,
	mana = 15,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/bottle.xml")
	end,
} )]]-- --functional, very op, was an attempt to make a projectile using physics but it basicly does hundreds of physics hit damage
table.insert( overcast_actions,
{
	id          = "OVERCAST_PLANK",
	name 		= "Plank",
	description = "Summons a wooden plank",
	sprite 		= "mods/cool_spell/files/icons/plank.png",
	related_projectiles	= {"mods/cool_spell/files/actions/plank.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "0,1,2,3",
	spawn_probability                 = "2,1,0.5,0.25",
	price = 50,
	mana = 50,
	max_uses= 16,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/plank.xml")
		c.fire_rate_wait = c.fire_rate_wait + 40
	end,
} )
table.insert( overcast_actions,
{
	id          = "OVERCAST_BEAM",
	name 		= "Beam",
	description = "Summons a steel beam",
	sprite 		= "mods/cool_spell/files/icons/steel_girder.png",
	related_projectiles	= {"mods/cool_spell/files/actions/beam.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 70,
	mana = 70,
	max_uses= 8,
	action 		= function()
		add_projectile("mods/cool_spell/files/actions/beam.xml")
		c.fire_rate_wait = c.fire_rate_wait + 60
	end,
} )
--[[table.insert( overcast_actions,
{
	id          = "OVERCAST_DAMAGE_AMP",
	name 		= "Damage Amp",
	description = "Increases next projectiles' damage when your not casting",
	sprite 		= "mods/cool_spell/files/icons/recharge_amp.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/torch_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/damage_amp.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "4,5,6,10", -- PRISMATIC
	spawn_probability                 = "0.7,0.8,0.8,0.7", -- PRISMATIC
	price = 90,
	mana = 0,
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/damage_amp.xml,"
		draw_actions( 1, true )
	end,
} )]]--

table.insert( overcast_actions,
{
	id          = "OVERCAST_WAND_GLUE",
	name 		= "Wand glue",
	description = "Suspends the projectile infront of your wand",
	sprite 		= "mods/cool_spell/files/icons/wand_glue.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/electric_charge_unidentified.png",
	related_extra_entities = { "mods/cool_spell/files/actions/wand_glue.xml" },
	type 		= ACTION_TYPE_MODIFIER,
	spawn_level                       = "3,4,5,6,10",
	spawn_probability                 = "0.3,0.5,1,0.8,1",
	price = 140,
	mana = 15,
	custom_xml_file = "mods/cool_spell/files/actions/wand_glue_card.xml",
	action 		= function()
		c.extra_entities = c.extra_entities .. "mods/cool_spell/files/actions/wand_glue.xml,"
		--c.damage_melee_add = c.damage_melee_add + 0.2
		draw_actions( 1, true )
	end,
} )

--[[ note on scrapped spells:
some scrapped spells are here, but commented out. they will include a message at the end of the comment telling you why they were scrapped. these were spells that had some work put into making them function. the spells labled as functional will not be coming in an update, but you're free to uncomment them and try them out. the non-functional ones *may* be added later, once i can find a good way on how to do so
there are even more scrapped spells that you can just find as icons in the files/actions folder, these spells *may* be actualy implemented, i just haven't done so yet.
have fun looking through my prototypes!
oh and sorry for the mess, non of my folders are properly organized hehe
p.s. the greek letter spells that you can find sprites for in files/actions will probably not be added, i just went through a few diffrent letters for the existing greek letters before i settled on what they were. there are already enough greek letter spell mods

also credit to EZWand
]]--