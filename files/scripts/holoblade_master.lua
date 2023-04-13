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
	
	
	if diffrence > 0.45 then
		ComponentSetValue2(comp_shield, "energy", 1)
		ComponentSetValue2(comp_area, "damage_per_frame", 0.25)
		--GamePrint("swinging fast")
	elseif diffrence > 0.18 then
		ComponentSetValue2(comp_area, "damage_per_frame", 0.25)
		ComponentSetValue2(comp_shield, "energy", 0)
		--GamePrint("swinging fast")
	else
		ComponentSetValue2(comp_area, "damage_per_frame", 0.075)
		ComponentSetValue2(comp_shield, "energy", 0)
	end
end

local pride = ModSettingGet("cool_spell.holoblade_pride")
--GamePrint(tostring(pride))
if pride == nil or pride == false then
	ComponentSetValue2(comp_particle, "emitted_material_name", "material_rainbow")
else
	ComponentSetValue2(comp_particle, "emitted_material_name", pride)
end

ComponentSetValue2(comp, "value_float", rot)