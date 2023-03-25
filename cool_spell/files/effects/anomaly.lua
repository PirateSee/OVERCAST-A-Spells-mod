--dofile_once("data/scripts/lib/utilities.lua")
local t = GameGetFrameNum()

function get_random_from( target )
	local rnd = Random(1, #target)
	
	return tostring(target[rnd])
end


if(t%120 ==0) then
	local entity_id = EntityGetParent(GetUpdatedEntityID())
	local x, y = EntityGetTransform(entity_id)

	SetRandomSeed(x, y+t)

	local effect_list = {"blood", "jarated", "oiled", "wet", "slime", "food_poison", "berserk", "twitchy", "wither", "protection_all", "confusion", "movement_faster_2x", "worm_attractor"} --removed effects: "poison", 

	if ModIsEnabled("grahamsperks") then
		table.insert(effect_list, "minty")
		table.insert(effect_list, "greedymeal")
	end
	if ModIsEnabled("Hydroxide") then --removed effects: "hit_self"
		table.insert(effect_list, "methane")
	end

	local effect = get_random_from( effect_list )
	local effect_path = "mods/cool_spell/files/effects/anomaly/" .. effect .. ".xml"
	local children = EntityGetAllChildren(entity_id)
	if children ~= nil then
		for i,v in ipairs(children) do
			local comp = EntityGetComponent( v, "GameEffectComponent", "selection_" .. effect ) -- will overwrite selection effects, and selection effects will overwrite this
			if comp ~= nil then
				EntityKill(v)
				break
			end
		end
	end
	local x, y EntityGetTransform(entity_id)
	GamePlaySound("data/audio/Desktop/materials.bank", "materials/liquid_splash", x, y)
	local jarated = EntityLoad(effect_path, x, y)
	EntityAddChild( entity_id, jarated )
end