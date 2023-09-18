function event_spawn(e)
	eq.set_timer("konem",4100000);
end

function event_timer(e)
	e.self:Say("I can't believe that lazy [Konem] has been gone for over two days.  That's the last time I send that guy out for me.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, my name is Phin. Practice, practice, practice.. That's my motto. It is my responsibility to train our members, and help them to advance their skills and abilities. I also reward our members with colored [Headbands] for completing certain tasks.");
	elseif(e.message:findi("white headband")) then
		if(e.other:GetFactionValue(e.self) >= 150) then
			e.self:Say("That is our training headband.. Beginning students can earn this by slaying four [gnoll] pups, and bringing their scalps back to me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
		end
	elseif(e.message:findi("yellow headband")) then
		if(e.other:GetFactionValue(e.self) >= 175) then
			e.self:Say("This is awarded to our students for helping clear out the evil that inhabits the old ruins of the Qeynos Hills. Just bring me back three putrid rib bones as proof of your good deeds and turn in your [training headband], and then I will give you the yellow headband.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
		end
	elseif(e.message:findi("orange headband")) then
		if(e.other:GetFactionValue(e.self) >= 225) then
			e.self:Say("This is a difficult award to obtain. The city of Qeynos is, as you know, under constant attack by the gnolls of Blackburrow. The Silent Fist Clan rewards its members who venture deep into this gnoll stronghold and bring swift justice to these vile creatures. Please return two Blackburrow gnoll pelts - make sure they aren't ruined - and a Blackburrow gnoll skin as proof of your noble actions. Also, turn in your [yellow headband], and then I shall give you the orange one. Good luck.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I have been watching you, and appreciate the help you've given to the brothers and sisters of the Silent Fist. But, I feel that such a vital matter should be left to one of our more trusted members.");
		else
			e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
		end
	elseif(e.message:findi("Headband")) then
		e.self:Say("Yes, I give the [White, Yellow, and Orange Headbands] to our newer members, and Togahn gives out [Red, Purple, and Blue Headbands] to our elder members.");
	elseif(e.message:findi("Tomer Instogle")) then
		e.self:Say("Tomer? I think Seta needs someone to go find him... Go ask her.");
	elseif(e.message:findi("Konem")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Ah yes, Konem. I had him run an errand out to Surefall Glade over two days ago, and he still hasn't returned. Knowing Konem, he probably found a nice shady tree to take a nap under. If you happen to pass by him, could you please take him this note?  Thanks, " .. e.other:GetCleanName() .. ", and be safe.");
			e.other:SummonCursorItem(18921); -- Item: Message to Konem
		else
			e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
		end
	elseif(e.message:findi("gnoll")) then
		e.self:Say("Those vile creatures are constantly attacking our city.. and often killing innocent citizens. It is our duty to help defend Qeynos from their vicious raids.");
	elseif(e.message:findi("black headband")) then
		e.self:Say("The black headband is one of the highest honors of the Silent Fist Clan.  Only [Lu'Sun] gives those out.");
	elseif(e.message:findi("lusun")) then
		e.self:Say("Ahhh, Lu'Sun is a master of many skills.  He has traveled all of Norrath, studying various techniques and disciplines.  Now, he runs this small guild and passes on his knowledge to those willing to devote their lives to our cause.");
	elseif(e.message:findi("red") or e.message:findi("purple") or e.message:findi("blue")) then
		e.self:Say("Togahn gives out the red, purple, and blue headbands...  go ask him what you need to do to earn one.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Good.. the more of these vile dogs we slay, the safer the citizens of Qeynos will be.";
	local text2 = "Ahh.. Good. I feel that your hard work and training will soon be rewarded.. and the yellow headband shall soon be yours.";
	local text3 = "Good work, " .. e.other:GetCleanName() .. ". You are well on your way toward earning the orange headband.";

	-- Note from Konem, Grathins Invoice ID-18922
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18922})) then
		e.self:Say("Oh this is not good. Too many innocent traders have been getting robbed lately by those vile bandits out in the Karanas. Something must be done soon. Anyway, thank you for delivering the message... you did very well, young " .. e.other:GetCleanName() .. ". Here's a little something to quench your thirst from all that running around.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,309,5,0); -- Faction: Silent Fist Clan
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,361,1,0); -- Faction: Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,13006,1500); -- Water Flask
	-- White Headband ID-10110 requires four Gnoll Pup Scalp ID-13789
	elseif(e.other:GetFactionValue(e.self) >= 150 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13789,item2 = 13789, item3 = 13789,item4 = 13789},1,text1)) then -- verified xp live 9/16/2023
		e.self:Say("Good job, " .. e.other:GetCleanName() .. ", keep up the good work! Here is your white training headband. Wear it with honor, and make Lu'Sun proud.");
		e.other:Faction(e.self,309,25,0); -- Faction: Silent Fist Clan
		e.other:Faction(e.self,262,3,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,361,1,0); -- Faction: Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,10110,200); -- Item: White Headband 
	-- Yellow Headband ID-10111 requires three Putrid Rib Bone ID-13722 and the White Headband ID-10110
	elseif(e.other:GetFactionValue(e.self) >= 175 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13722,item2 = 13722, item3 = 13722,item4 = 10110},1,text2)) then -- verified xp live 9/16/2023
		e.self:Say("Good work.. and, as promised, here is your reward. It is an honor to present this yellow headband to " .. e.other:GetCleanName() .. ", for recent acts of courage and heroism, on behalf of the Silent Fist Clan.");
		e.other:Faction(e.self,309,50,0); -- Faction: Silent Fist Clan
		e.other:Faction(e.self,262,7,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,361,2,0); -- Faction: Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,10111,400); -- Item: Yellow Headband
	-- Orange Headband ID-10112 requires two Blackburrow Gnoll Pelt ID-13027, one Blackburrow Gnoll Skin ID-13028 and the Yellow Headband ID-10111
	elseif(e.other:GetFactionValue(e.self) >= 225 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13027,item2 = 13027, item3 = 13028,item4 = 10111},1,text3)) then -- verified xp live 9/16/2023
		e.self:Say("It is an honor to present the orange headband of the Silent Fist Clan to one of our finest members, " .. e.other:GetCleanName() .. " the mighty!");
		e.other:Faction(e.self,309,50,0); -- Faction: Silent Fist Clan
		e.other:Faction(e.self,262,7,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,361,2,0); -- Faction: Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,10112,800); -- Item: Orange Headband
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  NPC:Phin_Esrinap 

