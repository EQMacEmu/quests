function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail to yourself, fool! Leave me be. I have [matters of importance] to ponder.");
		elseif(e.message:findi("matters of importance")) then
			e.self:Say("If you are so greatly interested in my affairs then so be it. I have lost my skeleten servant. He now wanders the yard, taking his pain out on the new apprentices of our guild. I cannot return to my guild without ridding the yard of that menace for my mistake will cost me dearly if it is brought to the attention of my masters. Hrm. Perhaps you could destroy my pet for me and bring me proof of his removal. If you do I may even grace you with a [reward].");
		elseif(e.message:findi("reward")) then
			e.self:Say("Speak not of reward when you have not even finished this simple task! Now leave me be.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 1x Rotting Femur (7107)
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 7107})) then
		e.self:Say("Ah! You found him and obviously removed his presence from the yard. You have my thanks, small as it is for such a menial task. Here. Keep this worthless bit of bone for your labors.");
		e.other:Faction(e.self,265,3);  -- +Heretics
		e.other:Faction(e.self,242,-3);  -- -Deepwater Knights
		e.other:Faction(e.self,254,-3); -- -Gate Callers
		e.other:Faction(e.self,231,-3);  -- -Craftkeepers
		e.other:Faction(e.self,233,-3);  -- -Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,7106,250); --Noclin's Femur (7106)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


--Scripted By: Fatty Beerbelly


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
