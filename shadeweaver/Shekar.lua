function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I suppose you are here to ask me how to create a Claw Beast Talon Club? Yes, yes, I thought you might be. So many young ones looking for these, my poor claws are sore from all the assembly. Of course, I will make one for you, so long as you return to me with the correct [items].");
	elseif(e.message:findi("items")) then
		e.self:Say("To assemble this club, I require only two things. The first is a wooden practice flail. The second is a talon from the great claw beasts. They are quite rare, and large, and might be a difficult kill.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 7811, item2 = 30579})) then
		e.self:Say("You have killed the Claw Beast!  Well done " .. e.other:GetCleanName() .. ", you have shown a great ability to fight. I have not seen the like since the mightly Yalpeelor and Zunaloo!");
		e.other:QuestReward(e.self,0,0,0,0,7812);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
