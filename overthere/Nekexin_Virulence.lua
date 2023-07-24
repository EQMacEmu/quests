function event_spawn(e)
	eq.set_timer("1",1800000);
end

function event_timer(e)
	e.self:Emote("chuckles to himself as he notices blades of grass disintegrate beneath his feet. He stares out over the water as if watching for some sign.");
end

function event_say(e)
	if(e.message:findi("corruption")) then
		e.self:Emote("grins wide at you. 'Corruption? I know nothing of corruption.' He goes back to staring out over the water.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20696, item2 = 20686, item3 = 20685, item4 = 20687})) then
		e.self:Emote("stares at the swirling bottle of essence. His eyes open wide as he realizes what it is. As its warm bright waves wash over him his skin dissolves into a green goo that coats the ground. From his remains a floating white ball is retrieved.");
		e.other:QuestReward(e.self,0,0,0,0,20699);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
