local entity_id = GetUpdatedEntityID()
local comp = EntityGetFirstComponent(entity_id, "ProjectileComponent")
local triggers = ComponentGetValue2(comp, "mTriggers")

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

print(tostring(triggers))
print(dump(triggers))