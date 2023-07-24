-- Fertilizer & rare plants

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. "! I am Governess Tobala Honeyjar of Katta Castellum. Overseeing the maintenance of the [Nocturnal Gardens] is just one of my duties as the governess of agriculture and ecology.");
	elseif(e.message:findi("nocturnal gardens")) then
		e.self:Say("These are the Nocturnal Gardens in which we now stand. It is a collection of flora from various regions of the dark side of Luclin. It is a shame that we are not capable of supplying the nutrients necessary to maintain flora from the light side of Luclin. If you wish to assist in the maintenance of the garden I have some [tasks] you may be helpful in completing.");
	elseif(e.message:findi("tasks")) then
		e.self:Say("I am in need of ingredients to create more [fertilizer] and in need of a competent forager to gather some [rare plants] for me.");
	elseif(e.message:findi("fertilizer")) then
		e.self:Say("How humble of you to assist me with my mundane tasks! Take this bag and fill it with Three piles of Owlbear Dung, Three Piles of Fungus Compost, and Two Piles of Netherbian Nitrate.");
		e.other:QuestReward(e.self,0,0,0,0,17870);
	elseif(e.message:findi("rare plants")) then
		e.self:Say("I am seeking seeds and plants that I may extract the seeds from that are native to the light side of Luclin so that I am prepared should the Illuminarium Industria succeed in constructing a lantern that will provide the plants with the nutrients they need to survive here on the dark side. It would be a tremendous help if you could bring me a Twilight Orchid, Dawnflower Seeds, a Red Sands Cactus, and a Letalis Zenith Vine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31779}, 0)) then
		e.self:Say("Oh! Thank you so much! You have saved much time and trouble! Now if only those tinkerers in the Illuminarium Industria could figure out how to get that artificial light working!");
		e.other:Faction(e.self,1561,2); -- concillium universus
		e.other:Faction(e.self,1486,-1); -- heart of seru
		e.other:Faction(e.self,1483,-1); -- seru
		e.other:QuestReward(e.self,0,0,0,0,12809,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14936,item2 = 14931,item3 = 14952,item4 = 14953}, 0)) then
		e.self:Say("Oh! Thank you so much! You have saved much time and trouble! Now if only those tinkerers in the Illuminarium Industria could figure out how to get that artificial light working!");
		e.other:Faction(e.self,1561,2); -- concillium universus
		e.other:Faction(e.self,1486,-1); -- heart of seru
		e.other:Faction(e.self,1483,-1); -- seru
		e.other:QuestReward(e.self,0,0,0,0,10695,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
