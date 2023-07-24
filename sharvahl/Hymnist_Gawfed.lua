function event_say(e)
	if((e.message:findi("hail")) and e.other:HasItem( 3659)) then --Buckler of the Jharin Recruit
		e.self:Say("Very well met, young friend. I assume that Gherik has sent you to me for the purpose of training you. Unforunately, I will not be doing any formal training for the several days. I'm taking a bit of a holiday to celebrate my wife's birthday. If you could take this receipt to the [merchant] for me before my wife gets home, I'd appreciate it. I'll place you at the top of my training list as well.");
		e.other:SummonCursorItem(5954); --Gawfed's Receipt
	elseif(e.message:findi("merchant")) then
		e.self:Say("Gah... I'm losing my wits. I didn't tell you which merchant. Well, the fur is the first thing to go, and the mind is a close second. My wife's birthday is usually quite a large event in my household and I've been trying to make this one extra special. I'm lucky I can still find my tail. Take the note to Jihli Mahej. He's an importer who lives near the... gah! I can't remember the address. I'm sure you'll find him though. Good luck!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3659})) then --Buckler of the Jharin Recruit
		e.self:Say("Very well met, young friend. I assume that Gherik has sent you to me for the purpose of training you. Unforunately, I will not be doing any formal training for the several days. I'm taking a bit of a holiday to celebrate my wife's birthday. If you could take this receipt to the [merchant] for me before my wife gets home, I'd appreciate it. I'll place you at the top of my training list as well.");
		e.other:QuestReward(e.self,{items = {3659,5954}}); --Buckler of the Jharin Recruit, Gawfed's Receipt
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5958})) then --Finished Vase Replica
		e.self:Emote("looks at the vase and nods his head in approval.");
		e.self:Emote("says, 'I know that she's going to love this vase. The craftsmenship is amazing!' as he admires the vase. 'I need to properly thank you for retrieving it for me and I think that I know just the thing. If you gather some owlbear feathers I can have my brother apply them to your cloak. He can make a cloak really stand out. It will be a prize fit for any aspiring apprentice to wear. Take this sack and fill it with seven feathers and your recruit's cloak. Then return it to me with your cloak. I'll have it all sent over to my brother together in one bag.");
		e.other:QuestReward(e.self,0,0,0,0,17611); --Large Cloth Sack
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5959})) then --Bag of Feathers
		e.self:Say("It looks like you're all set. I'll have this sent over to my brother at once. Thank you again for fetching the vase for me. I can't wait to give it to the missus. I just know that she's going to love it. I have another task for you. It shouldn't take much time at all. Your cloak won't be done for a while, so you can do this while you wait. Take this piece of parchment to Jangle. He'll give you a bag of lute strings. I'm restringing all of my instruments before the party. Please be quick. Thank you again.");
		e.other:Faction(e.self,1513,10); --Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,5960,1000); --Note for Jangle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5962})) then --Note from Jangle
		e.self:Say("I really must be losing my mind. I could have sworn I specified the quantities. Oh well, I apologize for the confusion. Please take this back to him with my apologies.");
		e.other:QuestReward(e.self,0,0,0,0,5963); --Gawfed's Request
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5965})) then --Bag of Lute Strings
		e.self:Say("My dear friend, " .. e.other:GetCleanName() .. ", you have been a wondrous help! Though we have not had an opportunity to work on the more refined Jharin teachings, you have definitely proven yourself to be an honorable citizen and worthy apprentice. My brother has returned with your cloak. Please take it along with the title of Jharin Apprentice. To further demonstrate my appreciation of your work for me, please take this lute.");
		e.other:Faction(e.self,1513,10); --Guardians of Shar Vahl
		e.other:QuestReward(e.self,{items = {5966,5967},exp = 3000}); --Cloak of the Jharin Apprentice, Lute of the Jharin Apprentice
		e.self:Shout("Everyone, please welcome my student and friend, " .. e.other:GetCleanName() .. ", to the rank of Jharin Apprentice!");
		e.self:Say("Now, please meet with Aljuum Mohim. He will be responsible for your training during my holiday. Please show him the lute that I just gave you. He'll most likely be in a tavern somewhere. I just hope that he is sober. Take care, friend!");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
