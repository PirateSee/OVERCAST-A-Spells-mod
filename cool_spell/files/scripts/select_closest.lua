local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local selected_entity = EntityGetClosestWithTag( x, y, "mortal" )
local targets = EntityGetInRadiusWithTag( x, y, 64, "mortal" )

local in_range = false

for i, v in ipairs(targets) do
	if v == selected_entity then
		in_range = true
		break
	end
end

if in_range then
	GamePrint("Selected: " .. EntityGetName( selected_entity ) .. selected_entity)
	GlobalsSetValue("cool_spell_stored_id", tostring(selected_entity))
	GamePlaySound("data/audio/Desktop/projectiles.bank", "player_projectiles/all_seeing_eye/create", x, y)
else
	GamePrint("Couldn't find an applicable entity in range!")
	GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
end