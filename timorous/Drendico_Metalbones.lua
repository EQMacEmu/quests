-- Necromancer Epic NPC -- Drendico_Metalbones
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The hills ears keep spinning the wonders of wells. Twisting twisting fly in water scar hot horses. Teach me! Bring floating water islands of doom!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20648})) then
		e.self:Say("Seek, search, turn, twist! Kazen hopes to death master truly! Read out, read in between! Talk to the pretty clouds.' Drendico turns his back to you and throws a book over his shoulder. 'Bring back book! Bring back reagents three!!' He shouts as he mumbles some more gibberish.");
		e.other:QuestReward(e.self,0,0,0,0,18086,1000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1278, item2 = 20656, item3 = 20655, item4 = 18086})) then
		e.self:Emote("turns to you in amazement. 'You actually did it! These are the correct components! Kazen will be most pleased. I searched the planes for almost a year and could not find all the correct components.' Drendico fiddles with the components, puts them into a box and hands it to you. 'You must have access to an army, " .. e.other:GetCleanName() .. ". Return the components to Kazen quickly!");
		e.other:QuestReward(e.self,0,0,0,0,20653);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
