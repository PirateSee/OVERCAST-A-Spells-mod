local entity_id = GetUpdatedEntityID()
local wand_id = EntityGetParent(entity_id)

if EntityHasTag(wand_id, "wand") then
	local ability_comp = EntityGetFirstComponentIncludingDisabled( wand_id, "AbilityComponent" )
	if ability_comp ~= nil then
		local cast_comp = EntityGetFirstComponentIncludingDisabled( wand_id, "VariableStorageComponent", "overcast_last_cast_frame" )
		local last_cast = ComponentGetValue2(cast_comp, "value_int")
		if last_cast == nil or last_cast == 0 then return end
		local t = GameGetFrameNum()
		
		local damage_percent = math.min((t-last_cast)/600, 1)
		GamePrint(tostring(damage_percent))
		
		local damage_add = (1)*damage_percent
		GamePrint(tostring(damage_add))
		local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

		ComponentObjectSetValue2(comp, "damage_by_type", "projectile", ComponentObjectGetValue2(comp, "damage_by_type", "projectile") + damage_add)
		
	else
		print_error("[DAMAGE_AMP] no abilitycomponent found!")
	end
else
	print("[DAMAGE_AMP] parent is not a wand")
end