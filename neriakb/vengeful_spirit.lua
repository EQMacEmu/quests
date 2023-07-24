-- vengeful spirit - The Visiting Priestess

function event_spawn(e)
	-- Allow the quest to reset
	eq.set_timer("despawn", 6000000);
end

function event_timer(e)
	eq.stop_timer("despawn");
	eq.depop();
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18401})) then -- 18401 - Scroll of Flayed Goblin Skin
		eq.stop_timer("despawn");
		e.self:Emote("flares brightly as you place the scroll into the blue flames of the forge. The scroll quickly catches fire and burns out in a flash of white fire. In it's place is left a hammer. As you snatch the hammer from the flames you hear the spirit begin to cackle wildly and fade away.");
		e.other:QuestReward(e.self,0,0,0,0,6403,132775);  -- Blued Two-Handed Hammer
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- EOF zone: neriakb ID: 41106 NPC: vengeful_spirit
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------