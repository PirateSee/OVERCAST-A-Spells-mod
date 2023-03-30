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

local bottle = EntityLoad("data/entities/items/pickup/potion_empty.xml", x, y)

local biggest_mat = "water"
local biggest_mat_count = 0

for k,v in pairs(materials) do
	if v ~= 0 then
		AddMaterialInventoryMaterial( bottle, CellFactory_GetName(k-1), v )
		if v > biggest_mat_count then
			print(CellFactory_GetName(k), CellFactory_GetName(k-1), v)
			biggest_mat_count = v
			biggest_mat = CellFactory_GetName(k-1)
		end
		print(k-1, CellFactory_GetName(k-1), v)
	end
end

local release = EntityLoad("mods/cool_spell/files/actions/bottler_release.xml", x, y)

local ecomp = EntityGetComponent(release, "ParticleEmitterComponent")
ComponentSetValue2(ecomp[1], "emitted_material_name", biggest_mat)
ComponentSetValue2(ecomp[2], "emitted_material_name", biggest_mat)