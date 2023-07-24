function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20877})) then
		e.self:Say("Wow, this is certainly something I have not seen in a long time. It was said that this species of snake had been wiped out due to the poachers and griffins. It was very noble of you to help in saving this species. I will see that these are raised properly. Please wear this icon with pride so other rangers will know of the good deed you have done.");
		e.other:Faction(e.self,269,10); -- kithicor resident
		e.other:Faction(e.self,302,1); -- protectors of pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkemtp druid
		e.other:QuestReward(e.self,0,0,0,0,20878,100000); -- symbol of achievement
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
