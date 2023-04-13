local STREAMING_EVENT_AUTHOR_PIRATESEE = "OVERCAST - PirateSee"

table.insert(streaming_events,
{
	id = "OVERCAST_OVERCAST",
	ui_name = "Overcast",
	ui_description = "Bend the limits of mana",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1.0,
	kind = STREAMING_EVENT_GOOD,
	action = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			local effect_id = EntityLoad( "mods/cool_spell/files/effects/overcasting.xml", x, y )
			set_lifetime( effect_id )
			EntityAddChild( entity_id, effect_id )
			
			add_icon_in_hud( effect_id, "mods/cool_spell/files/effects/overcasting.png", event )
		end
	end,
} )
table.insert(streaming_events,
{
	id = "OVERCAST_RESOUREFUL",
	ui_name = "Resourceful",
	ui_description = "Chance not to consume charges of limited use spells",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1.0,
	kind = STREAMING_EVENT_GOOD,
	action = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			local effect_id = EntityLoad( "mods/cool_spell/files/effects/resourceful.xml", x, y )
			set_lifetime( effect_id, 0.25 )
			EntityAddChild( entity_id, effect_id )
			
			add_icon_in_hud( effect_id, "mods/cool_spell/files/effects/overcasting.png", event )
		end
	end,
} )
table.insert(streaming_events, -- should be a replacement for SEA_OF_X
{
	id = "OVERCAST_PUDDLE_OF_CHAOS",
	ui_name = "Puddle Of Chaos", 
	ui_description = "$streamingeventdesc_sea_of_x",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 0.5,
	kind = STREAMING_EVENT_NEUTRAL,
	delay_timer = 300,
	action_delayed = function(event)
		local players = get_players()
		local t = GameGetFrameNum()
		--local opts = { "lava", "water", "oil", "alcohol", "acid_gas" } -- enjoy suffering
		
		dofile_once("data/scripts/items/potion.lua") -- get material lists from potion.lua for mod compat

		
		for i,entity_id in ipairs( players ) do
			local x, y = EntityGetTransform( entity_id )
			
			SetRandomSeed( entity_id, t )
			--local rnd = Random( 1, #opts )
			--ocal opt = opts[rnd]
			local material = "water"
			
			if Random(1,3) == 1 then --33%
				material = materials_magic[Random(1, #materials_magic)]
			else
				material = materials_standard[Random(1, #materials_magic)]
			end
			material = material.material

			--EntityLoad( "data/scripts/streaming_integration/entities/sea_" .. opt .. ".xml", x, y )
			local sea = EntityLoad("mods/cool_spell/files/actions/random_dumper.xml", x, y)
			local comp = EntityGetFirstComponent(sea, "MaterialSeaSpawnerComponent")
			
			ComponentSetValue2(comp, "material", CellFactory_GetType(material))
			comp = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent") -- abosloute chaos
			ComponentSetValue2(comp, "emitted_material_name", material)
		end
	end,
} )
table.insert(streaming_events,
{
	id = "OVERCAST_RAIN_EVIL_SENTRY",
	ui_name = "Evil Sentries",
	ui_description = "Many floating crystals appear nearby, ready to fire",
	ui_icon = "data/ui_gfx/streaming_event_icons/protect_enemies.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1,
	kind = STREAMING_EVENT_BAD,
	delay_timer = 180,
	action_delayed = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			EntityLoad( "mods/cool_spell/files/actions/extra/rain_evil_sentry.xml", x, y )
		end
	end,
} )
table.insert(streaming_events,
{
	id = "OVERCAST_ANOMALY",
	ui_name = "Anomalous",
	ui_description = "You and all nearby creatures gain random status effects",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1.0,
	kind = STREAMING_EVENT_NEUTRAL,
	action = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			local effect_id = EntityLoad( "mods/cool_spell/files/effects/anomaly.xml", x, y )
			set_lifetime( effect_id, 0.333 )
			EntityAddChild( entity_id, effect_id )
			
			add_icon_in_hud( effect_id, "mods/cool_spell/files/effects/anomaly.png", event )
			for _,enemy in pairs(get_enemies_in_radius(400)) do
				local effect_id2 = EntityLoad( "mods/cool_spell/files/effects/anomaly.xml", x, y )
				set_lifetime( effect_id2, 0.333 )
				EntityAddChild( enemy, effect_id2 )
				--add_icon_above_head( effect_id2, "data/ui_gfx/status_indicators/protection_all.png", event )
			end
		end
	end,
} )
table.insert(streaming_events,
{
	id = "OVERCAST_NOBLEED",
	ui_name = "Stitches",
	ui_description = "Prevents you and all nearby creatures from bleeding",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1.0,
	kind = STREAMING_EVENT_NEUTRAL,
	action = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			local effect_id = EntityLoad( "mods/cool_spell/files/effects/nobleed_long.xml", x, y )
			set_lifetime( effect_id, 1 )
			EntityAddChild( entity_id, effect_id )
			
			add_icon_in_hud( effect_id, "mods/cool_spell/files/effects/nobleed.png", event )
			for _,enemy in pairs(get_enemies_in_radius(400)) do
				local effect_id2 = EntityLoad( "mods/cool_spell/files/effects/nobleed_long.xml", x, y )
				set_lifetime( effect_id2, 1 )
				EntityAddChild( enemy, effect_id2 )
				--add_icon_above_head( effect_id2, "data/ui_gfx/status_indicators/protection_all.png", event )
			end
		end
	end,
} )
table.insert(streaming_events,
{
	id = "OVERCAST_MOREBLEED",
	ui_name = "More blood",
	ui_description = "Makes you and all nearby creatures bleed three times as much",
	ui_icon = "data/ui_gfx/streaming_event_icons/health_plus.png",
	ui_author = STREAMING_EVENT_AUTHOR_PIRATESEE,
	weight = 1.0,
	kind = STREAMING_EVENT_NEUTRAL,
	action = function(event)
		for i,entity_id in pairs( get_players() ) do
			local x, y = EntityGetTransform( entity_id )
			
			local effect_id = EntityLoad( "mods/cool_spell/files/effects/morebleed_long.xml", x, y )
			set_lifetime( effect_id, 1 )
			EntityAddChild( entity_id, effect_id )
			
			add_icon_in_hud( effect_id, "mods/cool_spell/files/effects/morebleed.png", event )
			for _,enemy in pairs(get_enemies_in_radius(400)) do
				local effect_id2 = EntityLoad( "mods/cool_spell/files/effects/morebleed_long.xml", x, y )
				set_lifetime( effect_id2, 1 )
				EntityAddChild( enemy, effect_id2 )
				--add_icon_above_head( effect_id2, "data/ui_gfx/status_indicators/protection_all.png", event )
			end
		end
	end,
} )