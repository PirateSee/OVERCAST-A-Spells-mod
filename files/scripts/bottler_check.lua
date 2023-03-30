local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(entity_id)

local mats_comp = EntityGetFirstComponent(entity_id, "MaterialSuckerComponent")
if ( mats_comp == nil ) then 
	print_error("bottler somehow didn't have a MaterialSuckerComponent")
	return
end
local amount = ComponentGetValue2( mats_comp, "mAmountUsed" )
if amount == nil then
	amount("materials list nil")
else
	if amount >= 1000 then
		EntityKill(entity_id)
	end
end