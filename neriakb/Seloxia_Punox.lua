function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s eyes flare with fury as her beautiful features twist into a snarl of hatred that echoes her hissing voice, 'How dare you address me in such a fashion?!  I am the leader of the Indigo Brotherhood!!  You are lucky I do not strike you down where you stand!  You shall address me as 'Mistress.'  Many warriors have died so that I might gain this title.'");
	elseif(e.message:findi("mistress")) then
		e.self:Emote("maintains her imposing posture as she indifferently eyes " .. e.other:GetCleanName() .. ", 'You stand now in the Cauldron of Hate -- the Indigo Brotherhood. We are an organization of Neriak's finest warriors whom remain dedicated to Neriak, the Dark Father, and our founder -- his majesty, King Naythox Thex. I am Seloxia Punox, second to only his majesty in command of the Brotherhood. From the Cauldron of Hate, we maintain the protection of the city both within our city walls and beyond in the forest of Nektulos. Perhaps you would wish to prove yourself worthy of our ranks and perform a [little test] of your skills and dedication?'");
	elseif(e.message:findi("little test")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("My little test is this. I desire a report from Ambassador K'Rynn in the Ogre city of Oggok. You shall run to him. I will not wait until you raise your fighting skills. Combat is not your test. Overcoming the odds is. Fast agile warriors are we. We desire nothing less. Will you [venture to Oggok]?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	elseif(e.message:findi("venture to oggok")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Then you will go at once. Find your own way. Deliver this note to Ambassador K'Rynn and he shall give you the note to return to me. Do not stop to practice your skills. I offer this test to only the young warriors. If you die, then so be it. We need not inferior warriors. Now go!!");
			e.other:SummonCursorItem(18842); -- Sealed Letter (Letter To Krynn)
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Go! Return when you have done more to serve the Indigo Brotherhood of Neriak. Fewer Leatherfoot Raiders in Nektulos and a few Leatherfoot skullcaps in the palms of Master Narex shall prove your true warrior nature and loyalty to our house.");
		else
			e.self:Say("Your head will make a fine trophy in the halls of the Indigo Brotherhood.");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18751})) then
		e.self:Say("I shall reserve any official welcoming until you have proven yourself a suitable member for the Indigo Brotherhood. That proof shall be obtained by your progression in your training. See Yegek B'Larin, one of my most trusted trainers in the Brotherhood and obey his command carefully if you wish to succeed as a member of the Brotherhood.");
		e.other:Faction(e.self,270,100); --Indigo Brotherhood
		e.other:Faction(e.self,326,-15); --Emerald Warriors
		e.other:Faction(e.self,311,-5); --Steel Warriors
		e.other:Faction(e.self,1522,-200); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,13580,20); --Old Training Tunic*
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18843})) then   -- Sealed Letter (Letter To Seloxia)
		e.self:Say("Very fine work my young warrior. You may soon be ready to become a Teir'Dal courier. For now we shall reward you. This will assist you in further service to the Indigo Brotherhood and King Naythox Thex.");
		e.other:Faction(e.self,270, 10); --Indigo Brotherhood
		e.other:Faction(e.self,326,-1); --Emerald Warriors
		e.other:Faction(e.self,311,-1); --Steel Warriors
		e.other:Faction(e.self,1522,-20); --Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5026,1001,1002,1003,1004,1005,5014,5015,5021,5027),250); -- Random minor items
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakb  ID:41066 -- Seloxia_Punox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
