dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local player_id = EntityGetParent( entity_id )
local x, y = EntityGetTransform( entity_id )

if ( player_id ~= NULL_ENTITY ) and ( entity_id ~= player_id ) then
	local comp = EntityGetFirstComponent( player_id, "DamageModelComponent" )
	local comp2 = EntityGetFirstComponent( entity_id, "VariableStorageComponent")
	if ( comp ~= nil ) and ( comp2 ~= nil ) then
		ComponentSetValue2(comp, "blood_multiplier", ComponentGetValue2(comp2, "value_float"))
	end
end