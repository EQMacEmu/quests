function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome " .. e.other:GetCleanName() .. "! Have you been sent to speak with me by [Captain Alim]?");
	elseif(e.message:findi("captain alim")) then
		e.self:Say("Excellent, I presume you wish to speak with me about the [Firefall Club]?");
	elseif(e.message:findi("firefall club")) then
		e.self:Say("If you provide me with three firefall claws, and a wooden practice flail, I am able to fashion them together into a Firefall Claw Club, for you to use.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7807, item2 = 7807, item3 = 7807, item4 = 30579})) then
		e.self:Emote("takes the flail and starts placing the claws into it forming a formidable looking weapon. 'This seems a good weapon indeed. Here, you can take it for helping to test my theory of weapon crafting. Safe travels to you friend.'");
		e.other:QuestReward(e.self,0,0,0,0,7813);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
