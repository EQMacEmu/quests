function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 6) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 7) then
		e.self:SetRunning(false);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You seem a little out of place here. You should go back to the nice little village you came from. This place will eat you alive. The [Golden Rooster] is no place for you.");
		else
			e.self:Say("Word from the grapevine says to use you as a pincushion. Just consider yourself lucky all I am doing is not speaking to you. Get lost!!");		
		end
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Blackburrow Stout is the finest drink available. It is the nectar of the gods. Well.. nectar of the gnolls at least. I can't wait until they hold another drink special in the Rooster. When I hear that. I am there!");
	elseif(e.message:findi("golden rooster")) then
		e.self:Say("The Golden Rooster only happens to be the finest gambling house in Highpass. It is also the only place in these parts that serves [Blackburrow Stout].");
	end
end