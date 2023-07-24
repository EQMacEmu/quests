function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. I am one with the [Lost Circle]. You have found me. What is it you desire?");
	elseif(e.message:findi("lost circle")) then
		e.self:Say("The [monks of the Whistling Fist] are called the Lost Circle by others. We are an ancient league of monks. Long forgotten and few yet remain. Within this realm there are only two. [Brother Qwinn] and I. We seek the items stolen from us. I seek the [idol of Zan Fi].");
	elseif(e.message:findi("interested monk")) then
		e.self:Say("Then venture to the lands of evil. The swamps of the trolls and ogres. There, seek out a monk called Raster. He has the idol. You will return here and wait for my reappearance. When we meet again, you shall hand me the idol and a red sash earned from the Ashen Order. Do so and you shall be closer to joining the brotherhood.");
	elseif(e.message:findi("idol of zan fi")) then
		e.self:Say("The idol of Zan Fi is a totem that is sacred to our brotherhood. I cannot share its secrets, but I can offer to you a reward for its return. Are you an [interested monk]?");
	elseif(e.message:findi("brother qwinn")) then
		e.self:Say("Brother Qwinn is searching for one who can return the [Code of the Whistling Fist]. I believe he is in the vicinity of the Plains of Karana.");
	elseif(e.message:findi("code of the whistling fist")) then
		e.self:Say("The tome called the Code of the Whistling Fist has been stolen from [Brother Qwinn]. It contains many secrets pertaining to our brotherhood. Thankfully, it is magically locked and only a Zan Fi master could unlock it. Still, Qwinn must see its safe return.");
	elseif(e.message:findi("return the sash")) then
		e.self:Say("Very well. Give to me that which you have been rewarded or the robe, if you have a tailored one.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "We had an agreement. The proof of a skilled monk, the red sash, and the idol of Zan Fi.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12317, item2 = 10133},1,text)) then --The Idol, Red Sash of Order
		e.self:Say("We thank you for the return of the idol of Zan Fi. Take this rare robe pattern. You shall find it useful should you aid [Brother Qwinn] in his quest. His item, the rare robe pattern, a swatch of shadow silk and a scroll containing Jonathan's Whistling Warsong. Into a sewing kit they will be going. And into the brotherhood will you. I hope you do not wish me to [return the sash].");
		e.other:QuestReward(e.self,0,0,0,0,12315,2000); --Rare Robe Pattern
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12315, item2 = 10133})) then --Rare Robe Pattern
		e.other:QuestReward(e.self,{itemid = 10133}); --Red Sash of Order
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12256, item2 = 10133})) then --Robe of the Lost Circle
		e.other:QuestReward(e.self,{itemid = 10133}); --Red Sash of Order
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
