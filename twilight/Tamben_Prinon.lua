function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks over you examining you from head to toe. 'Ye have the look of an adventurer. I have a tale to tell if you would like to hear it.");
	elseif(e.message:findi("tale")) then
		e.self:Say("Years ago I and Jilan were traveling around the far reaches of this land. One day we came upon an old vah shir who was injured in the mountains. He implored us to help him. Do you wish me to continue?");
	elseif(e.message:findi("continue")) then
		e.self:Say("As I was saying this old vah shir required assistance.  We bound his wounds and he asked us to take his armor and give it to a Beastlord worthy of wearing it.  Are you a worthy beastlord?");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap you must prove your worth. Go gather up a sun jewel, a mark of feral spirits, an embedded copper figurine, and a frosted stone.");
	elseif(e.message:findi("tunic")) then
		e.self:Say("For the tunic you must prove your worth. Go gather up a moon jewel, a mark of animal spirits, a silver gilded bracelet, and an embedded mithril figurine.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves you must prove your worth. Go gather a star jewel, a mark of wild spirits, an embedded clay figurine, and a furrowed carving.");
	elseif(e.message:findi("leggings")) then
		e.self:Say("For the leggings you must prove your worth. Go gather a cloud jewel, a mark of natural spirits, an embedded stone figurine, and a blue moonstone.");
	elseif(e.message:findi("mantle")) then
		e.self:Say("For the mantle you must prove your worth. Go gather a sky jewel, a mark of wilderness, and an embedded platinum figurine.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you must prove your worth. Go gather a meteor jewel, a mark of animal training, and an embedded brass figurine.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots you must prove your worth. Go gather an astral jewel, a mark of beast mastery, and an embedded gold figurine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5921,item3 = 5927,item4 =  5928},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3985,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5929,item3 = 5922,item4 =  5923},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3986,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5925,item3 = 5924,item4 =  5926},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3987,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5930,item3 = 5931,item4 = 5932},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3988,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5933,item3 = 5934},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3989,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493,item2 = 5935,item3 = 5936},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3990,25000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5937,item3 = 5938},1,text)) then
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3991,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1502,5); -- Katta Castellum Citizens
	e.other:Faction(e.self,1503,1); -- Validus Custodus
	e.other:Faction(e.self,1504,1); -- Magus Conlegium
	e.other:Faction(e.self,1499,-2); -- Citizens of Seru
	e.other:Faction(e.self,1483,-1); -- Seru
	e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
end
