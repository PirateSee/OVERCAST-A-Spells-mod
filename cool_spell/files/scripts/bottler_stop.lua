dofile_once( "data/scripts/lib/utilities.lua" )

local entity_id = GetUpdatedEntityID()

local ecomp = EntityGetComponent(entity_id, "ParticleEmitterComponent")[2]
ComponentSetValue2(ecomp, "is_emitting", false)