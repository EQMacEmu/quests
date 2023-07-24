function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, Borik Darkanvil, at your service. I was once a planar traveler like you. Those days are behind me, now I am content to earn my keep as a blacksmith, and to experiment with some of the [special recipes] that I have picked up in these outer planes.");
	elseif(e.message:findi("special recipes")) then
		e.self:Say("Well a little bit of this and a little bit of that. If there is anything you need assistance in making come see me. I may be able to help.");
	elseif(e.message:findi("box of souls")) then
		e.self:Emote("eyes grow narrow. 'So looking to capture some souls are you? It's none of my business I suppose so don't answer. I'm pretty sure that I don't want to know. I paid heavily for the formula for the Box of Souls, but its not a price I would pass on to anyone else. There isn't much to it, but it does take the hands of a skilled smith and the magic of Tanaan's forges to event attempt it. First you will need a block of [Perilium].");
	elseif(e.message:findi("Perilium")) then
		e.self:Say("Perilium was once used to make clockwork machines, there are now stronger metals so it has become harder and harder to find Perilium, much less a block that is large enough to be of any use. Then you will need to find the brain of a crystal spider, this is where the actual soul will be held. Of course the box will need a supernatural power source, the souls are held into place by the horror of their own dreams, the heart of an agony mephit will give the device that power. Forge these with a smithing hammer and a water flask and you will have your box. Of course if you have not the skill, I can [forge them for you].");
	elseif(e.message:findi("forge them for me")) then
		if(e.self:GetSkill(63) > 59) then
			e.self:Say("A smith of your skill does not need my assistance in making the box, however I won't turn away your money. Bring me three thousand platinum, the perilium, the brain, and the heart and I will make the box for you.");
		else
			e.self:Say("If you return all three items to me I will do the work for you for, a mere three thousand platinum. I will not guarantee my success, but I can guarantee if you do not have the skill, you will fail.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29228, item2 = 29229, item3 = 29230, platinum = 3000})) then
		e.self:Say("Ah ha! Here we go one box of souls!");
		e.other:QuestReward(e.self,0,0,0,0,29281);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
