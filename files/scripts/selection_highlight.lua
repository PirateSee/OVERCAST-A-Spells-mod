local highlighter_id = GetUpdatedEntityID()
local comp1 = EntityGetFirstComponent(highlighter_id, "SpriteComponent")
local comp2 = EntityGetFirstComponent(highlighter_id, "ParticleEmitterComponent")
local entity_id = tonumber(GlobalsGetValue("cool_spell_stored_id", "0"))
if EntityGetTags(entity_id) ~= nil then
	local x, y = EntityGetFirstHitboxCenter( entity_id )
	ComponentSetValue2( comp1, "alpha", 0.5 )
	ComponentSetValue2( comp2, "is_emitting", true )
	EntitySetTransform(highlighter_id, x, y)
else
	ComponentSetValue2( comp1, "alpha", 0 )
	ComponentSetValue2( comp2, "is_emitting", false )
	EntitySetTransform(highlighter_id, 0, 0)
end