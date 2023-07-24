function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetCleanName() .. "! It is a pleasure to have such seasoned adventurers visit our noble city. I am Magistrate Celris Shadetracker of the Loyalist Combine Empire. I was of the original members of the Combine Empire to arrive here on Luclin and have since become quite familiar with its many lands and their inhabitants. I used to travel extensively but in my old age I have found comfort in remaining here at the Tsaph Katta Hall telling younger explorers of my many journeys and teaching them of the [dangers] that abound.");
	elseif(e.message:findi("dangers")) then
		e.self:Say("There are dangers everywhere for one does not know what to expect or is not careful and attentive while traveling the lands of Luclin. Among the largest of dangers in this region of Luclin are the vampyres of the Coterie of the Eternal Night. The coterie has been particularly active lately and we have already lost scouts attempting to track their [activities].");
	elseif(e.message:findi("activities")) then
		e.self:Say("One of the vampyre volatilis, the winged leaders of the Coterie of the Eternal Night, has been followed flying from their Aerie in the Tenebrous Mountains to a small vampyre settlement in the Maidens Eye far to the south. The volatilis appears to be picking up shipments of wineskins from a vampyre at the settlement and bringing them to their Aerie. I doubt that the skins actually contain wine or any other such relatively harmless liquid. If you could return one of these skins to me I will gladly honor you as I would one of my own scouts.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7776}, 0)) then -- Skin of Blood Like Substance
		e.self:Say("You have done well " .. e.other:GetCleanName() .. "! I will have this substance examined by our experts at the Magus Conlegium. Perhaps the results will give us some clue as to what teh Coterie of the Eternal Night is collecting it for.");
		e.other:Faction(e.self,1561, 8);   -- Concillium Universus
		e.other:Faction(e.self,1483, -1); -- Seru
		e.other:Faction(e.self,1484, -4); -- Hand of Seru
		e.other:QuestReward(e.self,0,0,0,0,7777,10000); -- Validus Scout Cloak
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
