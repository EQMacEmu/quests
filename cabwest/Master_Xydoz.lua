function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("What is it you seek within the tower? Could it be that you are a new apprentice? If so, you are required to don the [apprentice skullcap]");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	elseif(e.message:findi("apprentice")) then
		e.self:Say("All new members of the Brood of Kotiz are required to don the [apprentice skullcap]. To earn one, a new apprentice is required to fetch four brains for further experiments. Not just any four brains, mind you, but the brains of [sarnak] hatchlings.");
	elseif(e.message:findi("sarnak")) then
		e.self:Say("Sarnak ? Do not speak loudly, that name. If you seek information on the sarnak, read the tome of this tower. The tower librarian should be found within.");
	elseif(e.message:findi("second rank skullcap")) then
		e.self:Say("Looking for the second rank skullcap ? Look no further, but be prepared to earn it. I seek a [faded tapestry]. Now, too, so do you.");
	elseif(e.message:findi("faded tapestry")) then
		e.self:Say("I have heard reports of such a thing found upon Sarnak hatchlings. They must have scampered from the safety of their dwelling with their master's property. I would like to see this tapestry, but only when it has been mended. I need find a necromancer who is [adept at tailoring].");
	elseif(e.message:findi("kor sha")) then
		e.self:Say("Do not become like the herbalist, Jondin.  He has many questions concerning Kor - Sha.  It is recorded in the tower tomes.  It was a laboratory of a once great Iksar.  It turned to rubble long ago.");
	elseif(e.message:findi("adept at tailoring")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("If you are a member of the Brood and wish to assist you may seek out this tapestry. Find the Torn and Ripped pieces and take them both to a sewing kit. Return with the mended tapestry and your first rank skullcap and I shall see that you are rewarded with coin and a second rank skullcap");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have shown more devotion to the Brood of Kotiz, we can discuss such things.");
		else
			e.self:Say("You are a true simpleton to think you can speak to me.  You are no ally to the Brood of Kotiz.  Begone, before I make your blood boil!");
		end
	end
end

-- 4 sarnak hatchling brains, returns necro skull cap 1, raises brood of kotiz and legions of cabilis
-- mended tapestry + necro skull cap1, raises brood of kotiz and legions of cabilis
function event_trade(e)
	local item_lib = require("items");
	local text1 = "I must have the mended tapestry and your first circle apprentice cap before I reward you."
	local text2 = "Do not bother me unless you have all that I asked for, grunt. Two star rubies AND the book! Now get OUT of here!";
	local text3 = "I will require four sarnak whelp brains for my experiment. When I have them, then you shall have the skullcap of the apprentice, first circle.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12408, item2 = 12408, item3 = 12408, item4 = 12408},1,text3)) then
		e.self:Say("Good work, my young apprentice. You will make a fine addition to our ranks. Here is your first apprentice skullcap. Wear it as a sign of our circle. Do not lose it. Someday you shall wear a necromancer skullcap, but next shall come the [second rank skullcap].");
		e.other:Faction(e.self,443,2); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,4260,100); -- Item: Apprentice Skullcap - 1st Rank
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 4260, item2 = 18208},1,text1)) then
		e.self:Say("A job well done, apprentice " .. e.other:GetCleanName() .. ". Your fine service shall earn you the second circle apprentice skullcap. I would advise you to forget this tapestry, it is nothing more than an ancient rug of no importance.");
		e.other:Faction(e.self,443,10); -- Faction: Brood of Kotiz
		e.other:Faction(e.self,441,2); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,4261,120); -- Item: Apprentice Skullcap - 2nd Rank
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14793})) then
		e.self:Emote("snatches the paper from your hand and hisses in anger. Without even looking at the paper he growls");
		e.self:Say("WHAT?! What is this tra... He stares down at the paper, mouth hanging open wide in disbelief. He finally continues, saying, Very well, then. If you wish to know confidence I have a task for you. Our hated enemies, the sarnak, have a tome we have sought to return to our libraries for centuries. At this point, we believe it to be found in a small fortress they maintain near the Great Lake. One of their scholars will most likely have it on their person. Bring it to me along with two star rubies.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 14811, item2 = 10032, item3 = 10032},1,text2)) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,14831,10000); -- Item: Glosk's Reference: Greaves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
