dofile_once("data/scripts/lib/utilities.lua")

local emitter_id = GetUpdatedEntityID()
local x, y = EntityGetTransform(emitter_id)
local entity_id = EntityLoad("mods/cool_spell/files/actions/random_dumper.xml", x, y)
local comp = EntityGetFirstComponent(entity_id, "MaterialSeaSpawnerComponent")

SetRandomSeed(x, y)


if comp ~= nil then
	local material = "water"
	--local materials = {"water", "snow", "gunpowder", "overcast_magic_liquid_mystery"}
	dofile_once("data/scripts/items/potion.lua") -- get material lists from potion.lua for mod compat
	if Random(1,3) == 1 then --33%
		material = random_from_array(materials_magic)
	else
		material = random_from_array(materials_standard)
	end
	material = material.material
	
	ComponentSetValue2(comp, "material", CellFactory_GetType(material))
	comp = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent")
	ComponentSetValue2(comp, "emitted_material_name", material)
end