function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("heaves a great sigh.");
	elseif(e.message:findi("wrong")) then
		e.self:Say("Boz like to grow perty flowers in her [garden]. But [garden] no more.");
	elseif(e.message:findi("garden")) then
		e.self:Say("Boz not know what happen. Only see der biggins footprints in it. Me perty sure my puppy not smash garden. He has tiny feets. Right, puppy?");
		eq.signal(49022,1); -- NPC: Bozlum_Blossom_pet
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10628})) then
		e.self:Emote("writes something down on a piece of parchment. 'You go tell dat Brokk dat he owe me big for smushing garden. Make him read dis.'");
		e.other:QuestReward(e.self,0,0,0,0,10629);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10630})) then
		e.self:Say("Oh, dat silly Brokk. He sent me too many of these perty flowers. Me not know where put them all. Here, you take some cause you help Bozlum. Me like you. Flowers make you smell perty, too.");
		e.other:QuestReward(e.self,0,0,0,0,10609,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
