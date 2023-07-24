--Hand in For Whiptail Poison Glands
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well hello... How may I help you?");
	elseif(e.message:findi("love potion")) then
		e.self:Say("Love potion? Never been done and not worth the risk to try after what happened to Kanaad. ");
	elseif(e.message:findi("Kanaad")) then
		e.self:Say("Old Kanaad taught me a lot of what I know- he was about the greatest potions expert in the city back then. He started gathering legends and lore about some infamous love potion. Not some silly thing to make the girl of your dreams fall in love mind you- this fabled tonic was intended to be shared only between two who had found true love. If their feelings were strong enough it would... well, that was part of the problem, no one knew what it was supposed to do. Kanaad learned of some crazy human in the mountains that had supposedly figured out the secret to the potion. The results were not what anyone had hoped for.");
	elseif(e.message:findi("result")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Emote("shuffles a bit uncomfortably, considering whether or not he should be telling you this, 'This is not something that I would normally talk about, but Soroush came by and told me that you are on the trail of Behari- if this will help you find him, then I will tell you all that I know... Kanaad had a time getting the ingredients and was only to make just a very little bit. He sat down with his love, alone in a room and intended to share the elixir. Well, that was the last anyone saw of her, and he was manic, out of his mind... The mixture had driven him from his senses and he snapped. It took quite a bit to restrain him and figure out what to do next.'");
		else
			e.self:Say("I am sorry, but I am right in the middle or something.");
		end
	elseif(e.message:findi("next")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Emote("considers you for a moment and, as though reminding himself that you are trustworthy, continues, 'Well what we learned was that not only did the mixture drive the drinker mad, but it was incredibly addictive as well- a horrible combination. All that we could do was give him a controlled intake of the potion for his addiction and try to treat his dementia. With his returning sanity came the realization of what he had done to his love. It was the most harrowing thing I have ever seen someone go through in all of my life... He is better now, but has never quite been the same and rarely speaks to strangers. Give him this and you should at least get a chance to explain.'");
			e.other:SummonCursorItem(5990); -- Item: Kanaad's Supplies
		else
			e.self:Say("I am sorry, but I am right in the middle or something.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	local gland = item_lib.count_handed_item(e.self, e.trade, {30665});

	if(gland > 0) then
		repeat
			e.self:Say("A blessing indeed! You have done well to bring this to me. With these glands I will be able to save many lives. Thank you friend. Shar Vahl And its people are in your debt. Please, accept these gifts to assist you in your endeavors. It Is the least I can do to return the favor!");
			e.other:Faction(e.self,1513,1); -- Faction: Guardians of Shar Vahl
			e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(31584,31589,31586,31590,31593,31594,31595,31588,31585,31592),250);
			gland = gland - 1;
		until gland == 0
	end		
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30602, item2 = 30964})) then
		e.self:Say("Well done " .. e.other:GetCleanName() .. ", I hope it isnt too late.'' Ragnar begins to chant over the carapace and the claw, holding each in opposite hands. A soft light travels from the claw to the carapace as the claw turns to dust. Ragnar opens his eyes and begins to speak, ''It has worked, but all we have done is buy ourselves more time. While you were away, I have been speaking to Master Barkhem. He has a shield frame that can support these carapaces. You will need to craft such a shield by including this carapace and into the frame along with enough to fill each slot. You are doing quite well young Astrall, Siver has grown a little stronger. You can make use of her innate dexterity by weaving this spell.'");
		e.self:Emote("hands " .. e.other:GetCleanName() .. " a scroll before he continues to speak. 'When you have completed the construction of the shield, return it to me and I will strengthen the anchor.'");
		e.other:Faction(e.self,1513,1); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,{items = {15040,30977}});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30965})) then
		e.self:Say("Nicely done " .. e.other:GetCleanName() .. ". This anchor should be sufficient to keep Siver bound to this realm for a while. She is strong enough to blind your enemies with a bright flash of light now, all you have to do is call on her spirit. I still cannot make complete sense of her thoughts. I think she is trying to tell me of another whisperling entrapped within the crater. Keep an eye open for the whisperling Scorpialis.");
		e.self:Say("In the meantime, you can seek out a shield made of Xakra. Xakra made of the ethereal fabric of the spirit realm. I know the Shak Dratha within the thicket are weavers of this rare form of shadow silk. Such a shield can help us strengthen the anchor, making it easier for Siver to aid you. It will also improve her health greatly. She has been through a lot and is in rather poor condition as it stands now.");
		e.other:Faction(e.self,1513,2); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,{items = {15201,30966},exp = 1000});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 30962}, 0)) then
		e.self:Say("Eh? What have we here?'' Ragnar examines the frosted claw carefully. He closes his eyes and begins to chant while holding the claw cupped between his hands. As he opens his eyes he nods at you and begins to speak. ''You have done well to bring her here Astrall. This is a whisperling, her name is Siver. She is very young, so it is hard for me to understand her. From what I gather, she has an important task to fulfill, but I am still unsure what that task may be. Please take her with you for now, I think that is her wish. Perhaps Grawleh will be able to assist us further, and maybe even find a more suitable anchor for her. I think it would be wise to show her to him.");
		e.other:QuestReward(e.self,0,0,0,0,30963,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
