dofile("data/scripts/lib/mod_settings.lua") -- see this file for documentation on some of the features.

function mod_setting_bool_custom( mod_id, gui, in_main_menu, im_id, setting )
	local value = ModSettingGetNextValue( mod_setting_get_id(mod_id,setting) )
	local text = setting.ui_name .. " - " .. GameTextGet( value and "$option_on" or "$option_off" )

	if GuiButton( gui, im_id, mod_setting_group_x_offset, 0, text ) then
		ModSettingSetNextValue( mod_setting_get_id(mod_id,setting), not value, false )
	end

	mod_setting_tooltip( mod_id, gui, in_main_menu, setting )
end

function mod_setting_change_callback( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	GlobalsSetValue("cool_spell_stored_id", tostring(new_value))
	print( tostring(new_value) )
end

function mod_setting_instant( mod_id, gui, in_main_menu, setting, old_value, new_value  )
	ModSettingSetNextValue( "cool_spell.more_info", new_value, false)
end

function string.insert(str1, str2, pos)
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end


local mod_id = "cool_spell" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings = 
{
	{
		category_id = "cool_spell_config",
		ui_name = "CONFIG",
		ui_description = "Change things",
		settings = {
			{
				id = "selected_id",
				ui_name = "Selected ID",
				ui_description = "Allows you to insert an entity ID to be used by selection spells. Use at your own risk",
				value_default = "57",
				text_max_length = 3,
				allowed_characters = "0123456789",
				scope = MOD_SETTING_SCOPE_RUNTIME,
				change_fn = mod_setting_change_callback,
			},
			{
				id = "do_overcast",
				ui_name = "Enable gun.lua Appends",
				ui_description = "Disable gun.lua appends\n(and therefore the OVERCAST, Ammo Conservation, and Railgun spell)\nif its casuing compatability problems.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
				change_fn = mod_setting_instant_overcast,
			},
			{
				id = "do_world",
				ui_name = "Spawn Pixelscenes",
				ui_description = "Whether or not to spawn pixelscenes containing the secret wands.\nYou may want to disable this for compatability with mods that significantly change world generation.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "do_always_cast",
				ui_name = "Edit Always Cast Perk",
				ui_description = "Adds additional OVERCAST spells as \"good\"; always cast spells from the Always Cast perk.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
		},
	},
	{
		category_id = "cool_spell_materials",
		ui_name = "MATERIALS",
		ui_description = "Change how materials work!",
		settings = {
			{
				id = "inert",
				ui_name = "Inert Materials",
				ui_description = "Makes materials added by this mod have no reactions.\nEnable if you don't want this mod to add materials.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "potions",
				ui_name = "Spawn In Potions",
				ui_description = "Makes materials added by spawn in potions.\nDisable if you don't want this mod to add materials.",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			}
		},
	},
	{
		category_id = "cool_spell_spell_edit",
		ui_name = "SPELL EDITS",
		ui_description = "Make a few changes to vanilla spells.",
		settings = {
			{
				id = "edit_heal_bullet",
				ui_name = "Healing Bolt: Damage Nullification",
				ui_description = "Makes healing bolts remove all projectile damage from themseleves",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
		},
	},
	{
		category_id = "cool_spell_disable",
		ui_name = "DISABLE SPELLS",
		ui_description = "Disable or enable spells from OVERCAST.\nA restart is required to apply changes",
		settings = {
			{
				id = "more_info",
				ui_name = "Display more info",
				ui_description = "Shows spawning information in the disable tooltip. Might make things cluttered\nNote: The cost amount gets multipled depending on depth. It isn't a very accurate description\nof how much you will have to pay. Only useful if comparing info.",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME,
				change_fn = mod_setting_instant,
			},
		}
	},
}
function ModSettingsUpdate( init_scope )
	local old_version = mod_settings_get_version( mod_id ) -- This can be used to migrate some settings between mod versions.
	mod_settings_update( mod_id, mod_settings, init_scope )
end
function ModSettingsGuiCount()
	return mod_settings_gui_count( mod_id, mod_settings )
end
function ModSettingsGui( gui, in_main_menu )
	mod_settings_gui( mod_id, mod_settings, gui, in_main_menu )
	dofile("mods/cool_spell/files/actions_list.lua")
	
	local id = 34756
	
	print("overcast")
	
	function new_id()
		id = id+1
		return id
	end
	
	local offset = 0
	local y_offset = 0
	local y_offset_next = 0
	local already_ended = true
	
	if overcast_actions == nil then
		GuiText( gui, 0, 0, "Couldn't fetch spells list :(\n \nThis usualy happens if you're on the main menu with the steam version of the mod\ntry starting a game or downloading the mod from modworkshop" )
		return
	end
	
	GuiLayoutBeginHorizontal( gui, 0, 0, false, 8, 2) -- begin buttons
	
		if GuiButton( gui, new_id(), 0, 0, "[Enable All]" ) then
			for i,v in pairs(overcast_actions) do
				ModSettingSet("cool_spell.disable_" .. v.id, true)
			end
		end
		
		if GuiButton( gui, new_id(), 0, 0, "[Disable All]" ) then
			for i,v in pairs(overcast_actions) do
				ModSettingSet("cool_spell.disable_" .. v.id, false)
			end
		end
	
	GuiLayoutEnd(gui)
	
	
	GuiLayoutBeginHorizontal( gui, 0, 0, false, 2, 2) -- begin
	
	for i,v in pairs(overcast_actions) do 
		
		already_ended = false
		local description = ""
		local skip_tooltips = false
		local extra_notes = ""
		local extra_info = ""
		GuiOptionsAdd(gui, GUI_OPTION.NoPositionTween) -- set some vars
		local disabled = false
		local greek = "none"
		if v.id == "OVERCAST_BETA" then
			greek = "beta"
		elseif v.id == "OVERCAST_THETA"  then
			greek = "theta"
		end
		
		if v.id == "OVERCAST_OVERCAST" or v.id == "OVERCAST_CONSERVE" or v.id == "OVERCAST_RAILGUN" then
			extra_notes = "\n!!Requires an append to gun.lua. Will be automaticly disabled when gun.lua appends are disabled!!" -- extra info about these spells
			if not ModSettingGetNextValue("cool_spell.do_overcast") then
				skip_tooltips = true
				disabled = true
				GuiZSetForNextWidget( gui, -10 )
			end
		end
		
		if disabled == false then
			if ModSettingGet("cool_spell.disable_" .. v.id) == true or ModSettingGet("cool_spell.disable_" .. v.id) == nil then --check if current spell being drawn is disabled or not
				disabled = true
				GuiZSetForNextWidget( gui, -12 ) -- is disabled, reduce z index to be under disable overlay
			else
				GuiZSetForNextWidget( gui, -10 )
			end
		end
		
		local lc, rc = false
		
		if greek ~= "none" and ModSettingGet( "cool_spell.gold_greek" ) then
			lc, rc = GuiImageButton(gui, new_id(), 0-offset, 0-y_offset, "", "mods/cool_spell/files/icons/gold_greek/" .. greek .. ".png") -- draw gui button
		elseif v.id == "OVERCAST_HOLOBLADE_MASTER" and ModSettingGet("cool_spell.holoblade_pride") ~= false and ModSettingGet("cool_spell.holoblade_pride") ~= nil then
			lc, rc = GuiImageButton(gui, new_id(), 0-offset, 0-y_offset, "", "mods/cool_spell/files/icons/holoblade_master_" .. ModSettingGet("cool_spell.holoblade_pride") .. ".png") -- draw gui button
		else
			lc, rc = GuiImageButton(gui, new_id(), 0-offset, 0-y_offset, "", v.sprite) -- draw gui button
		end
		
		if lc then 
			if ModSettingGet("cool_spell.disable_" .. v.id) == true or ModSettingGet("cool_spell.disable_" .. v.id) == nil then -- if clicked, toggle
				ModSettingSet("cool_spell.disable_" .. v.id, false)
				--ModSettingSetNextValue("cool_spell.disable_" .. v.id, false)
			else
				ModSettingSet("cool_spell.disable_" .. v.id, true)
				--ModSettingSetNextValue("cool_spell.disable_" .. v.id, true)
			end
		end
		
		if rc and greek ~= "none" and in_main_menu then -- gold greek easter egg
			if ModSettingGet( "cool_spell.gold_greek" ) then
				ModSettingSet( "cool_spell.gold_greek", false )
			else
				ModSettingSet( "cool_spell.gold_greek", true )
			end
			print(tostring(ModSettingGet( "cool_spell.gold_greek" )))
		end
		
		if rc and v.id == "OVERCAST_HOLOBLADE_MASTER" then
			if ModSettingGet("cool_spell.holoblade_pride") == nil or ModSettingGet("cool_spell.holoblade_pride") == false then
				local y,mon,d,h,m,s = GameGetDateAndTimeLocal()
				SetRandomSeed(s,m)
				local flags = {"overcast_pride_trans", "overcast_pride_bi", "overcast_pride_nonbinary", "overcast_pride_poly", "overcast_pride_aroace", "overcast_pride_asexual", "overcast_pride_lesbian", "overcast_pride_pan","overcast_pride_intersex"}
				ModSettingSet("cool_spell.holoblade_pride", flags[Random(1,#flags)])
			else
				ModSettingSet("cool_spell.holoblade_pride", false)
			end
		end
		
		if ModSettingGetNextValue("cool_spell.more_info") then
			extra_info = "\nCost: " .. tostring(v.price) .. "\nSpawn Tiers: " .. v.spawn_level .. "\nSpawn Weight: " .. v.spawn_probability
			if v.spawn_requires_flag ~= nil then
				extra_info = extra_info .. "\nUnlocked: " .. tostring(HasFlagPersistent( v.spawn_requires_flag )) .. " (" .. v.spawn_requires_flag .. ")"
			end
		end
		
		local length = string.len(v.description)
		if length > 68 then
			local index = 64
			local ch = "a"
			while ch ~= " " do
				ch = string.sub(v.description, index, index)
				index = index + 1
				--print(ch)
				if index == 76 then break end
			end
			description = string.insert(v.description, "\n", index-1)
		else
			description = v.description
		end
		
		if skip_tooltips == false then
			
			if disabled then
				GuiTooltip( gui, "", v.name .. "\n--------------------------\n" .. description .. "\n[Click to disable]" .. extra_notes .. extra_info ) --show tooltip
				offset = 0
			else
				GuiTooltip( gui, "", v.name .. "\n--------------------------\n" .. description .. "\n[Click to enable]" .. extra_notes .. extra_info ) -- show tooltip and overlay
				GuiZSetForNextWidget( gui, -11 )
				GuiOptionsAddForNextWidget(gui, GUI_OPTION.NonInteractive)
				GuiImageButton(gui, new_id(), -20, -2-y_offset, "", "mods/cool_spell/files/icons/overlay.png")
				offset = 2
				y_offset_next = 4 -- offset next entries so things dont shift when drawing the overlay
			end
		else -- special case for spells disabled by not doing appends
			GuiTooltip( gui, "", v.name .. "\n--------------------------\n" .. description .. "\n[Disabled due to gun.lua appends being disabled]" .. extra_notes .. extra_info ) -- show tooltip and disable overlay
			GuiZSetForNextWidget( gui, -11 )
			GuiOptionsAddForNextWidget(gui, GUI_OPTION.NonInteractive)
			GuiImageButton(gui, new_id(), -20, -2-y_offset, "", "mods/cool_spell/files/icons/overlay.png")
			offset = 2
			y_offset_next = 4 -- offset next entries so things dont shift when drawing the overlay
		end
		
		--GuiLayoutEnd(gui)
		if i%18 == 0 then -- next row
			GuiLayoutEnd(gui)
			GuiLayoutBeginHorizontal( gui, 0, 0, false, 2, 2) 
			y_offset = y_offset+y_offset_next
			y_offset_next = 0
			offset = 0
			already_ended = true
		end
	end
	if not already_ended then -- will crash if there is no layout to end
		GuiLayoutEnd(gui)
	end
end
