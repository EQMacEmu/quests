function event_spawn(e)
	eq.set_timer("spam", 1800000);
end

function event_timer(e)
	local client_list = eq.get_entity_list():GetClientList();
	if(client_list ~= nil) then
		eq.signal(76383, 1); -- NPC: an_Agent_of_Innoruuk
		eq.signal(76215, 1); -- NPC: a_Disciple_of_Innoruuk
		eq.signal(76021, 1); -- NPC: a_Knight_of_Innoruuk
		eq.signal(76346, 1); -- NPC: a_Sage_of_Innoruuk
		eq.signal(76087, 1); -- NPC: a_Champion_of_Innoruuk
	end
end
