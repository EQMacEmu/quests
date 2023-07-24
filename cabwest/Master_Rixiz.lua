function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You are on the grounds of the Brood of Kotiz. If you do not belong, you must leave at once. There shall be no [third rank skullcap] for you.");
	elseif(e.message:findi("third rank skullcap")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I offer the third rank apprentice skullcap to those who wear the second. If that is you, then you will do the [bidding of the tower].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("bidding of the tower")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Take this glass canopic. Within it you shall place a brain for me. The brain I seek is that of a sarnak crypt raider. Any shall do. The ones we seek should be near the Lake of Ill Omen. When you obtain the brain, you must quickly put it into the glass canopic with [embalming fluid]. When these are combined, the canopic shall seal and if you return it to me with your second rank skullcap, I shall hand you the next and final skullcap.");
			e.other:SummonCursorItem(17023); -- Item: Brood Canopic
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("embalming fluid")) then
		e.self:Say("Embalming fluid is created through brewing, but do not drink it!! You can learn about the process of brewing on our grounds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "You shall get no skullcap until I have the preserved raider brain and your second circle apprentice skullcap.";
	local text2 = "I will not be bothered unless you bring me everything!";
	
	-- preserved sarnak brain and necro skull cap 2, gives skull cap 3
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12411, item2 = 4261},1,text1)) then
		e.self:Say("You have done well. Here is your final apprentice skullcap.");
		e.other:Faction(e.self,443,10); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(15),0,4262,150); -- Item: Apprentice Skullcap - 3rd Rank
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14794})) then
		e.self:Emote("takes the note and after reading a few lines opens his eyes wide in astonishment. He looks up at you and stares at you a while before he says,");
		e.self:Say("You spoke to the Brothers? A common soldier such as yourself interested in silly stories to frighten broodlings? Fine, then. You shall know confidence, if you live. If you have the strength to stride into a lair, go before the owner, and kill that thing in its own home, you will acquire a small part of the virtue we as necromancers must master to ply our art. In the Frontier Mountains lives a unit of the troublesome burynai. Invade their home and destroy their leader. Bring me proof and two fire emeralds.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14810, item2 = 10033, item3 = 10033},1,text2)) then
		e.self:Say("Well done, here is your reference.");
		e.other:QuestReward(e.self,0,0,0,0,14813,10000); -- Item: Glosk's Reference: Boots
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
