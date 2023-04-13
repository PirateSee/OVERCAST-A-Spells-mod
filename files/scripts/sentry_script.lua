local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local sentry_actors = EntityGetInRadiusWithTag(x, y, 1, "overcast_gun_sentry" )

if sentry_actors[1] == nil then
	print_error("no gun sentry entity found!")
	return
end

local tx, ty = nil

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

if in_range == false then
	SetRandomSeed(x+y, #sentry_actors)
	local ax = Randomf(-1,1)
	local ay = Randomf(-1,1)

	local comp = EntityGetFirstComponent(sentry_actors[1], "VelocityComponent")
	ComponentSetValue2(comp, "mVelocity", ax, ay)
	EntitySetTransform(sentry_actors[1], x, y)
	EntityKill(sentry_actors[1])
	return
end

local ay = ty - y
local ax = tx - x

local comp = EntityGetFirstComponent(sentry_actors[1], "VelocityComponent")
ComponentSetValue2(comp, "mVelocity", ax, ay)
EntitySetTransform(sentry_actors[1], x, y)

EntityKill(sentry_actors[1])