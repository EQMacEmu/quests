function event_spawn(e)
	eq.set_timer("proxsay",2000);
end

function event_timer(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45);
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
	
	if(e.message:findi("worthy of vah kerrath")) then
		e.self:Say("The squishy mortal has proven itself by releasing Elysian spirits. We greet the Elysian spirits to our realm and rejoice in their freedom. Go on fleshling, ask the bone man to tell you of Vex Thal.");
	end
end    
