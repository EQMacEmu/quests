-- EPIC CLERIC -soldungb-
function event_spawn(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(32040)) then -- if Lord Nagafen is up, Zordak will despawn
		eq.depop_with_timer();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you with unblinking eyes. A wide grin crosses Zordak's face and flames flicker in the depths of his eyes, 'Welcome to the new fortress of the Plasmatic Priesthood! It's a shame about Lord Nagafen's untimely death, really it is! Such a powerful and noble creature should not perish at the hands of mortals.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28054})) then -- Shimmering Pearl
		e.self:Emote("laughs maniacally as he crushes the pearl in his hands with inhuman strength. 'The Triumvirate missionaries think their petty magic can affect me!! I will send your heads to Omak as a symbol of what is to come for all of his missionaries!'");
		eq.spawn2(32004,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
