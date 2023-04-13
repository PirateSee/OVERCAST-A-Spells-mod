local entity_id = GetUpdatedEntityID()
local x, y, rot = EntityGetTransform(entity_id)

local comp = EntityGetFirstComponentIncludingDisabled(entity_id, "VariableStorageComponent")
local comp_area = EntityGetFirstComponent(entity_id, "AreaDamageComponent")
local comp_particle = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent")
local comp_shield = EntityGetFirstComponentIncludingDisabled(entity_id, "EnergyShieldComponent")
local old_rot = ComponentGetValue2(comp, "value_float")

--GamePrint(tostring(rot))

if old_rot ~= nil then
	local diffrence = math.abs(rot - old_rot)
	
	--GamePrint(tostring(diffrence))
	
	
	if diffrence > 0.5 then
		ComponentSetValue2(comp_shield, "energy", 1)
		ComponentSetValue2(comp_area, "damage_per_frame", 0.75)
		--GamePrint("swinging fast")
		--GamePrint(tostring(ComponentGetValue2(comp_shield, "energy")))
		ComponentSetValue2(comp_particle, "emitted_material_name", "plasma_fading_green")
	elseif diffrence > 0.25 then
		ComponentSetValue2(comp_area, "damage_per_frame", 0.75)
		ComponentSetValue2(comp_shield, "energy", 0)
		--GamePrint("swinging fast")
		ComponentSetValue2(comp_particle, "emitted_material_name", "plasma_fading_green")
	else
		ComponentSetValue2(comp_area, "damage_per_frame", 0.025)
		ComponentSetValue2(comp_shield, "energy", 0)
		ComponentSetValue2(comp_particle, "emitted_material_name", "spark_green")
	end
end

ComponentSetValue2(comp, "value_float", rot)