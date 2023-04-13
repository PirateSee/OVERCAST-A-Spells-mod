dofile("mods/cool_spell/files/actions_list.lua")
dofile_once("mods/cool_spell/settings.lua")

local spells_count = 0
local disabled_count = 0

local overcast = ModSettingGet("cool_spell.do_overcast") 
local gold_greek = ModSettingGet("cool_spell.gold_greek")

local overcast_actions_d = overcast_actions -- make copy

function check_overcast(id)
	local checks = {"OVERCAST_OVERCAST", "OVERCAST_CONSERVE", "OVERCAST_RAILGUN"}
	for i,v in ipairs(checks) do
		if id == v then
			return true
		end
	end
	return false
end

function gold_greeks(id, sprite)
	local checks = {"OVERCAST_BETA", "OVERCAST_THETA"}
	local greeks = {"beta", "theta"}
	for i,v in ipairs(checks) do
		if id == v then
			return "mods/cool_spell/files/icons/gold_greek/" .. greeks[i] .. ".png"
		end
	end
	return sprite
end

if actions ~= nil then
	for i=1, #overcast_actions_d do
		if ModSettingGet("cool_spell.disable_" .. overcast_actions_d[i].id) or ModSettingGet("cool_spell.disable_" .. overcast_actions_d[i].id) == nil then
			
			if not overcast and check_overcast(overcast_actions_d[i].id) then
				disabled_count = disabled_count + 1
				print("disabled: " .. overcast_actions_d[i].id)
			elseif gold_greek then
				overcast_actions_d[i].sprite = gold_greeks(overcast_actions_d[i].id, overcast_actions_d[i].sprite)
				print("applying gold sprite")
				actions[#actions+1] = overcast_actions_d[i]
			else
				actions[#actions+1] = overcast_actions_d[i]
			end
		
		else
			disabled_count = disabled_count + 1
			print("disabled: " .. overcast_actions_d[i].id)
		end
		spells_count = spells_count + 1
	end
	print("OVERCAST spells loaded! spell count: " .. tostring(spells_count) .. " (" .. tostring(disabled_count) .. " disabled)")
end