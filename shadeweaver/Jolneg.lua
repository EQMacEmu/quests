function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, young one, has the Captain sent you to speak with me about the [Deathmaw Club]?");
	elseif(e.message:findi("deathmaw club")) then
		e.self:Say("Ahh, well, since you do not know of the Deathmaw club, then I will tell you about it. Captain Alim has taught me how to make this club. In order to make one, I will require three deathmaw claws, and a wooden practice flail. Return to me these components, and I will craft a Deathmaw Club for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7808, item2 = 7808, item3 = 7808, item4 = 30579})) then
		e.self:Emote("takes the flail and starts placing the claws into it forming a formidable looking weapon. 'This seems a good weapon indeed. Here, you can take it for helping to test my theory of weapon crafting. Safe travels to you friend.'");
		e.other:QuestReward(e.self,0,0,0,0,7815);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
