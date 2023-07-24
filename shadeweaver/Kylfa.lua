function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, young one, what is it that you [seek]?");
	elseif(e.message:findi("seek")) then
		e.self:Say("Ahh, so you seek the Shredder Claw Club, aye? Indeed, I am the apprentice to Captain Alim who was trained to make that item. I will craft one for you if you wish to gather the [components].");
	elseif(e.message:findi("components")) then
		e.self:Say("Return to me with three Shredder Claws, and a wooden practice flail, and I will attach the claws to the flail and create a Shredder Claw Club for you to use out here in the Thicket.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7809, item2 = 7809, item3 = 7809, item4 = 30579})) then
		e.self:Say("takes the flail and starts placing the claws into it forming a formidable looking weapon. 'This seems a good weapon indeed. Here, you can take it for helping to test my theory of weapon crafting. Safe travels to you friend.'");
		e.other:QuestReward(e.self,0,0,0,0,7814);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
