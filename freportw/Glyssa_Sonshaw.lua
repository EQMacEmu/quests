-- no response on hail from live

function event_trade(e)
	local item_lib = require("items");
	local text = "I require the parchment from Leraena as well as the Odd Cold Iron Necklace.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1772,item2 = 14585},1,text)) then -- sealed parchment (1st), Odd Cold Iron Necklace
		e.self:Say("Ah..yes, I have seen this symbol before. There is a kobold that lives among the gnomes of Ak'anon. He may be reluctant to speak with you but you have no need to fear him. He is a follower of Brell Serilis and a valuable source of information on kobold society and culture. I will construct a message for him. Deliver the message and necklace and perhaps he can enlighten you to its meaning.");
		e.other:Faction(e.self,220,10); -- Faction: Arcane Scientists
		e.other:Faction(e.self,281,2); -- Faction: Knights of Truth
		e.other:Faction(e.self,296,-1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,330,-1); -- Faction: The Freeport Militia
		e.other:QuestReward(e.self,{items = {14585,1779},exp = 1000}); -- Odd Cold Iron Necklace, sealed parchment (2nd)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Glyssa_Sonshaw
