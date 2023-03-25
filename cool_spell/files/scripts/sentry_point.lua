local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local sentry_core = EntityGetClosestWithTag(x, y, "overcast_core_sentry")

if sentry_core == nil then
	EntityKill(entity_id)
end

local target = EntityGetClosestWithTag(x, y, "enemy")
local targets = EntityGetInRadiusWithTag( x, y, 96, "enemy" )

local in_range = false

for i, v in ipairs(targets) do
	if v == target then
		in_range = true
		break
	end
end

local tx, ty = EntityGetTransform(target)

local ay = ty - y
local ax = tx - x

local cx, cy = EntityGetTransform(sentry_core)
local rot = math.atan2(ay, ax)*math.pi/180
EntitySetTransform(entity_id, cx, cy, rot)
local nx, ny nrot = EntityGetTransform(entity_id)
GamePrint(rot .. " " .. nrot)