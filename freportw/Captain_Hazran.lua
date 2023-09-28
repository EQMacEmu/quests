function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! Welcome to the Freeport Militia House. It is time for you to serve the state. You will assist us in our war with [Clan Deathfist] before you are truly accepted into our city. We urge you to be all we command you to be.");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("Clan Deathfist are the orcs of the Commonlands. They are a nuisance and Sir Lucan has ordered their extermination. You will go forth into the Commonlands and kill these orcs. Clan Deathfist members are known to wear a clan belt. Bring a belt to me as proof of each death and you shall receive your wages and prove your allegiance to Freeport and all that is good.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	local count = item_lib.count_handed_item(e.self, e.trade, {13916}, 1); -- Deathfist Slashed Belt x 1
	if(count > 0) then
		repeat
			e.self:Say("Good work, warrior. You are good militia material. Beware though, there are some who dare to call us foe. You have performed so well!");
			e.other:Faction(e.self,330,5); -- Freeport Militia
			e.other:Faction(e.self,336,1); -- Coalition of Tradefolks Underground
			e.other:Faction(e.self,281,-1); -- Knights of Truth
			e.other:Faction(e.self,362,-1); -- Priest of Marr
			e.other:QuestReward(e.self,0,0,math.random(10),0,0,9350); -- confirmed exp data
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9109 -- Captain_Hazran
