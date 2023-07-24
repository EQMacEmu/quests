local BAD_COORDS = {
	-- top of buildings above blob2 area
	{ -1000, 670,		-- min X, max X
	  -1000, 1000,		-- min Y, max Y
	  254, 1000,		-- min Z, max Z
	},
	-- below front area with water floor
	{ -166, 900,		-- min X, max X
	  -640, 640,		-- min Y, max Y
	  -200, -1,			-- min Z, max Z
	},
	-- north end-of-water region
	{ 375, 750,		-- min X, max X
	  500, 640,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
	-- south end-of-water region
	{ 365, 750,		-- min X, max X
	  -640, -500,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
};

local cheaters = {};
local cheatersToSlay = false;

function event_spawn(e)
	eq.set_timer("check", 10000);
end

function event_signal(e)
	table.insert(cheaters, e.signal);
	if ( not cheatersToSlay ) then
		eq.set_timer("kill_list", 500);
	end
	cheatersToSlay = true;
eq.debug(tostring(e.signal));
end

function event_timer(e)
	if ( e.timer == "kill_list" ) then
		local i = #cheaters;
		local client;
		if ( i > 0 ) then		
			client = eq.get_entity_list():GetClientByID(cheaters[i]);
			if ( client and client.valid ) then
			
				if ( client:GetX() > 1366 and e.self:GetX() < 1000 ) then -- cazic touch has a spell data range of 1000 for some reason; need to move NPC to hit people far away
					e.self:GMMove(1092, 0, 235, 64);
					return;
				end
				e.self:CastSpell(982, client:GetID(), 0, 100); -- Cazic Touch
			end
			table.remove(cheaters, i);
		end
	
	elseif ( e.timer == "check" ) then
		local clientList = eq.get_entity_list():GetClientList();

		if ( clientList ) then
			for client in clientList.entries do
			
				if ( not client:GetGM() ) then
					for _, coords in ipairs(BAD_COORDS) do
					
						if ( client:GetX() > coords[1] and client:GetX() < coords[2]
							and client:GetY() > coords[3] and client:GetY() < coords[4]
							and client:GetZ() > coords[5] and client:GetZ() < coords[6]
						) then
							e.self:CastSpell(982, client:GetID(), 0, 100); -- Cazic Touch
							return;
						end
					end
				end
			end
		end
		
		if ( cheatersToSlay and #cheaters == 0 ) then
			eq.stop_timer("kill_list");
			cheatersToSlay = false;
			if ( e.self:GetX() > 500 ) then
				e.self:GMMove(500, 0, 255, 0);
			end
		end
	end
end
