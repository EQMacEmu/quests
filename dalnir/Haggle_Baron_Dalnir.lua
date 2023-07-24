--Haggle Baron Dalnir is spawned from the Tormented Tradesman, and sticks around long enough to give us the final piece of the Greenmist puzzle that we need.
--After we get the design from him, we can forge the Greenmist Khukri in the Always Works forge in the same room.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have little time to speak. I can feel this facade weakening already. A Scaled Mystic came to me during my time of torment. He spoke to me. He said that a new time was hiding behind the darkness of the horizon. You seek Master Rile's Khukri. I can diagram it for you... Arrrgh! I feel the pull of torment upon me! Return to me with a piece of parchment, a quill, and Rile's Shattered Blade. Use your mirror again to bring me back and I will try to remember the design. Please be quick!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13051, item2 = 13063, item3 = 3888})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		e.self:Emote("stares at the broken blade for some time. After a few moments of studying, the apparition begins to draw and scribble on the parchment. He works with amazing speed as the memories from his past flood from his quill. The diagrams and runes that etch the surface of the parchment begin to glow. The legendary Haggle Baron rolls the parchment and hands it to you. Smiling, he bows deeply and quickly fades away.");
		e.other:QuestReward(e.self,0,0,0,0,3890);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
