function event_signal(e)
	e.self:Say("Sure. Go Ahead and play it now, while the stage is clear.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, my name is Belious Naliedin of the League of Antonican Bards. A few years ago, I had finally saved up the money, and I bought this place. I settled in, and have been [working] here ever since.");
	elseif(e.message:findi("working")) then
		e.self:Say("Ah, this is my shop. I am a musician, well known for my ability both in tuning, and [building instruments.]");
	elseif(e.message:findi("building")) then
		e.self:Say("Young bards are often not the wealthiest people in Norrath, and oftentimes, they have nothing to accompany their beautiful voices when they sing. If young bards are able to locate, and bring to me the [various parts] to assemble a lute with, I provide the labor for free.");
	elseif(e.message:findi("parts")) then
		e.self:Say("If you are able to find an unfinished lute body, an unfinished lute neck, a box of lute strings, and a set of fine lute tuners I will be able to craft for you one of the best sounding lutes that you have ever heard in your young life, and it will be yours, free of charge. It has long been my desire to help out any young men and women who wish to explore the bardic arts.");
	elseif(e.message:findi("bard")) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
	elseif(e.message:findi("audience")) then
		e.self:Emote("laughs briefly. 'Ah! In order to gain an audience with him, you must have a letter of introduction from me, otherwise he will not give you the time of day.'");
	elseif(e.message:findi("introduction")) then
		e.self:Emote("looks around. 'Well, you want a letter of introduction, eh? I think that fifty shiny platinum pieces sounds like a good introduction to me, my friend.'");
	elseif(e.message:findi("carson") or e.message:findi("highpass")) then
		if(e.other:GetFactionValue(e.self) >= -100) then	
			e.self:Say("Well, we all know that Carson McCabe runs Highpass Hold, the main passage to Eastern Antonica. Rumor has it that he has some big internal power struggle going on right now.");
		else
			e.self:Say("The League of Antonican Bards is very displeased with your recent actions.   And I don't particularly care for you, or your stench, either!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18717})) then -- Tattered Note
		e.self:Say("Good day friend, and welcome to the Wind Spirit's Song. Thank you for joining our cause. Go speak with Jusean Evanesque; I'm sure you'll fit in well.");
		e.other:Faction(e.self,284,100,0); -- League of Antonican Bards
		e.other:Faction(e.self,281,15,0); -- Knights of Truth
		e.other:Faction(e.self,262,15,0); -- Guards of Qeynos
		e.other:Faction(e.self,304,-5,0); -- Ring of Scale
		e.other:Faction(e.self,285,-5,0); -- Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,13502,100); -- #Brown Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 20374})) then
		e.self:Say("A famous bard, you say? Why you must be seeking none other than the great Baenar Swiftsong! He is not here as you can see. Mayhap you seek an audience with him? He is a busy man and has not the time to speak with everyone who wishes to preoccupy his time with useless prattle! You are many and he is but one! Leave him be, I beg of you, to continue his songwriting in peace.");
		e.other:QuestReward(e.self,0,0,0,0,0,100);
	elseif(item_lib.check_turn_in(e.self, e.trade, {platinum = 50})) then
		e.self:Say("Ah! Here is that letter of introduction I was looking for! Baenar likes to frequent a serene fountain in the southern Karanas. He finds the peace there accommodating to his work. He may even sing a tale for you if the mood strikes him.");
		e.other:QuestReward(e.self,0,0,0,0,20373,100); -- Item: Letter of Introduction
	elseif(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13775, item2 = 13776, item3 = 13777, item4 = 13778})) then -- requires amiably faction
		e.self:Say("Ok, great. See, assembling these isn't that hard. Add a few special touches, and there you go. Another beautiful Naliedin lute is born, and ears everywhere rejoice.");		
		-- Confirmed Live Factions
		e.other:Faction(e.self,284,250,0); -- League of Antonican Bards
		e.other:Faction(e.self,281,37,0); -- Knights of Truth
		e.other:Faction(e.self,262,37,0); -- Guards of Qeynos
		e.other:Faction(e.self,304,-12,0); -- Ring of Scale
		e.other:Faction(e.self,285,-12,0); -- Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,13105,20000); -- Item: Custom Naliedin Lute
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1133 -- Belious_Naliedin
