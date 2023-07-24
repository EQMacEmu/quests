function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh? What? Oh, you speak so fast, it took me a moment. I have become used to the slow and stately conversation the Earth holds, where a thought can span aeons. I am the Master of Earth, you know. Though I'm usually too humble to say this, that makes me the most powerful mortal in Norrath, as everyone knows that Earth is the only REAL Element, all else must give way before its power. Water is absorbed by it, Air is ignored by it, and Fire is contained in it. But you know all these things, I am sure. Are you interested in obtaining the Element of Earth? I know Magi'kot was, but we know what happened to him, don't we?");
	end
	if(e.message:findi("element of earth")) then
		e.self:Say("Combining the following items can bring the Element of Earth together. Obtain the Staff of Elemental Mastery: Earth, held by the minions of the Prince of Hate, The Dirt of Underfoot found on Slix something or the other, and of course, I shall need the Broom of Trilon and the Shovel of Ponz. Bring all these things, and I shall show you what a true Master of Earth can do, and gift you with the Element of Earth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 11567, item2 = 28042, item3 = 6360, item4 = 6361})) then
		e.self:Say("Take this Element and keep it with you. I wish you the best in your journey, but I must ask you to leave me now. This frantic pace you set makes me nervous.");
		e.other:QuestReward(e.self,0,0,0,0,28032,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
