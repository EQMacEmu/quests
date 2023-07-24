-- Part of SK Epic 1.0 Quest
function event_say(e)
	if(e.other:GetFaction(e.self) < 7) then
		if(e.message:findi("apprentice")) then
			e.self:Say("As stubborn and foolish as he sometimes was, he was full of potential. Had he managed to achieve my age he doubtless would have surpassed my abilities. Though I am not surprised at his passing, he will be sorely missed. Well, I thank you for your efforts. Feel free to meet me in the tavern for a drink sometime. I must now get to the task of replacing my associate.");
		elseif(e.message:findi("replace him")) then
			e.self:Say("Hmm, you seem a bit green and I hesitate to trust you with such an important work, but time is of the essence as my days in this world are running out. Bring me back a bottle of cough elixir and, if you are still interested, I will instruct you further.");
		elseif(e.message:findi("searching")) then
			e.self:Say("I possess a key that will open a sealed tome to be found somewhere in the ruins uncovered here not long ago. Recover that tome for me and I am certain I will be able to corrupt the Ghoulbane. My name will be etched in history and you will wield a legend! You must hurry now, and I must return to my studies. Do not return to me, " .. e.other:GetCleanName() .. ", without the tome.");
		elseif(e.message:findi("items")) then
			e.self:Say("I will need the Ghoulbane, the Soul Leech, the Blade of Abrogation, and the Decrepit Sheath. Alas, I am far too ill to travel and collect these pieces. I must call upon your youth and ability again, " .. e.other:GetCleanName() .. ". Return to me with these items and I shall be known throughout history as the greatest grave lord to have walked Norrath and you shall be among the most powerful in our art.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local charfaction = e.other:GetFactionValue(e.self); -- Faction: True Spirit
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18099})) then
		e.self:Say("Yes, most unfortunate. I was informed last week of the death of my most recent apprentice. A few months ago, I paid a substantial sum to a group of rogues sent from Neriak to collect on a gambling debt. He swore to me that was the end of it, but I suspected otherwise. My warnings of gambling with the rogues fell on deaf ears.");
		e.other:Faction(e.self,404,3); -- Faction: True Spirit
		e.other:QuestReward(e.self,0,0,0,0,0,15000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14365})) then
			e.self:Say("Thank you. Now, quickly, there is not much time for me. What I tell you here now must never be shared with another soul. I have spent the better part of my life piecing together clues for the creation of a legendary dark blade, a corrupted Ghoulbane. I am very close to understanding the method used in manipulating the enchantments of the Ghoulbane, but in my current condition, I cannot finish collecting the research. My previous apprentice was searching for this last clue when he met his untimely demise.");
			e.other:Faction(e.self,404,3); -- Faction: True Spirit
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14382})) then
			e.self:Emote("gasps at you in astonishment, his eyes beaming with pride, and says, 'You've found it! It seems I underestimated you. You have succeeded where others failed. I feared it would never come to pass.' Duriek takes the key from his neck, softly muttering some words, and places it in a previously unseen keyhole. The book's hinges creak as Duriek pulls it open. After reading for a few moments, he says, 'It is even better than I had hoped! It will take me weeks to uncover a portion of what this book has to offer. But this is what I have been searching for, so many years! At last I know the items required to corrupt that accursed blade!'");
			e.other:Faction(e.self,404,3); -- Faction: True Spirit
	elseif(charfaction >= -83) then
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5403,item2 = 11609,item3 = 5430,item4 = 14366})) then
			e.self:Emote("takes the Ghoulbane and places the other swords on either side of it. The sheath begins to gleam so intensely, you can see the bones inside Duriek's hands. After several minutes, there is a final, blinding flash. Duriek collapses to the ground. After a few moments, Duriek motions you closer and whispers, 'You have done well. I wish fate had been kinder to me and allowed me your aid years ago--I might have lived long enough to enjoy the fame of our combined efforts. I studied much of the tome you retrieved and have stumbled upon something that may be the key to unleashing darkness upon the face of Norrath forever. You must seek out a powerful lich by the name of Lhranc. Farewell, " .. e.other:GetCleanName() .. ".' With his last bit of energy, Duriek places the corrupted Ghoulbane in your hands.");
			e.other:Faction(e.self,404,3); -- Faction: True Spirit
			e.other:QuestReward(e.self,0,0,0,0,14367);
			eq.depop_with_timer();
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75006 -- Duriek_Bloodpool
--Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
