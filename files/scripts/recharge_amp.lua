local entity_id = GetUpdatedEntityID()
local wand_id = EntityGetParent(entity_id)

if EntityHasTag(wand_id, "wand") then
	local ability_comp = EntityGetFirstComponentIncludingDisabled( wand_id, "AbilityComponent" )
	if ability_comp ~= nil then
		local cast_comp = EntityGetFirstComponentIncludingDisabled( wand_id, "VariableStorageComponent", "overcast_last_cast_frame" )
		local last_cast = ComponentGetValue2(cast_comp, "value_int")
		if last_cast == nil or last_cast == 0 then return end
		local t = GameGetFrameNum()
		
		local mana_percent = math.min((t-last_cast)/300, 1)
		--GamePrint(tostring(mana_percent))
	
		local mana = ComponentGetValue2(ability_comp, "mana")
		local mana_charge_speed = ComponentGetValue2(ability_comp, "mana_charge_speed")
		local mana_max = ComponentGetValue2(ability_comp, "mana_max")
		
		local mana_add = (4.5)*mana_percent
		--GamePrint(tostring(mana_add))
		mana_add = math.min(mana+mana_add, mana_max)
		ComponentSetValue2( ability_comp, "mana", mana_add )
		
		local gfx_comp = EntityGetFirstComponentIncludingDisabled(entity_id, "ParticleEmitterComponent")
		ComponentSetValue2(gfx_comp, "is_emitting", true)
		ComponentSetValue2(gfx_comp, "emission_interval_max_frames", math.ceil((1-mana_percent)*20))
		ComponentSetValue2(gfx_comp, "emission_interval_min_frames", math.ceil((1-mana_percent)*17))
		
	else
		print_error("[RECHARGE_AMP] no abilitycomponent found!")
	end
else
	print("[RECHARGE_AMP] parent is not a wand")
end