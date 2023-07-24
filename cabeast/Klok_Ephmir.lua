function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you with a wicked smirk. 'So you share the Brood's love of frogloks, do you? Alive, they provide much trouble. Dead, they provide much delight. I have found many uses for the frogloks. From fine meat to fine mats. Be sure to ask if you do not see something you desire.'");
	elseif(e.message:findi("i need thinly sliced froglok")) then
		-- Catfish Croak Sandwich [Part 5]
		e.self:Say("I can provide thin sliced froglok meat, or rather, I used to. First I need to [sharpen the dull cutting disk].");
	elseif(e.message:findi("sharpen.*disk")) then
		-- Catfish Croak Sandwich [Part 6]
		e.self:Say("That would be good. If you are a blacksmith, I am sure you can find a sharpening stone and bring life back in my disk. If you sharpen this I shall gladly provide you with some thin sliced froglok.");
		e.other:SummonCursorItem(12449); -- Item: Dull Cutting Disk
	elseif(e.message:findi("outlander")) then --Shackle of Copper Quest
		e.self:Emote("turns pale at the mention of the Outlander. 'The Outlander!! That is what the lizards in the Tink N' Babble have dubbed him!! He is tall and strong. Get close enough and he will kill you on sight!! I think he could even defeat the likes of Bruiser Noz!! I spotted him near the edge of the swamps. He was headed toward the fields of Firiona.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: Sharpened Cutting Disk (12450)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12450})) then
		-- Catfish Croak Sandwich [Part 7]
		e.self:Emote("takes the disk and attaches it to an odd device powered by a foot pedal. He takes a froglok leg and begins to slice it as chunks of gristle flies into your face. When he is done he hands you some thin sliced froglok. 'There you are. Run along.'");
		e.other:QuestReward(e.self,{items = {12445,12445,12445,12445}}); -- Item: Thin Sliced Froglok Meat
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted By: Senzo
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
