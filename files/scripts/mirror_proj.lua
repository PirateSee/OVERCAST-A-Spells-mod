local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))

if EntityHasTag(entity_id, "projectile") then
	local comp = EntityGetFirstComponent( entity_id, "VelocityComponent")
	local x, y = EntityGetTransform(entity_id)
	local vx, vy = GameGetVelocityCompVelocity( entity_id)
	ComponentSetValue2(comp, "mVelocity", -vx, -vy)
	GamePlaySound( "data/audio/Desktop/projectiles.bank", "player_projectiles/chain_bolt/create", x, y )
	EntitySetTransform(entity_id, x, y, rot)
	if EntityGetName(entity_id) ~= nill then
		GamePrint("Affected: " .. EntityGetName(entity_id) .. " " .. entity_id)
	else
		GamePrint("Affected: " .. entity_id)
	end
else
	if entity_id ~= nil then
		GamePrint("Could not find entity " .. entity_id)
		GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
	end
end