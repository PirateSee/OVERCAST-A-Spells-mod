local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

--GamePrint("evil sentry")

local tx, ty = nil

local in_range = false

--[[local selection = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
if EntityGetTags(selection) ~= nil then
	local targets = EntityGetInRadiusWithTag( x, y, 128, "mortal" )
	for i, v in ipairs(targets) do
		if v == selection then
			in_range = true
			break
		end
	end
	tx, ty = EntityGetFirstHitboxCenter(selection)
end]]--

if in_range == false then
	local target = EntityGetClosestWithTag(x, y, "player_unit")
	--[[local targets = EntityGetInRadiusWithTag( x, y, 96, "player_unit" )

	for i, v in ipairs(targets) do
		if v == target then
			in_range = true
			break
		end
	end]]--
	in_range = true
	tx, ty = EntityGetFirstHitboxCenter(target)
end

if in_range == false then
	--summon_proj()
	GamePrint("not in range")
	return
end

local ay = ty - y
local ax = tx - x

--[[local comp = EntityGetFirstComponent(sentry_actors[1], "VelocityComponent")
ComponentSetValue2(comp, "mVelocity", ax, ay)
EntitySetTransform(sentry_actors[1], x, y)]]--

local proj_options = {"mods/cool_spell/files/actions/hazard_spark.xml", "mods/cool_spell/files/actions/impulseshot.xml", "mods/cool_spell/files/actions/plasma_bolt.xml", "mods/cool_spell/files/actions/pinpoint_laser.xml", "data/entities/projectiles/deck/light_bullet.xml", "data/entities/projectiles/deck/rubber_ball.xml", "data/entities/projectiles/deck/firebomb.xml", "data/entities/projectiles/deck/bullet_heavy.xml"} -- removed: "data/entities/projectiles/deck/iceball.xml", "data/entities/projectiles/deck/rocket.xml", "data/entities/projectiles/deck/disc_bullet.xml"
SetRandomSeed(ay, ax+GameGetFrameNum())

local proj = EntityLoad(proj_options[Random(1, #proj_options)], x, y)
GameShootProjectile( entity_id, x, y, tx, ty, proj) 
local comp = EntityGetFirstComponent(proj, "ProjectileComponent")
ComponentSetValue2(comp, "friendly_fire", true)