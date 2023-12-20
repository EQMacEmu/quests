local despawntime;

function event_spawn(e)
	if(e.self:GetSpawnPointID() == 365105 or e.self:GetSpawnPointID() == 365106) then
		despawntime = 0;
		eq.set_timer("depop",8640000);
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.stop_timer("depop");
		despawntime = 1;
	end
end

function event_waypoint_arrive(e)
	local ZoneTime = eq.get_zone_time()["zone_hour"];
	if(e.self:GetGrid() == 26 and despawntime == 1) then
		if(e.wp == 0 and ZoneTime > 7 and ZoneTime < 20) then
			despawntime = 0;
			eq.depop_with_timer();
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Hail, " .. e.other:GetCleanName() .. ".  Pyzjn is working for Master Varsoon.  If Pyzjn do good work maybe Master Varsoon tell Master Bruax he is worthy.  Pyzjn must go now.  All glory to the Plaguebringer!  May you die a painful, oozing death.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	end
end

