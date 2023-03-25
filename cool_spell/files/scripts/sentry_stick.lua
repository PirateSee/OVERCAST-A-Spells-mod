local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local sentry_core = EntityGetClosestWithTag(x, y, "overcast_core_sentry")

if sentry_core == nil then
	EntityKill(entity_id)
end

local cx, cy = EntityGetTransform(sentry_core)

EntitySetTransform(entity_id, cx, cy)