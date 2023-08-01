function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("halts his chanting. 'You dare to interrupt me? You had best have a good reason. I care not for small talk.'");
	elseif(e.message:findi("keepers grotto")) then
		e.self:Say("Keepers Grotto is where you shall find the Keepers. They study and scribe the spells of our dark circle. The grotto is not far from here, near the arena called the Gauntlet.");
	elseif(e.message:findi("new revenant")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("Yes. You are. You shall do as I command. Take this. It is incomplete and must be ready for the emperor within the half season. You must find the [Four Missing Gems]. When you have them, then you will have to Quest for the [Grand Forge of Dalnir]. Within it's fire, all shall combine. Return the Sceptre to me with your Revenant Skullcap. Go.");
			e.other:SummonCursorItem(12873); 								--Unfinished Sceptre
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("four missing gems")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Say("The missing sceptre gems are: an Eye of Rokgus, a Gem of Yet to Come, a Heart of Torsis and the Crown Jewel of Ganak.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("forge of dalnir")) then
		if(e.other:GetFactionValue(e.self) >= 200) then
			e.self:Emote("scratches his chin. 'I know little of it other than that it once belonged to the ancient Haggle Baron, Dalnir. From what I have read, its fires require no skill, but will melt any common forge hammer used. Dalnir was said to have called upon the ancients for a hammer which could tolerate the magical flames.'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I await both the sceptre and your revenant skullcap.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18207})) then 	--Guild Summons
		e.self:Say("Another apprentice has reached rebirth. You now have become one with the Brood of Kotiz. We study the ancient writing of Kotiz. Through his writing we have found the power of the dark circles. Listen well to the scholars within this tower and seek the [Keepers Grotto] for knowledge of our spells. This drape shall be the sign to all Iksar that you walk with the Brood. Now go speak with Xydoz.");
		e.other:Faction(e.self,443,100); 								--Brood of Kotiz
		e.other:Faction(e.self,441,25); 								--Legion of Cabilis
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,12407,500);			--Drape of the Brood
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12874, item2 = 4265},1,text)) then
		e.self:Emote("presents to you a glowing skullcap. 'This is the treasured cap of the sorcerers of this tower. Let all gaze upon you in awe. You are what others aspire to be. I look forward to reading of your adventures, Sorceror " .. e.other:GetCleanName() .. ".'");
		e.other:Faction(e.self,443,10); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,2,4266,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 48037})) then
		e.self:Say("You have done well in doing what I have asked. To make a gem of reflection you will need some Mt Death mineral salts, a green goblin skin, spiroc bone dust, essence of rathe, blue slumber fungus, and a vial of pure essence. Combine all of these in this container and you will have what it is you seek.");
		e.other:QuestReward(e.self,{itemid = 48039});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14794})) then
		e.self:Emote("hisses and says venomously, 'And I am disturbed yet again. I hope for your sake it is important.'");
		e.self:Emote("The gaunt necromancer looks down at the paper in his hands and after reading a few lines gasps, then falls into a violent coughing fit. After recovering he takes a deep breath, puffs his chest out and hands the paper back to you. With his head held high, he says in a raspy voice, 'Show this to Rixiz. He will test you.'");
		e.other:QuestReward(e.self,0,0,0,0,14794);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14793})) then
		e.self:Emote("snatches the note out of your hands, obviously irritated. After reading a few lines, he glances up at you, his brow furrowed, then looks down again to continue reading. When he's finished, he hands the note back to you and takes a deep breath, shuddering slightly. He then says, 'Xydoz. Take this to Xydoz. He will test you.'");
		e.self:Emote("watches you carefully as you leave.");
		e.other:QuestReward(e.self,0,0,0,0,14793);
	end
	item_lib.return_items(e.self, e.other, e.trade) -- return unused items
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
