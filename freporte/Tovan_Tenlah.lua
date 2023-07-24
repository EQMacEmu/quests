function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I suppose you're one of Nestrals new employees, eh? Well if that's the case I can help get you outfitted with some [gear] necessary for people in this [line of work].");
	elseif(e.message:findi("gear")) then
		e.self:Say("The first thing you need is a suit of sturdy traders clothing. Take this note to Verona Rankin and she'll help you with a suit tailored to your needs. Once you have been outfitted in your traders clothing return to me and I will inform you of your [next task].");
		e.other:SummonCursorItem(19846); -- Note to Verona Rankin
	elseif(e.message:findi("next task")) then
		e.self:Say("Ready to get to work are you? Listen carefully. Outside Freeports South gate you will find one of our employees, Rigg Nostra, who is acting as an intermediary between the Coalition of Tradefolk and some recently acquired business associates. Give him this card so he knows I've sent you and he will give you further instructions. Do not mention any of our names in public. The Freeport Militia would likely impose high taxes on the Coalition if they found out about the goods being exchanged to us by our new associates.");
		e.other:SummonCursorItem(19917); -- Bent Playing Card
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19918})) then
		e.self:Say("Sharpen this dagger and take it with this gem and a rattlesnake skin to Verona Rankin.");
		e.other:Faction(e.self,336,5); -- Coalition of Trade Folk Underground
		e.other:Faction(e.self,229,5); -- Coalition of Trade Folk
		e.other:Faction(e.self,329,1); -- Carson McCabe
		e.other:Faction(e.self,230,1); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,1); -- Freeport Militia
		e.other:QuestReward(e.self,{items = {19919,19920},exp = 100}); -- Item: Dull Coalition Dirk, Faceted Blue Gem
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freporte  ID:10154 -- Tovan_Tenlah
