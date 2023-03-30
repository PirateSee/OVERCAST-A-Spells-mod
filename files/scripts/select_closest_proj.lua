local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
EntityRemoveTag(entity_id, "projectile")
local selected_entity = EntityGetClosestWithTag( x, y, "projectile" )

local targ_x, targ_y = EntityGetTransform(selected_id)
local selected_entity_name = ""
local in_range = false

local targets = EntityGetInRadiusWithTag(x,y,64,"projectile")
for k=1,#targets
do v = targets[k]
	if v == selected_entity then
		in_range = true
	end
end

--Note[Conga]: Tried using get_distance math to make the radius check easier but unfortunately math.sqrt broke the lua function somehow...

if EntityHasTag(selected_entity,"player_unit") then
	selected_entity_name = "Minä"
elseif #EntityGetName( selected_entity ) <= 0 then
	selected_entity_name = "Eloton esine" --Inanimate object, according to DeepL
else
	selected_entity_name = GameTextGetTranslatedOrNot(EntityGetName( selected_entity ))
end

if in_range then
	GamePrint("Selected: " .. selected_entity_name .. " " .. selected_entity)
	GlobalsSetValue("cool_spell_stored_id", tostring(selected_entity))
	GamePlaySound("data/audio/Desktop/projectiles.bank", "player_projectiles/all_seeing_eye/create", x, y)
else
	GamePrint("Couldn't find an applicable entity in range!")
	GamePlaySound( "data/audio/Desktop/ui.bank", "ui/button_denied", x, y )
end