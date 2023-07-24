function event_signal(e)
	local client = eq.get_entity_list():GetClientByID(e.signal);
	if ( client and client.valid ) then
		e.self:AddToHateList(client, 1);
	end
end

function event_death_complete(e)
	eq.signal(215419, 2); -- POACastellanController
	eq.signal(215411, e.killer:GetID(), 1000); -- #Chamberlain_Escalardian
	eq.signal(215410, e.killer:GetID(), 1000); -- #A_Chamberlain`s_Apprentice
end
