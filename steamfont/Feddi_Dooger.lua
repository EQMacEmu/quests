function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You should be very careful at night. Not all beasts are easily discernible. Some are closer than you think. I am sort of scared. Are there [Watchmen nearby] or are [we all alone] out here?");	
		else
			e.self:Say("I find your sanity sickening and the madness of Meldrath cannot tolerate you much longer."); 
		end
	elseif(e.message:findi("watchmen nearby")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Oh!  What a relief.  I would hate to be all alone.  Who knows what could happen to us?!  We could end up all bloody!  Well, good evening to you!");	
		else
			e.self:Say("I find your sanity sickening and the madness of Meldrath cannot tolerate you much longer."); 
		end
	elseif(e.message:findi("we.* alone")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Hunhuhuh.  As I said, beasts are always closer than you think.");
			eq.attack(e.other:GetName());			
		else
			e.self:Say("I find your sanity sickening and the madness of Meldrath cannot tolerate you much longer."); 
		end
	end
end


