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
	
	if ( clientCount >= 2 ) then
		event.self:Emote("with rage, you can hardly wait until you are able to spill blood again.  In fact, you might not wait!  You never did like the way that person over there looked at you!");
	end
	eq.stop_timer("depop");
	eq.depop_with_timer();
end
