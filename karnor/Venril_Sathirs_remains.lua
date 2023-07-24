-- pulsing green stone - ranger/druid epic
function event_spawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(102010)) then -- if VS is up. VSR will depop.
		eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The living fire. I seek the fires of life. Bring them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10295})) then
		e.self:Emote("grasps the glowing sphere of fireflies from your hands. Tendrils of mystical energy begin to flow forth from the swarm of glowing insects like tiny fingers. The glowing tendrils begin to reach into the ribcage of the rotting remains of Venril Sathir, coalescing into the form of an iksar ghost.");
		eq.spawn2(102019,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
