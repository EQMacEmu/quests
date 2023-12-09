function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks at you with one good eye.  His left eye is covered with pus.  'I seek a [great sorcerer].");
	elseif(e.message:findi("great sorcerer")) then
		if(e.other:GetFactionValue(e.self) >= 300) then
			e.self:Emote("hands you a flaxen hilt or handle of sorts. It has four round slots on one end. 'Insert within what used to be. Return it to me when all is complete. With it shall you gain your Sorcerer's Skullcap. Go and prove your knowledge.");
			e.other:SummonCursorItem(17195); -- Item: A Flaxen Hilt -- bugged quest on AK -- 17195 is fixed version to make quest completeable -- 12887 is the broken version
		else
			e.self:Say("Greatness comes from many deeds.  You have more work to do.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "All is not complete. A cap and the rest, which was asked for, is required.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12886, item2 = 4266},1,text)) then
		e.self:Emote("takes the flail and vanishes with a brilliant flash!! Within your hands appears a skullcap. You hear a voice echo through the cave. Well done. You are a formidable necromancer. We thank you.");
		e.other:QuestReward(e.self,0,0,0,0,4267,10000); -- Item: Necromancer Skullcap
		e.other:Faction(e.self,443,15); --Brood of Kotiz
		e.other:Faction(e.self,441,5); --Legion of Cabilis -- need exact faction hit for Legion
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end
