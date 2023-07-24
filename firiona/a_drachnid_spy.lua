--The drachnid spy is for the fifth quest in the Greenmist line. Once killed, he'll drop the Charasis Tome that we need.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks upon you with evil eyes and you hear a horrid chatter. Hairs rise from the spider's thorax. 'Greetings, creature. What a fine meal you would make!'");
		eq.attack(e.other:GetName());
		e.self:Say("You shall not take the tome from me!! I shall snack upon your blood-drained corpse.");
	end
end

function event_death_complete(e)
	eq.signal(84319,1); -- NPC: Hero_Goxnok
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
