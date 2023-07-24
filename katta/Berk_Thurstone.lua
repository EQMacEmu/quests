function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("startles and gazes up at you. 'Careful, careful... I am nearly out of [pyrrhotite].'");
	elseif(e.message:findi("pyrrhotite")) then
		e.self:Say("Pyrrhotite is the name of this ore I have my hands on here. Ye see, I may still look an able-bodied dwarf, full o' spit and fire, but the time is coming where'n I may lose a step or two and they will take me off post- I want to be prepared for that time. I have been doing some [experiments] on this piece of rock, trying to have something to bring to Toktonn and maybe secure a job in ore studies for meself after retirin' from the Validus Custodus.");
	elseif(e.message:findi("experiments")) then
		e.self:Say("Well, there is a powerful magnetic quality to this particular rock, but it is very inconsistent. If I can figure out what makes it tick, it'd sure be a boon to some o' that crazy engineering the gnomes're always doing. This sample is running out though, and it ain't easy to come by what with the durned grimlings hogging the mines, I'd sure appreciate it if someone were to bring me some more. Careful though, it's deceptively heavy.");
	elseif(e.message:findi("grimling")) then
		e.self:Say("Bah!  Them uglies ain't much fer sharin' the mines outside the city in Tenebrous, I tell ye that much.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29843}, 0)) then -- Handin: 1x Pyrrhotite Sample (29843)
		e.self:Say("Aww, noice, this'll do just right. Thanks millions, " .. e.other:GetCleanName() .. ". Yer ok by me, ye are.");
		-- live faction verified
		e.other:Faction(e.self,1503,4);  -- +Validus Custodus 
		e.other:Faction(e.self,1502,1);  -- +Katta Castellum Citizens
		e.other:Faction(e.self,1504,1);  -- +Magus Conlegium
		e.other:Faction(e.self,1505,-1); -- -Nathyn Illuminious
		e.other:Faction(e.self,1506,-1);  -- -Coterie of the Eternal Night
		e.other:Faction(e.self,1483,-1); -- -Seru
		e.other:Faction(e.self,1484,-2); -- -Hand of Seru
		e.other:Faction(e.self,1485,-1);  -- -Eye of Seru
		e.other:Faction(e.self,1541,-1); -- -Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

