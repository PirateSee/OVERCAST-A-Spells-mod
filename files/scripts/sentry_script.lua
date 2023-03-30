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
	local target = EntityGetClosestWithTag(x, y, "enemy")
	local targets = EntityGetInRadiusWithTag( x, y, 96, "enemy" )

	for i, v in ipairs(targets) do
		if v == target then
			in_range = true
			break
		end
	end
	tx, ty = EntityGetFirstHitboxCenter(target)
end

if in_range == false then
	EntityKill(sentry_actors[1])
	return
end

local ay = ty - y
local ax = tx - x

local comp = EntityGetFirstComponent(sentry_actors[1], "VelocityComponent")
ComponentSetValue2(comp, "mVelocity", ax, ay)
EntitySetTransform(sentry_actors[1], x, y)

EntityKill(sentry_actors[1])