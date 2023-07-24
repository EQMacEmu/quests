function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you been sent by the War Baron to [assist]? The explorers from Firiona Vie draw closer.");
	elseif(e.message:findi("assist")) then
		e.self:Say("That is good, I will stay here to halt any advances. Head out near the lake and destroy the trespassers on our land! Bring me four of their knives that they carry for survival. Prove your allegiance to the Legion of Cabilis.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 4x Explorer Survival Knife (8004)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8004, item2 = 8004, item3 = 8004, item4 = 8004},0)) then
		e.self:Say("Great work, the Legion of Cabilis will not soon forget your dedication. The trespassers shall all be dealt with.");
		e.other:Faction(e.self,441,100); -- +Legion of Cabilis
		e.other:Faction(e.self,440,25); -- +Cabilis Residents
		e.other:Faction(e.self,445,25); -- +Scaled Mystics
		e.other:Faction(e.self,442,25); -- +Crusaders of Greenmist
		e.other:Faction(e.self,444,25); -- +Swifttails
		e.other:QuestReward(e.self,0,0,0,0,0,25);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
