function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetCleanName() .. "! I am Megosh Thistlethorn first Ranger of the Storm Reapers of Rivervale. I journeyed many years ago to the Surefall Glade far to the west of our lovely shire. It was there I trained with the human and half-elven rangers that like the Storm Reapers are faithful disciples of Karana. I have returned now to Rivervale to teach our interested young people the ways of a ranger of the Storm Lord, so that we may defend our shire and the wilds of Norrath from the [evil forces] that would see it destroyed.");
	elseif(e.message:findi("evil forces")) then  
		e.self:Say("Currently the Death Fist Clan of Orcs, a race of bloodthirsty humanoids concerned only with expanding their territory and slaughtering all who stand in their path, threatens our homeland. The Orcs have long had a minor presence in the Misty Thicket but lately they have been amassing in greater numbers. The Death Fist has been chopping down our trees and quarrying rock from the nearby mountains. We know only that they have been shipping the materials to the commonlands and stockpiling it for what purpose we do not know. As rangers of the Storm Reapers it is our duty to [stop the desecration] of the thicket.");
	elseif(e.message:findi("stop the desecration")) then
		e.self:Say("First you must outfit yourself for battle with the Death Fists. Seek Bipdo Hargin here in Rivervale and give him this letter. He will instruct you further on getting yourself outfitted for the tasks ahead. Once you have been outfitted in a suit of Thorn Mail Armor return to me and I will instruct you for your [next task].");
		e.other:SummonCursorItem(19627); -- Item: Letter to Bipdo Hargin
	elseif(e.message:findi("next task")) then
		e.self:Say("If you feel you are ready to face the Orcs of Clan Death Fist then journey to the Misty Thicket beyond the protection of the Wall of Cetelt. Hunt the Orcs that are cutting down the trees of the thicket and bring me two of the Orc Lumberjack Axes and two of the Orc Lumberjack Machetes.");
	elseif(e.message:findi("forge")) then
		e.self:Say("What forge?  Didn't you see it on the way in, young " .. e.other:GetCleanName() .. "?  Oh, and check with Smithy Bodbin about the sharpening stones, he usually has a good supply of them.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18432})) then -- Handin the Halfling Ranger note
		e.self:Say("Welcome to the Storm Reapers " .. e.other:GetCleanName() .. "! Here is a tunic to keep you warm in your travels. Rivervale, our lovely home is facing dangerous times. From both the east and west forces devoted to the evil Gods Bertoxxulous and Innoruuk are corrupting and destroying the wilds of Norrath. Also, the Orcs of Clan Deathfist are waging war on this entire region and gathering lumber and stone for some unknown purpose. We must do our best to preserve the lands and way of life of all Karanas people.");
		e.other:Faction(e.self,355,100,0); -- +Storm Reapers
		e.other:Faction(e.self,286,10,0); -- +Mayor Gubbin
		e.other:Faction(e.self,292,15,0); -- +Merchants of Rivervale
		e.other:Faction(e.self,324,-15,0); -- -Unkempt Druids
		e.other:QuestReward(e.self,0,0,0,0,13541,100); -- Jumjum Sack Tunic*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 19622,item2 = 19622,item3 = 19623,item4 = 19623})) then -- Handin 2 Orc LumberJack Axes and 2 Orc LumberJack Machetes
		e.self:Say("Excellent work young Storm Reaper " .. e.other:GetCleanName() .. ". Now take this Dull Storm Reaper Machete to a [forge] and sharpen it with a sharpening stone. It may take several attempts to get the blade to an adequate sharpness if you are unfamiliar with the process. Once it is sharpened give it to Bodbin Gimple with a ruined thorn drakeling scales and he will put the finishing touches on what will be a fine weapon!");
		e.other:Faction(e.self,355,5,0); -- Faction: Storm Reapers
		e.other:Faction(e.self,286,1,0); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,292,1,0); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,324,-1,0); -- Faction: Unkempt Druids
		e.other:QuestReward(e.self,0,0,0,0,19624,10); -- Item: Dull Storm Reaper Machete
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19050 -- Megosh_Thistlethorn
