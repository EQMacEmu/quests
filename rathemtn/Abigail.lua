function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings!  I am the holder of the secret of the [Breastplate of Ro].  You may rest here.  You are quite safe within this camp of paladins.");	
	elseif(e.message:findi("breastplate of ro")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- requires mid indifferent
			e.self:Say("The Breastplate of Ro mold will be awarded to you.  First, you will perform a test of strength.  Go to Faydwer.  There you shall seek out and destroy the Teir'Dal who carry the dark cauldrons!!  They have been venturing into our lands and capturing many Koada'Dal and Fier'Dal for cooking purposes!  Bring to me two of their dark cauldrons.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your loyalty to my temple.  Go to Felwithe and seek out the Clerics of Tunare.  Prove to them your faith.  Then ask the leader of this church if you are a [honored member].");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I instructed you to return with no less than two dark pots.";

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12309, item2 = 12309},1,text)) then -- A Dark Cauldron
		e.self:Say("You have earned the mold.  You will now need go and speak with Thomas about [Lord Searfire].");
		e.other:Faction(e.self,226,20);  -- Clerics of Tunare
		e.other:Faction(e.self,279,20); -- King Tearis Thex
		e.other:Faction(e.self,5002,15); -- Anti-Mage -- this faction amount is a guess, the other 2 verified
		e.other:QuestReward(e.self,0,0,0,0,12299); -- Mold of Ro Breastplate
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:rathemtn  ID:50113 -- Abigail
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
