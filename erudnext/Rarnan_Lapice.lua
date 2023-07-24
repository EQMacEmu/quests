function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to meet you. " .. e.other:GetCleanName() .. ".  To enter the Temple of Divine Light is to invite Quellious into your body and soul.  Tranquility is our way and. as such. we do all we can to uphold it.  Are you a [cleric of Quellious]. or am I mistaken?");
	elseif(e.message:findi("cleric of Quellious")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I have a small task for you then. Go to the city library and ask the librarian for the book 'The Testament of Vanear'. I shall require it for further studies. Do not return empty-handed or you shall know my rage.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You have not done much to upset the Peacekeepers of this temple. but we must ask you to prove yourself to us before we may discuss things such as this.");
		else
			e.self:Say("Leave my sight at once! You are no friend to the Peacekeepers of the Temple of Divine Light.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13991})) then
		e.self:Say("I sent you after that book ages ago! What took you so long? I have already completed my studies. Luckily I found the original manuscript under my bedroll. I forgot I had kept it there. Take this as a token of my apology. Maybe it will aid you in your next book hunt. I know how cunning those books can be.");
		e.other:Faction(e.self,298,50,0); -- Faction: Peace Keepers
		e.other:Faction(e.self,265,12,0); -- Faction: Heretics
		e.other:Faction(e.self,266,-12,0); -- Faction: High Council of Erudin
		e.other:QuestReward(e.self,0,0,20,3,15302,12500); -- Item: Spell: Languid Pace
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- End of FILE Zone:erudnext  ID:98046 -- Rarnan_Lapice
