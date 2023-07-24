function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18727})) then -- Tattered Note
		e.self:Say("Greetings. I am Ghanlin Skyphire, Master Wizard of the Crimson Hands. All of us here have devoted our lives to the studies of the arcane and mystical. Let's get you started. Here's your training robe.  Now, go find Raskena. She'll help train you and give you your first lesson.");
		e.other:Faction(e.self,233,100,0);   --Crimson Hands
		e.other:Faction(e.self,266,10,0);  --High Council of Erudin
		e.other:Faction(e.self,265,-15,0); --Heretics
		e.other:Faction(e.self,267,15,0);  --High Guard of Erudin		
		e.other:QuestReward(e.self,0,0,0,0,13550,20); --Old Used Robe*
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24040 -- Ghanlin_Skyphire
