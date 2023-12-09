function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmmph!! Expect to be a great master such as I? Maybe. You still appear to be a [whiff].");
	elseif(e.message:findi("whiff")) then
		e.self:Say("A whiff is the sound of a tail striking air. A whiff is you. Inexperienced. I can help you, if you want to earn the [second shackle].");
	elseif(e.message:findi("second shackle")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Then you shall perform the first rite. Take this pack. To the Outlands you will go. You will fill and combine the pack with one of each of the following: goblin scout beads, a large scorpion pincer, a froglok skipper skipping stone, and a sabertooth cub canine. Bring these to me and you shall prove yourself a monk.");
			e.other:SummonCursorItem(17026); -- Item: First Rite Pack
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
		else
			e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
		end
	elseif(e.message:findi("shackle.* stone")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Interested in the shackle of stone are we? They are made for monks who have earned their first two shackles and are ready to climb up to the next rung. A monk who feels he is ready to wear the shackle of stone must first perform the [task of cleansing].");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
		else
			e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
		end
	elseif(e.message:findi("task.* cleansing")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Go forth to the outer gates and seek out the Iksar bandits. They have refused to bow to the will of the empire and shall pay dearly for their traitorous ways. They often wear bandit masks. If you return with two bandit masks and the shackles of dust and clay then I shall reward you with the shackle of stone.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
		else
			e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
		end
	elseif(e.message:findi("gandan tailfist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Gandan Tailfist was the commander of a small band of Swifttails which I sent in search of the [Whistling Fists]. That was one season ago. I have heard that the Iksar Bandits have information regarding him. If you have a clue as to his whereabouts, hand it over. Unless it is merely half a note. That would do you no good. I require the full note.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
		else
			e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
		end
	elseif(e.message:findi("whistling fist")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The legendary Whistling Fists are said to work only on the hands of a monk. They are said to bestow great power on the wielder.  It is written that they were crafted by the gods who devised the disciplines of this caste.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Swifttail Caste desires further service before I can share this with you.");
		else
			e.self:Say("Leave at once!  I will warn you no longer.  You are no friend to the Swifttail Caste.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "You will get nothing until I hold two bandit masks and the shackles of dust and clay.";	

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12427})) then
		e.self:Say("You have succeeded, young " .. e.other:GetCleanName() .. "! You have proven yourself a skilled monk. You will now wear the shackle of clay. You will now be required to increase your intensity of training in hopes that you may soon be able to earn your [shackle of stone].");
		e.other:Faction(e.self,444,10); -- Faction: Swift Tails
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(0,10),0,4191,5000); -- Item: Shackle of Clay
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 4190, item2 = 4191, item3 = 12428, item4 = 12428},1,text1)) then
		e.self:Say("You have done supremely, " .. e.other:GetCleanName() .. ". You have earned your shackle of stone. Mistress Niska will now help you on your way to earning the shackle of rock. May the elements guide you to the next rung.");
		e.other:Faction(e.self,444,10); -- Faction: Swift Tails
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(0,10),0,4192,10000); -- Item: Shackle of Stone
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18469, item2 = 12822})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,5); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Item: Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18470, item2 = 22924})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,5); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000); -- Item: Mark of Clarity
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18232, item2 = 18233})) then
		e.self:Say("This is all that was ever found of Gandan Tailfist. I wish you luck in your quest. May you fare better than he did."); --Unable to find the true text; made this up
		e.other:Faction(e.self,444,5); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,12429,5000); -- Item: Ancient Thin Flute
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by: Senzo aka Fatty Beerbelly
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
