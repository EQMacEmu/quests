local delivery = 0;

function event_signal(e)
	local qglobal = eq.get_qglobals();

	if(e.signal == 1) then
		e.self:Emote("Chuga.. Chug..Chug.. 'This unit requires maintenance.'");
	elseif(e.signal == 2) then
		if(qglobal["CargoClockwork"] == nil) then
			eq.set_global("CargoClockwork","1",7,"H2");
			eq.start(5); --Path to windmills
		end	
	end
end

function event_waypoint_depart(e)
	if(e.wp == 1) then
		if(delivery == 1) then
			eq.stop();
			delivery = 0;
		end
	elseif(e.wp == 8) then
		e.self:Say("kachunk .. kachunk..");
		eq.signal(56155,1); --Watchman_Halv
	elseif(e.wp == 10) then
		if(delivery == 0) then
			delivery = 1;
			e.self:Emote("Chuga.. Chug..Chug..");
			e.self:Emote("The chugging of the Cargo Clockwork comes to a halt.");
			eq.unique_spawn(56178,0,0,30,-700,-109,62); --Hector
			eq.unique_spawn(56179,0,0,95,-732,-108,240); --Renaldo
			eq.unique_spawn(56180,0,0,53,-615,-107,113); --Jerald
			e.self:Say("This is highway robbery.");
		end
	end
end

function event_death_complete(e)
	delivery = 0;
	eq.signal(56178,0); --Hector
	eq.signal(56179,0); --Renaldo
	eq.signal(56180,0); --Jerald
end
