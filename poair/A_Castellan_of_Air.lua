local CONTROLLER_TYPE = 215419; -- POACastellanController
local INLOKHER_TYPE = 215409; -- #Inlokher_the_Warlord

function event_death_complete(e)

	eq.signal(CONTROLLER_TYPE, 1);
	eq.signal(215383, e.killer:GetID(), 1000); -- #Constable_Alranderisan
	eq.signal(215384, e.killer:GetID(), 1000); -- #Constable_Belecohen
	eq.signal(215385, e.killer:GetID(), 1000); -- #Constable_Ferabalen

	local roll = math.random(100);
	
	if ( roll < 6 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(INLOKHER_TYPE) ) then
		eq.spawn2(INLOKHER_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	end
	
	roll = math.random(1, 4);
	
	for i = 1, roll do
		eq.spawn2(215413, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_Vengeful_Airspirit
	end
end
