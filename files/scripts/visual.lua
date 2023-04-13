dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id) -- entity loc

local vel_x,vel_y = GameGetVelocityCompVelocity(entity_id)

vel_x = vel_x * 0.25
vel_y = vel_y * 0.25

--gfx
local gfx_id = nil

local children = EntityGetAllChildren(entity_id)
if children ~= nil then
	for i,v in ipairs(children) do
		if EntityGetName(v) == "follow_gfx" then
			gfx_id = v
			break
		end
	end
end

if gfx_id == nil then
	GamePrint("couldn't find gfx entity")
	local gfx_id = EntityLoad("mods/cool_spell/files/actions/extra/follow_gfx.xml", x, y)
	EntityAddChild(entity_id, gfx_id)
end

if GameGetFrameNum()%2 == 0 then
	EntitySetTransform( gfx_id, x, y)
else
	EntitySetTransform( gfx_id, x+vel_x, y+vel_y)
end