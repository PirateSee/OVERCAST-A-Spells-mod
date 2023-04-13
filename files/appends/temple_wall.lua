RegisterSpawnFunction( 0xffB2CCFF, "spawn_master_sword" )

function spawn_master_sword(x,y)
	EntityLoad("mods/cool_spell/files/wands/master_sword.xml", x, y)
end

function init( x, y, w, h )
	if x == -2048 and y == 2560 then
		LoadPixelScene( "mods/cool_spell/files/world/master_sword_brickwork.png", "", -2048, 2816, "", true)
		spawn_altar_top(x, y, false)
	else
		spawn_altar_top(x, y, true)
	end
end