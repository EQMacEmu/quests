function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! I suggest you stay within the walls of Cabilis. This is no place for you. The Field of Bone is far too close.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("Oh, no! My good times have come to an end. Hand me the note and I shall sign it.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18249})) then --Legion Order (9 signed)
		e.self:Say("Ha ha! Look at all the names. Ozlot and Frogzin. What lushes. Here you are. I can't imagine there being any others to sign. This is the entire Cabilis brew brigade. Alas... Disbanded forever.");
		-- confirmed faction hits
		e.other:Faction(e.self,441,2); --Legion of Cabilis
		e.other:Faction(e.self,440,1); --Cabilis Residents
		e.other:Faction(e.self,445,1); --Scaled Mystics
		e.other:Faction(e.self,442,1); --Crusaders of Greenmist
		e.other:Faction(e.self,444,1); --Swift Tails
		e.other:QuestReward(e.self,0,0,0,0,18250,200); --Legion Order (all signed)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
