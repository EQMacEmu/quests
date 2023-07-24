function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Katta Castellum, brave traveler! It is not safe to dally for long in these mountains, as there are many unsavory creatures living amongst these shadowy peaks... some of which may find the blood in your veins a savory treat!");
	end
end
