local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local targets = EntityGetInRadiusWithTag( x, y, 64, "overcast_puzzle_reciever" )

GamePrint("helooo")

GamePrint("checking for reciever " .. #targets)

if targets[1] ~= nil then
	GamePrint("overcast_puzzle thing succed")
end