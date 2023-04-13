--dofile_once("data/scripts/perks/perk.lua")
function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	--[[local x, y = EntityGetTransform(player_entity)
	local perk = perk_spawn(x, y, "EDIT_WANDS_EVERYWHERE")
	perk_pickup(perk, player_entity, EntityGetName(perk), false, false)]]--
	GlobalsSetValue("cool_spell_reserve_id", 0) -- entity IDs change between sessions, so we must reset them
	GlobalsSetValue("cool_spell_stored_id", 0)
	if next(EntityGetWithTag("selection_highlighter")) == nil then
		EntityLoad("mods/cool_spell/files/actions/selection_highlight.xml")
	end
end

path = "data/scripts/gun/procedural/starting_bomb_wand.lua"
content = ModTextFileGetContent(path)
content = content:gsub("\"GRENADE\"", "\"GRENADE\",\"OVERCAST_FIREWORK_ROCKET\",\"OVERCAST_PLASMA_BOLT\"")
ModTextFileSetContent(path, content)

path = "data/scripts/gun/procedural/starting_wand.lua"
content = ModTextFileGetContent(path)
content = content:gsub("\"RUBBER_BALL\"", "\"RUBBER_BALL\",\"OVERCAST_IMPULSE_BULLET\",\"OVERCAST_HAZARD_SPARKS\",\"OVERCAST_POISON_DART_DULLED\"")
ModTextFileSetContent(path, content)

ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery_vapour.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery_powder.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_oxidizing_dust.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/magic_liquid_mana_regeneration.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_pride.xml" )

ModLuaFileAppend( "data/scripts/status_effects/status_list.lua", "mods/cool_spell/files/appends/status_list.lua" )

local overcast = ModSettingGet("cool_spell.do_overcast")
if overcast then
	ModLuaFileAppend( "data/scripts/gun/gun.lua", "mods/cool_spell/files/appends/gun.lua" )
end
if not ModSettingGet("cool_spell.inert") then
	ModMaterialsFileAdd( "mods/cool_spell/files/materials/reactions.xml" )
	if ModIsEnabled("Hydroxide") then
		ModMaterialsFileAdd( "mods/cool_spell/files/materials/reactions_chemical_curiosities.xml" )
	end
end
if ModSettingGet("cool_spell.potions") then
	ModLuaFileAppend( "data/scripts/items/potion.lua", "mods/cool_spell/files/appends/potion.lua" )
	ModLuaFileAppend( "data/scripts/items/potion_aggressive.lua", "mods/cool_spell/files/appends/potion_agressive.lua" )
	if ModIsEnabled("fluid_dynamics") then
		dofile("mods/fluid_dynamics/config.lua")
		if spawn_potion_powder_flasks then
			ModLuaFileAppend( "data/scripts/items/potion.lua", "mods/cool_spell/files/appends/fluid_dynamics_powders.lua" )
		end
	end
end

ModLuaFileAppend( "data/scripts/streaming_integration/event_list.lua", "mods/cool_spell/files/appends/event_list.lua" ) -- streaming events

--pixelsenes
if ModSettingGet("cool_spell.do_world") then
	ModLuaFileAppend( "data/scripts/biomes/temple_wall.lua", "mods/cool_spell/files/appends/temple_wall.lua" ) -- spawn functions
	path = "data/biome/_pixel_scenes.xml"
	content = ModTextFileGetContent(path)
	content = content:gsub("</mBufferedPixelScenes>", "<PixelScene DEBUG_RELOAD_ME=\"0\" background_filename=\"\" clean_area_before=\"0\" material_filename=\"mods/cool_spell/files/world/railgun_box.png\" pos_x=\"-2560\" pos_y=\"6400\" skip_biome_checks=\"1\" skip_edge_textures=\"0\" >\n</PixelScene>\n<PixelScene pos_x=\"-2409\" pos_y=\"6524\" just_load_an_entity=\"mods/cool_spell/files/wands/railgun.xml\" />\n</mBufferedPixelScenes>")
	ModTextFileSetContent(path, content)
end
--[[function OnWorldInitialized()
	print_error("woo")
	if ModSettingGet("cool_spell.do_world") then
		LoadPixelScene("mods/cool_spell/files/world/railgun_box.png","",-2560,6016,"",true)
	end
end]]

-- spell modifying

if ModSettingGet("cool_spell.edit_heal_bullet") then
	print("editing heal bullet")
	path = "data/entities/projectiles/deck/heal_bullet.xml"
	content = ModTextFileGetContent(path)
	content = content:gsub("</Entity>", "<LuaComponent\n		script_source_file=\"mods/cool_spell/files/scripts/damage_null.lua\"\n		execute_every_n_frame=\"1\"\n		remove_after_executed=\"1\"\n		>\n	</LuaComponent>\n	</Entity>")
	ModTextFileSetContent(path, content)
end

--always cast perk
if ModSettingGet("cool_spell.do_always_cast") then
	path = "data/scripts/perks/perk_list.lua"
	content = ModTextFileGetContent(path)
	if HasFlagPersistent( "overcast_card_unlocked_holoblade_master" ) then
		print("HOLOBLADE_MASTER --------------------------------------------------------------------------------")
		content = content:gsub("\"SINEWAVE\"", "\"SINEWAVE\",\"OVERCAST_CONSERVE\",\"OVERCAST_CHARGE_AMP\",\"OVERCAST_HOLOBLADE_MASTER\"")
	else
		print("NO FLAG --------------------------------------------------------------------------------")
		content = content:gsub("\"SINEWAVE\"", "\"SINEWAVE\",\"OVERCAST_CONSERVE\",\"OVERCAST_CHARGE_AMP\"")
	end
	ModTextFileSetContent(path, content)
end

local gold_greek = ModSettingGet("cool_spell.gold_greek")
if gold_greek then
	
	path = "data/scripts/gun/gun_actions.lua"
	content = ModTextFileGetContent(path)
	greeks = {"alpha","gamma","tau","omega","mu","phi","sigma","zeta"}
	
	for i,v in ipairs(greeks) do
		content = content:gsub("data/ui_gfx/gun_actions/" .. v .. ".png", "mods/cool_spell/files/icons/gold_greek/" .. v .. ".png")
	end
	
	ModTextFileSetContent(path, content)
end

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/cool_spell/files/appends/gun_actions.lua" )  -- finaly, add spells