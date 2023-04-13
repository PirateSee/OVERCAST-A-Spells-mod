dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id) -- entity loc
local player_id = EntityGetClosestWithTag(x, y, "player_unit")
local px, py = EntityGetTransform(player_id) --plr loc
local comp = EntityGetFirstComponent(player_id, "CharacterDataComponent")
local vx, vy = ComponentGetValueVector2(comp, "mVelocity") -- velocity

--local force = 25

local dir_x, dir_y = vec_sub(x, y, px, py) -- direction

local length = get_magnitude(dir_x+vx, dir_y+vy)/3

local length = math.max(math.min(0.001*length*length*length, 100), -100)


dir_x,dir_y = vec_normalize(dir_x, dir_y)

dir_x = dir_x * length
dir_y = dir_y * length

ComponentSetValue2(comp, "mVelocity", vx+dir_x, vy+dir_y)

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
	--GamePrint("couldn't find gfx entity")
	local gfx_id = EntityLoad("mods/cool_spell/files/actions/extra/follow_gfx.xml", x, y)
	EntityAddChild(entity_id, gfx_id)
end

if GameGetFrameNum()%2 == 0 then
	EntitySetTransform( gfx_id, x, y)
else
	EntitySetTransform( gfx_id, px, py)
end