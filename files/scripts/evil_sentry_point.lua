local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

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
	local gfx_id = EntityLoad("mods/cool_spell/files/actions/extra/sentry_laser_evil.xml", x, y)
	EntityAddChild(entity_id, gfx_id)
end

if GameGetFrameNum()%2 == 0 then

	local target = EntityGetClosestWithTag(x, y, "player_unit")
	
	tx, ty = EntityGetFirstHitboxCenter(target)
	EntitySetTransform( gfx_id, tx, ty)
else
	EntitySetTransform( gfx_id, x, y)
end


