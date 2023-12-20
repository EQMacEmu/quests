function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("What?  Who the heck are you and how do you know my name?!  Never mind...  Just leave me alone!");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	end
end

function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	local ZoneTime = eq.get_zone_time()["zone_hour"];
	if(e.self:GetGrid() == 13) then
		if(e.wp > 0 and e.wp < 3) then
			e.self:SetRunning(false);
		elseif( e.wp == 3) then
			e.self:SetRunning(true);
			if(ZoneTime > 18 and ZoneTime < 24) then
				e.self:RemoveWaypoints();
				e.self:AssignWaypoints(math.random(21,25));
				e.self:SetRunning(false);
			elseif(ZoneTime > 6 or math.random(100) < 20) then
				eq.depop_with_timer();
			end
		end
	elseif(e.self:GetGrid() > 20 and e.self:GetGrid() < 26) then 
		if(e.wp == 1 or e.wp == 3) then
			e.self:SetRunning(true);
		else
			e.self:SetRunning(false);
		end
	end
	
	if(e.self:GetGrid() > 20 and e.self:GetGrid() < 26) then
		if(e.wp == 2 or e.wp == 3) then
			e.self:Say("S'ragg is going to have my head for losing that letter...");
		elseif(e.wp == 4) then
			e.self:RemoveWaypoints();
			e.self:AssignWaypoints(13);
			e.self:SetRunning(false);
		end
	end
end

function event_waypoint_depart(e)
	if(e.self:GetGrid() > 20 and e.self:GetGrid() < 26 and e.wp == 1) then
		eq.create_ground_object(18802,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,90000); -- A Sealed Letter (A Letter to Opal)
	end
end
