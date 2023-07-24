function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings traveler! You look like you're still breathing and have your blood running through your veins so I suppose you may seek shelter behind the mighty walls of Katta Castellum.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31756}, 0)) then
		e.self:Say("A Vah Shir vampyre!! Isn't that disturbing! How are you supposed to spot its pale skin under all that fur! Come to think of it I've heard that a strange Vah Shir has occasionally been spotted heading towards the villages of the Coterie of the Eternal Night here in the Tenebrous Mountains. This may be the Vah Shir you are seeking. I will be sure to question any arriving travelers if they have spotted him.");
		e.other:Faction(e.self,1503,4);
		e.other:Faction(e.self,1502,1);
		e.other:Faction(e.self,1504,1);
		e.other:Faction(e.self,1505,-1);
		e.other:Faction(e.self,1506,-1);
		e.other:Faction(e.self,1483,-1);
		e.other:Faction(e.self,1484,-2);
		e.other:Faction(e.self,1485,-1);
		e.other:Faction(e.self,1541,-1);
		eq.unique_spawn(172186,0,0,-1414,-1265,-38,0);
		e.other:QuestReward(e.self,0,0,0,0,0,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

