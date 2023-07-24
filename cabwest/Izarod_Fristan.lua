function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail there. " .. e.other:GetCleanName() .. ". So you are ready to learn more about our ways? Do you wish to try and expand your knowledge of our arcane arts? Then venture far from here to the darkest depths of our once great empire and seek the minions that inhabit the ruins. The arcane powers will come in the form of [scrolls].");
	elseif(e.message:findi("what scrolls?")) then
		e.self:Say("Besides all the ones you will find. There are some that are only in my possession. To show that you have been successful on your journey, return one of splurt, defoliation, convergence, or thrall of bones. You then will be rewarded with one of my scrolls.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	local count = item_lib.count_handed_item(e.self, e.trade, {19423, 19296, 19294, 19299});
	if(count > 0) then
		repeat
			e.self:Say("Here is the scroll that I promised. We have both gained much today. I hope to do business with you again soon. Farewell.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19297,19421,19408,19409),1000); -- Item(s): Spell: Minion of Shadows (19297), Spell: Sacrifice (19421), Spell: Scent of Terris (19408), Spell: Shadowbond (19409)
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
