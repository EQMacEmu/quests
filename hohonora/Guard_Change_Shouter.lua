local HERO_TYPE = 211002; -- Hero_Shrine_Guardian

local HEROS = {
	{
		spawn = { 80, 10, 12 },
		grid = {
			{ -260, 10, -1, 0 },
			{ -260, 1975, -1, 0 },
			{ -705, 1970, -1, 0 },
			{ -715, 2005, -1, 60 },
			{ -735, 2005, 65, 2400 },
		},
	},
	{
		spawn = { 80, 5, 12 },
		grid = {
			{ -260, 5, -1, 0 },
			{ -260, 1965, -1, 0 },
			{ -705, 1970, -1, 0 },
			{ -715, 1934, -1, 60 },
			{ -734, 1934, 65, 2400 },
		},
	},
	{
		spawn = { 80, 0, 12 },
		grid = {
			{ -260, 0, -1, 0 },
			{ -1020, 0, -1, 0 },
			{ -1020, -1070, -1, 0 },
			{ -1100, -1130, -1, 0 },
			{ -1360, -1130, -1, 0 },
			{ -1360, -1320, -1, 0 },
			{ -1370, -1320, -1, 60 },
			{ -1391, -1320, 0, 2400 },
		},
	},
	{
		spawn = { 80, -5, 12 },
		grid = {
			{ -260, -5, -1, 0 },
			{ -1020, -5, -1, 0 },
			{ -1020, -1070, -1, 0 },
			{ -1100, -1130, -1, 0 },
			{ -1360, -1130, -1, 0 },
			{ -1360, -1320, -1, 0 },
			{ -1345, -1320, -1, 60 },
			{ -1327, -1320, 0, 2400 },
		},		
	},
};

local oldIDs;
local newIDs = {};

function event_spawn(e)
	eq.set_timer("timecheck", 10000);
end

function event_timer(e)

	if ( e.timer == "timecheck" ) then
	
		local zoneTime = eq.get_zone_time()["zone_hour"];
		local npc, pause;
		
		if ( zoneTime == 7 or zoneTime == 19 ) then
				
			eq.zone_emote(0, "You hear a chime in the distance, and a voice booms in your ears, 'It is now the time for the changing of the guard!'");
			
			oldIDs = newIDs;
			newIDs = {};
			
			for i, t in ipairs(HEROS) do
			
				npc = eq.spawn2(HERO_TYPE, 0, 0, t.spawn[1], t.spawn[2], t.spawn[3], 192);
				npc = npc:CastToNPC();
				table.insert(newIDs, npc:GetID());
				--npc:SetRunning(true);
				npc:SetWanderType(6);
				npc:SetPauseType(1);
				
				npc:AddWaypoint(t.spawn[1], t.spawn[2], t.spawn[3], -1, 0, false);
				for j, t2 in ipairs(t.grid) do
					npc:AddWaypoint(t2[1], t2[2], 7.5, t2[3], t2[4], false);
				end
				eq.set_timer("failsafe", 72*60*1000, npc);
			end
			
			eq.set_timer("wait", 900000);
			eq.stop_timer(e.timer);
		end
	
	elseif ( e.timer == "wait" ) then
		eq.set_timer("timecheck", 10000);
		eq.stop_timer(e.timer);	
	end
end

function event_signal(e)
	local newnpc = eq.get_entity_list():GetNPCByID(e.signal);

	if ( newnpc and newnpc.valid ) then

		local zoneTime = eq.get_zone_time()["zone_hour"];
		
		for i, id in ipairs(newIDs) do
			if ( id == newnpc:GetID() and oldIDs[i] ) then
				local oldnpc = eq.get_entity_list():GetNPCByID(oldIDs[i]);
				
				if ( oldnpc and oldnpc.valid ) then
					if ( newnpc:CalculateDistance(oldnpc:GetX(), oldnpc:GetY(), oldnpc:GetZ()) < 200 ) then
						newnpc:FaceTarget(oldnpc);
						oldnpc:FaceTarget(newnpc);
						if ( i == 1 or i == 3 ) then
							if ( zoneTime > 18 ) then
								newnpc:Say("Good evening, time for you to leave.  Get some sleep.");
							else
								newnpc:Emote("salutes and instructs his counterpart to leave his post.");
							end
						else
							if ( zoneTime > 18 ) then
								newnpc:Say("Your shift has ended.  Have a good evening, and good work today.");
							else
								newnpc:Say("Hail, solider.  Your are relieved of duty, please report back to this post at the end of my shift.");
							end
						end
					end
					eq.signal(211002, oldnpc:GetID()); -- Hero_Shrine_Guardian
					return;
				end
			end
		end
		
		newnpc:ResumeWandering();
	end
end
