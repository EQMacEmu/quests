local count = 0;

function event_spawn(e)
	eq.set_timer("proxsay",2000);
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25);
	eq.enable_proximity_say();
	eq.stop_timer("proxsay");
end

function event_proximity_say(e)
	local xloc = e.other:GetX();
	local yloc = e.other:GetY();
	local nxloc = e.self:GetX();
	local nyloc = e.self:GetY();
	local xdiff = xloc - nxloc;
	local ydiff = yloc - nyloc;
    if(e.message:findi("hail") and e.other:GetGM()) then -- debug only
        e.self:Say("Your x is ".. xdiff .." and your y is " .. ydiff .." from me!");
    end
	
	if(e.message:findi("oh brell, thank you for protecting me and seeing me through my trials. forgive me for the things I think and say and do that displease you. Please reveal to me your will and bless me with the patience and obedience to do that which you desire. amen")) then
		count = count + 1;
	end
	
    if (count == 3) then
		e.self:Emote("have been inspired. The sacred pattern of the Coldain rune materializes on the ground before you.");
		eq.create_ground_object(1855,793,-320,-17,0);
		count = 0;
	end
end    
