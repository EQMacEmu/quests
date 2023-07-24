function event_spawn(event)
	local xloc = event.self:GetX();
	local yloc = event.self:GetY();
	local zloc = event.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25, zloc - 25, zloc + 25);
end

function event_enter(event)
	eq.set_timer("depop", 300000);
end

function event_timer(event)
	selfX = event.self:GetX();
	selfY = event.self:GetY();
	selfZ = event.self:GetZ();

	local clientList = eq.get_entity_list():GetClientList();
	local clientCount = 0;

	if ( clientList ) then
		for client in clientList.entries do
			if ( client:CalculateDistance(selfX, selfY, selfZ) < 75 ) then
				clientCount = clientCount + 1;
			end
		end
	end
	
	if ( clientCount >= 3 ) then
		event.self:Emote("paranoid,  you look at each of your party members.  Which one will be corrupted first?  Who will die next?  Will one of them fail me?");
	end
	eq.stop_timer("depop");
	eq.depop_with_timer();
end
