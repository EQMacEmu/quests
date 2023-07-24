function event_say(e)
	if(e.other:GetFaction(e.self) < 4) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, " .. e.other:GetCleanName() .. ", I'm the new commander of the Sky Shrine Militia.  This group of shrine residents and newly aligned outlanders are given various tasks to do for the benefit of the shrine.  Are you here to request a task?");
		elseif(e.message:findi("task")) then
			e.self:Say("We have had recent news from one of our scouts in the Western Wastes that there have been storm giants wandering the coastal area.  We have not heard back from this scout in some time.  What we need is a volunteer to go deliver some tools so the scout can accurately communicate what is happening back to us.");
		elseif(e.message:findi("volunteer")) then
			e.self:Say("Very good! Take this to the scout and wait for them to return the report.");
		  e.other:SummonCursorItem(29683); -- Scout Tools
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 29688}, 0)) then
		e.self:Say("Well this artifact will defently need study. Thank you for this report. Perhaps after we have researched this object more we will have more for you to search for.");
		e.other:Faction(e.self,430,20); -- Claws of Veeshan
		e.other:Faction(e.self,436,5); -- Yelinak
		e.other:Faction(e.self,448,-10); -- Kromzek
		e.other:QuestReward(e.self,0,0,0,0,0,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
