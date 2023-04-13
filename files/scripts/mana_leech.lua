local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)
local radius = 64

local targets = EntityGetInRadiusWithTag( x, y, radius, "homing_target" )
local targets2 = EntityGetInRadiusWithTag( x, y, radius, "summon_player" )

local player = EntityGetClosestWithTag(x, y, "player_unit")

if ( #targets2 > 0 ) then
	for i,v in ipairs( targets2 ) do
		table.insert( targets, v )
	end
end

local count = 0
local who_shot
local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
if ( comp ~= nil ) then
	who_shot = ComponentGetValue2( comp, "mWhoShot" )
end

if ( who_shot ~= nil ) and ( comp ~= nil ) then
	for i,id in ipairs(targets) do
		if ( id ~= root_id ) and ( id ~= entity_id ) and ( id ~= who_shot ) then
			local mana = EntityLoad("mods/cool_spell/files/effects/mini_mana_regeneration.xml", x, y)
			EntityAddChild(player, mana)
			-- gfx
			local tx, ty = EntityGetTransform(id)
			EntityLoad("mods/cool_spell/files/actions/mana_leech_gfx.xml", tx, ty)
			
			local arc = EntityLoad("mods/cool_spell/files/actions/mana_leech_arc.xml", x, y)
			local comp = EntityGetFirstComponent(arc, "ArcComponent")
			ComponentSetValue2(comp, "mArcTarget", id)
		end
	end
end