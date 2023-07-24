function event_spawn(e)
	eq.set_timer("proxsay",2000);
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 35, xloc + 35, yloc - 35, yloc + 35);
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
	
	if(e.message:findi("lumanes")) then
		e.self:Emote("speaks softly, 'Lumanes " .. e.other:GetName() .. ", Our cousin, a spirit of frost, is trapped. We may not intervene. Only one of flesh may aid us. Are you one [able to help]? '");
	elseif(e.message:findi("able to help")) then
		e.self:Say("speaks softly, 'Then we thank you. We will lure it here. But beware, it uses our cousins strength to protect itself.'");
		eq.unique_spawn(155005,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
end    
