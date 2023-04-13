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
	local gfx_id = EntityLoad("mods/cool_spell/files/actions/extra/sentry_laser.xml", x, y)
	EntityAddChild(entity_id, gfx_id)
end

if GameGetFrameNum()%2 == 0 then

	local in_range = false

	local selection = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
	if EntityGetTags(selection) ~= nil then
		local targets = EntityGetInRadiusWithTag( x, y, 128, "mortal" )
		for i, v in ipairs(targets) do
			if v == selection then
				in_range = true
				break
			end
		end
		tx, ty = EntityGetFirstHitboxCenter(selection)
	end

	if in_range == false then
		local targets = EntityGetInRadiusWithTag( x, y, 96, "enemy" )
		local target
		for i,v in ipairs(targets) do
			EntityAddTag( v, "sentry_tocheck" )
		end
		
		function raycheck(target)
			if target == 0 then
				return "fail"
			end
			EntityRemoveTag( target, "sentry_tocheck" )
			for i, v in ipairs(targets) do
				if v == target then
					local vx, vy = EntityGetTransform(v)
					if not RaytracePlatforms(x,y,vx,vy) then
						return "good"
					end
					return "wall"
				end
			end
			return "miss"
		end
		
		while true do
			target = EntityGetClosestWithTag(x, y, "sentry_tocheck")
			local status = raycheck(target)
			print("status: " .. status)
			if status == "good" then in_range = true; break end
			if status ~= "wall" then break end
		end
		
		if target ~= 0 then
			tx, ty = EntityGetFirstHitboxCenter(target)
		else
			local fb_targets = EntityGetInRadiusWithTag( x, y, 96, "enemy" )
			local fb_target = EntityGetClosestWithTag(x, y, "enemy")

			for i, v in ipairs(fb_targets) do
				if v == fb_target then
					in_range = true
					break
				end
			end
			if in_range then
				tx, ty = EntityGetFirstHitboxCenter(fb_target)
			end
		end
		
		local targets_remove = EntityGetInRadiusWithTag( x, y, 96, "sentry_tocheck" )
		for i,v in ipairs(targets_remove) do
			EntityRemoveTag( v, "sentry_tocheck" )
		end
	end
	
	if in_range == true then
		EntitySetTransform( gfx_id, tx, ty)
	else
		EntitySetTransform( gfx_id, x, y)
	end
else
	EntitySetTransform( gfx_id, x, y)
end


