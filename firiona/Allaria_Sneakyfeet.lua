function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well hello, " .. e.other:GetCleanName() .. ". What brings you to me? Are you one of the sneaky folk in search of the plans for the Whistler?");
	elseif(e.message:findi("plans for the whistler")) then
		e.self:Say("I must tell you first off, there was much bloodshed in getting these plans. Three of Rivervale's bravest warrior were killed by Rozzut's brother, Neezee in order to keep the plans out of the hands of the Goblins. Allaria sighs deeply. There was much sorrow over this. The only positive that seemed to come out of the whole ordeal, was the finding of the plans to make the weapon that Rozzut, Chief Zambooz's main assassin uses so effectively. I have now made it my calling to give a copy of these plans to those that are worthy of such knowledge. Do you believe yourself to be worthy of such an honor?");
	elseif(e.message:findi("i am worthy")) then
		e.self:Say("Very well then. Here are the plans for the weapon that is said to cut holes into the enemy without much effort. Legend has it that if the wind is blowing, your enemy will be whistling after the fight. But they won't be whistling voluntarily.' Allaria smiles. 'Good luck to you friend.");
		e.other:SummonCursorItem(18347); -- Item: Rozzuts plans
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
