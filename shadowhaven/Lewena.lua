function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ". Care to buy me a drink? If you buy me my favorite I will tell you a secret.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 15763}, 0)) then
		e.self:Emote("gazes at you in complete astonishment. 'How. . . Where. . . The recipe for this drink has long been lost. I've known only one person who was able to craft this fabulous drink with any accuracy. It was a dwarf by the name of . . . Let me see here. Baldin. . . Bruldor. . . Bognip. . . Oh dear, my memory is quite bad when it comes to names. I haven't seen him in ages, I hope the poor dwarf is alright.' Lewena fidgets about for a few seconds, then pulls out a worn piece of parchment. 'My dwarven friend gave this to me, though he told me to keep it a secret. As promised, I will live up to my end of the bargain.' she says, as she hands you the brittle piece of parchment.");
		e.other:QuestReward(e.self,0,0,0,0,15766,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
