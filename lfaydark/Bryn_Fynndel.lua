function event_say(e)
	if(e.message:findi("morin sent me")) then
		e.self:Say("Morin Shadowbane, the great ranger, sent you to assist us?  A strong ranger you must be if he has sent you personally.  There is a great evil stalking the land, and it has spread its tendrils into Kithicor Forest.  We believe the [shadowed men] are involved with this, somehow.");
	elseif(e.message:findi("shadowed men")) then
		e.self:Say("The shadowed men have recently begun to appear, with vile purposes unknown to us.  Their leader wanders these woods with a contingent of guards.  Bring us his code book, and we may learn more of their plans.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20636})) then -- Shadowed Code Book
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. "!  According to these codes, it seems the ghoul boss has been alerted to our probes now that his messenger is missing.  We have a scout, Glidara Myllar, who may be in danger.  Give her this note as soon as you can, she is in grave danger!");
		e.other:QuestReward(e.self,0,0,0,0,20635,1500); -- Warning to Glidara
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20639})) then --Orders for Bryn
		e.self:Say("The vile ghoul boss has been defeated!  My new orders state to arm you with our finest weaponry.  Take this, the mighty orc impaler.  Safe journeys, brave adventurer.");
		e.other:QuestReward(e.self,0,0,0,0,7330,15000); -- Orc Impaler
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
