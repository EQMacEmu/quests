function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I, the keeper of the [Bracers of Ro],  welcome you.  Come and rest within our camp.  You have nothing to fear while such righteous might is gathered.");
	elseif(e.message:findi("bracers of ro")) then
		if(e.other:GetFactionValue(e.self) >= 50) then
			e.self:Say("When you can swim the waters of Rathe and return two goblin nets from the elusive goblin net masters. then you will be rewarded the bracer mold.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You and I are not one yet.   Go to Erudin and serve the Deepwater Knights.  When you can ask Lord Weligon if you are an [honored member] and he answers yes, then this is when we are one with Prexus.");		
		else
			e.self:Say("We, the Deepwater Knights, know of your vile ways. You had best leave while you can.");
		end
	end
end
	
function event_trade(e)
	local item_lib = require("items");
	local text = "Two Deepwater goblin nets are required.";	

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12311, item2 = 12311},1,text)) then
		e.self:Say("You have done well. Take the mold for the bracer.  Go forth to speak with Thomas of [Lord Searfire].  Then all components shall be known.");
		e.other:Faction(e.self,242,20); -- Faction: Deepwater Knights
		e.other:Faction(e.self,266,3); -- Faction: High Council of Erudin	
		e.other:Faction(e.self,265,-3); -- Faction: Heretics
		e.other:QuestReward(e.self,{itemid = 12301}); -- Item: Mold of Ro Bracer
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
