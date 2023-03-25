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

local mod_id = "cool_spell" -- This should match the name of your mod's folder.
mod_settings_version = 1 -- This is a magic global that can be used to migrate settings to new mod versions. call mod_settings_get_version() before mod_settings_update() to get the old value. 
mod_settings = 
{
	{
		category_id = "cool_spell_config",
		ui_name = "CONFIG",
		ui_description = "Configure nothing!",
		settings = {
			{
				id = "selected_id",
				ui_name = "Selected ID",
				ui_description = "Allows you to insert an entity ID to be used by selection spells. Use at your own risk",
				value_default = "57",
				text_max_length = 3,
				allowed_characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_0123456789",
				scope = MOD_SETTING_SCOPE_RUNTIME,
				change_fn = mod_setting_change_callback,
			},
			{
				id = "do_overcast",
				ui_name = "Enable OVERCAST spell",
				ui_description = "Disable the OVERCAST spell if its casuing compatability problems.\nRequires restart",
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
				ui_description = "Makes materials added by this mod have no reactions.\nEnable if you dont want this mod to add materials. \nRequires restart",
				value_default = false,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			},
			{
				id = "potions",
				ui_name = "Spawn In Potions",
				ui_description = "Makes materials added by spawn in potions.\nDisable if you dont want this mod to add materials. \nRequires restart",
				value_default = true,
				scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
			}
		},
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
end
