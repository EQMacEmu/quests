function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmmm, I didn't know refuse could speak. Are you here to annoy me or are you planning on making yourself useful, if the latter is even possible?");
	elseif(e.message:findi("make myself useful")) then
		e.self:Say("A feeble creature like yourself is near worthless. If you must insist on serving the mighty Kromzek then go to the caverns of the geonids and bring me four blocks of living granite so that I may perform some tests on its value as a resource in the expansion of Kael.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24872,item2 = 24872,item3 = 24872,item4 = 24872}, 0)) then
		e.self:Say("So you proved to be of value after all, take this for your work. Don't let it go to your head.");
		e.other:Faction(e.self,448,2); -- kromzek
		e.other:Faction(e.self,419,1); -- kromrif
		e.other:Faction(e.self,429,1); -- king tormax
		e.other:Faction(e.self,430,-1); -- CoV
		e.other:QuestReward(e.self,0,0,0,0,24877,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
