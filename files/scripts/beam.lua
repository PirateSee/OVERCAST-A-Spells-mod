local entity_id = GetUpdatedEntityID()
local x, y, rot = EntityGetTransform(entity_id)
local below = true

if rot > 0 then
	below = false
end
	
local rot = math.abs(rot) *180/math.pi
	
GamePrint(tostring(rot))

if rot < 22.5 or rot > 157.5 then
	LoadPixelScene( "mods/cool_spell/files/world/beam_ver.png", "", x-8, y-32, "", true )
elseif rot > 22.5 and rot < 67.5 then
	if below then
		LoadPixelScene( "mods/cool_spell/files/world/beam_diagonal.png", "", x-32, y-32, "", true )
	else
		LoadPixelScene( "mods/cool_spell/files/world/beam_diagonal_flip.png", "", x-32, y-32, "", true )
	end	
elseif rot > 67.5 and rot < 112.5 then
	LoadPixelScene( "mods/cool_spell/files/world/beam.png", "", x-32, y-8, "", true )
else
	if not below then
		LoadPixelScene( "mods/cool_spell/files/world/beam_diagonal.png", "", x-32, y-32, "", true )
	else
		LoadPixelScene( "mods/cool_spell/files/world/beam_diagonal_flip.png", "", x-32, y-32, "", true )
	end
end