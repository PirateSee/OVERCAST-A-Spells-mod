dofile_once("data/scripts/lib/utilities.lua")

local entity_id    = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

SetRandomSeed( GameGetFrameNum(), pos_x + pos_y + entity_id )

local count = 1
--local types = { "bomb", "glitter_bomb", "propane_tank", "bomb_small", "bomb_cart" }

local raycasts = 4
local dir = ( math.pi * 2.0 ) / raycasts
local length = 6

for i=1,count do
	--local rnd = ( Random( 0, #types - 1 ) * Random( 0, 1 ) ) + 1
	--local entity = types[rnd]
	
	local limit = 0
	local off_x,off_y = 0,0
	local wall = true
	local failed = false
	
	if Random(1,10) == 1 then -- chance of not spawning
		failed = true
	end
	
	if failed == false then
		while ( math.abs( off_x ) + math.abs( off_y ) < 90 ) or wall do
			off_x = Random( -256, 256 )
			off_y = Random( -256, 256 )
			
			local sx = pos_x + off_x
			local sy = pos_y + off_y
			
			for j=0,raycasts-1 do
				local ex = sx + math.cos( j * dir ) * length
				local ey = sy - math.sin( j * dir ) * length
				
				wall = RaytraceSurfaces( sx, sy, ex, ey )
				
				if wall then
					break
				end
			end
			
			limit = limit + 1
			if ( limit > 20 ) then
				print( "Couldn't find a good spot" )
				wall = false
				failed = true
			end
		end
	end

	if ( failed == false ) then
		EntityLoad( "mods/cool_spell/files/actions/evil_sentry.xml", pos_x + off_x, pos_y + off_y )
		EntityLoad( "data/scripts/streaming_integration/entities/empty_circle_tiny_bomb.xml", pos_x + off_x, pos_y + off_y )
	end
end

GameScreenshake( 10 )
