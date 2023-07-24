function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day friend! I'm glad you've stopped by. I am in need of some assistance. Please direct anyone seeking work to me.");
	elseif(e.message:findi("seek work")) then
		e.self:Say("Excellent! I practice the art of alchemy and I am currently working on some new recipes. I require a few special ingredients. Fortunately they grow in the crater just outside our city walls. Bring me a  redcapped mushroom. a pinch of scarlet moss and a bluecapped mushroom. I'll be most grateful.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3446, item2 = 3447, item3 = 3448})) then
		e.self:Say("Wonderful! I have little to offer you for your trouble aside from my gratitude. Here is a pinch of acrylia dust. I know it's not much. If you have no need for it go to Mignah, he can always use all kinds of acrylia.");
		e.other:QuestReward(e.self,{itemid = 3449}); -- Item: Pinch of Acrylia Dust
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
