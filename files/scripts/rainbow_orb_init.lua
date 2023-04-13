local entity_id = GetUpdatedEntityID()

SetRandomSeed(entity_id, entity_id-3)
local types = {"projectile","slice","melee","fire","curse","drill","electricity","explosion","ice","radioactive"}
local rnd = Random(1, #types)
local dmg_type = types[rnd]

local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")

ComponentObjectSetValue2(comp, "damage_by_type", dmg_type, ComponentObjectGetValue2(comp, "damage_by_type", dmg_type) + 0.5)

-- gfx
local types_materials = {"spark_green", "magic_liquid_berserk", "silver", "fire", "neon_tube_blood_red", "gold", "diamond", "spark_yellow", "blood_cold", "plasma_fading_green"}
local gfx_comp = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent", "rainbow_damage")
ComponentSetValue2(gfx_comp, "emitted_material_name", types_materials[rnd])