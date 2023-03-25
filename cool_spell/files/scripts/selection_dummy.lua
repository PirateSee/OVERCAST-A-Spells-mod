dofile_once("data/scripts/lib/utilities.lua")

local highlighter_id = GetUpdatedEntityID()
local hx, hy, rot = EntityGetTransform(highlighter_id)
local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))

local tx, ty = EntityGetFirstHitboxCenter( entity_id )

local off_x = 1
local off_y = 0
off_x, off_y = vec_rotate(off_x, off_y, rot)

off_x = off_x * 8
off_y = off_y * 8
--rot = rot + 180*math.pi/180

EntitySetTransform(highlighter_id, tx+off_x, ty+off_y)