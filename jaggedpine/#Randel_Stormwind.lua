-- Randel_Stormwind
-- Quest for Jaggedpine - Randel Stormwind: Jaggedpine Poacher Heads

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met, " .. e.other:GetCleanName() .. ". This has been a very stressful time for many of us and some of us have been kind of edgy lately. We've lived here for generations and in relative seclusion and we enjoyed a simple life for the most part. Unfortunately, this was not to last and the sudden [change] has left many on edge.");
	elseif(e.message:findi("change")) then
		e.self:Say("There are a lot of people that resent the outsiders and view their presence as corrupting our way of life. It's more then just the new guards and the sudden influx of people though. This is sort of a long story that begins when my grandfather was just a lad. It was during the rule of Antonius III that public [access] to the Jaggedpine Forest [was restricted].");
	elseif(e.message:findi("access was restricted") or e.message:findi("access restricted")) then
		e.self:Say("The Protectors of the Pine became concerned when adventurers began wandering through Jaggedpine Forest and into the Unkempt Wood. Most that did were never heard from ever again. The residents of Surefall feared retaliation from the Unkempt for those trespassing into their territory and Antonius smartly reasoned that if Surefall Glade were to be taken, Qeynos would surely be next. So he declared Jaggedpine Forest and all points eastward off limits. So it was just our ancestors that dwelled on the [Throne of Karana's Fury].");
	elseif(e.message:findi("Throne of Karana")) then
		e.self:Say("Yes, that was what this place was called until recently but I'll get to that part in a minute. We who acted as stewards were allowed to come and go as we pleased through Surefall Glade. For the longest time things were peaceful. Sure, we had problems with the odd [poacher] here or there but for the most part it was peaceful. However, trouble began when an [outsider] snuck through Surefall Glade and entered the Unkempt Wood.");
	elseif(e.message:findi("poach")) then
		e.self:Say("Yes poachers often sneak in and mindlessly kill our sacred bears for their skins. Often they'll kill a mother bear and leave their cubs for dead. If I am able, I'll take the cub and raise it. If I do my job well, I'm able to release the bear back into the wild once it is old enough to fend for itself. There is one [group] of poachers I'm particularly worried about though.");
	elseif(e.message:findi("group")) then
		e.self:Say("They are a pair of ne'er-do-well couples that have been terrorizing the animals recently, killing and maiming every creature they happen across. It's their sick idea of sport. They need to be stopped. They call themselves the [Pirates of the Pine].");
	elseif(e.message:findi("pirates of the pine")) then
		e.self:Say("They are a bunch of good for nothing lowlives! I would stop them myself but sadly, I lack skill with a weapon. You on the other hand, look like you can handle yourself pretty well. If you are able to bring these four to justice, return to me with proof. You will be justly compensated for your efforts.");
	elseif(e.message:findi("outsider")) then
		e.self:Say("She was a Koada`Dal Enchantress that frequently visited the libraries of Erudin. She heard about the strange Tunare worshipers and sought to investigate them. She barely escaped with her life and was found half dead by a kind ranger by the name of Jorgan Leafrunner. He took her back here and nursed her back to health. As a matter of course, they fell in love with each other. [Love is blind] they say.");
	elseif(e.message:findi("Love is blind")) then
		e.self:Say("She was a woman of the world, very agnostic in her beliefs and much different at the core from Jorgan who was a devout follower of Tunare. She began to corrupt him with her worldly beliefs and to turn him away from Tunare. She thought our name for what we call home was silly and began a campaign to convince other to change the name to [Fort Jaggedpine]. Whether it was by magic or diplomacy, she was successful in her campaign and the name was changed.");
	elseif(e.message:findi("Fort Jaggedpine")) then
		e.self:Say("Well, as you can well see, this is not much of a fortress. It is more of a collection of cabins really. Many were angry with the change and feared that Karana would punish them for changing the name and failing to honor the [gift] he had bestowed upon us.");
	elseif(e.message:findi("gift")) then
		e.self:Say("Ages ago, around the time that Qeynos was first being built, a terrifying storm swept the land. A massive lightning strike caused a fire and then a tempest descended from the sky and all but cleared this land we stand upon today. A group looking for a place to settle took this as a sign from Karana and built their homes here and named this place the Throne of Karana's Fury. This is a story we've all heard as children. Many are starting to become [superstitious] and feel that the gnolls moving in is our punishment for removing Karana's name from our settlement.");
	elseif(e.message:findi("superstitious")) then
		e.self:Say("Well it was quite a while ago that this happened. And Jorgan Leafrunner passed away a long time ago. However, his grandson Jeremy Leafrunner still lives, as does his grandmother Elishia who moved back to Felwithe after her husband's death. Many blame them for the trouble we are having now and for the sudden changes to our way of life. Already I have noticed an increase in [poaching].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9270,item2 = 9271,item3 = 9272,item4 = 9273})) then
		e.self:Say("Great Karana's blessing!! I see justice by your hand is both swift and eternal. I would never have had the skill nor the heart to carry out these miscreant's punishment the way you have. I'm glad to call you a friend and not an enemy. Well, I did promise just compensation for your efforts and I'm true to my word. Please take this ring as a token of my gratitude.");
		e.other:Faction(e.self,1597,50); -- Residents of Jaggedpine
		e.other:Faction(e.self,272,25); -- Jaggedpine Treefolk
		e.other:Faction(e.self,302,25); -- Protectors of Pine
		e.other:Faction(e.self,262,5); -- Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,9226); -- Sigil Ring of Jaggedpine
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
