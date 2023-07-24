function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("ARGH! Dangit, ya scared me! Tread cautiously, fri. This here place ain't as frily as it seems. There's a beast lurkin' in this here puddle.");
	elseif(e.message:findi("beast")) then
		e.self:Say("Aye lad. I seen it come from the ocean. It was fightin' a group of adventurers, not unlike yerself. The battle raged long and hard, and at the  the beast lay still among countless of the adventurers bodies. They left assuming it had been slain by their hands. But, once they left, I seen it come crawlin in this here place. They called it by the name Fayde, er, Fayred. Hrmm. What was it they called it? I can't remember.");
	elseif(e.message:findi("faydedar")) then
		e.self:Say("Ya! That's what they called it! A great water dragon as the legs say. Only way to find him now is to lure him out from hiding. Not that I would suggest doin such a thing. The dern thing's broken, bleedin, and cornered. That's a mighty deadly position to put a critter in if ye ask me. Course if yer wantin' to try it, there might be a way. Ya willin to risk it?");
	elseif(e.message:findi("risk it")) then
		e.self:Say("Well jus' before that there beast ended up in combat, I watched him from the shores. Only reason he got into such a mess was 'cause of his belly. He swam right into those adventurers chasin' down a wandering froglok. You wanna catch a fish, use the right bait. If only we had us some frogloks essence, then mebbe he'd come out agin. But I must warn ye laddies that the bloke over by the inn already warned me to leave all the natural critters in this here oasis in peace. He might get right mad if he sees a battle brewin' here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20696}) and e.other:GetClass() == 6) then
		e.self:Say("What's this? Egads! It's perfect.  Now all we gotta do is hope he bites.' Dolgin takes a little of the essence and smears it on a piece of bread. He places the bait into the water and watches intently.");
		e.other:QuestReward(e.self,0,0,0,0,20696);
		eq.spawn2(96073,0,0,-2178,-11745,-0.63,63):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
