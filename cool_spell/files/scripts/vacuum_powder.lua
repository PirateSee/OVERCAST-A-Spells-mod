dofile_once( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local mats_comp = EntityGetFirstComponent(entity_id, "MaterialInventoryComponent")
if ( mats_comp == nil ) then 
	print_error("vacuum somehow didn't have a MaterialInventoryComponent")
	return
end
local materials = ComponentGetValue2( mats_comp, "count_per_material_type" )
if materials == nil then
	print_error("materials list nil")
end

local releaser = EntityLoad("mods/cool_spell/files/actions/vacuum_releaser.xml", x, y)

for k,v in pairs(materials) do
	if v ~= 0 then
		AddMaterialInventoryMaterial( releaser, CellFactory_GetName(k-1), v )
		print(k-1, CellFactory_GetName(k-1), v)
	end
end

local comp = EntityGetFirstComponent( releaser, "DamageModelComponent" )
if ( comp ~= nil ) then
	ComponentSetValue2( comp, "kill_now", true )
end

EntityInflictDamage( releaser, 1000, "DAMAGE_PROJECTILE", "", "NONE", 0, 0 )