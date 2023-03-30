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
content = content:gsub("\"GRENADE\"", "\"GRENADE\",\"OVERCAST_FIREWORK_ROCKET\"")
ModTextFileSetContent(path, content)

path = "data/scripts/gun/procedural/starting_wand.lua"
content = ModTextFileGetContent(path)
content = content:gsub("\"RUBBER_BALL\"", "\"RUBBER_BALL\",\"OVERCAST_IMPULSE_BULLET\",\"OVERCAST_HAZARD_SPARKS\"")
ModTextFileSetContent(path, content)

ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery_vapour.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_mystery_powder.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/materials_oxidizing_dust.xml" )
ModMaterialsFileAdd( "mods/cool_spell/files/materials/magic_liquid_mana_regeneration.xml" )

ModLuaFileAppend( "data/scripts/status_effects/status_list.lua", "mods/cool_spell/files/appends/status_list.lua" )

ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/cool_spell/files/actions.lua" ) 
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