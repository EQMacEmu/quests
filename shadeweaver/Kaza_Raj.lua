--Ghulam Armor
--I saw no mention of experience or faction hits in the quest on Alla's.
--After writing this, I saw that someone else already had.  I merged my work and theirs, whoever it was.  They had better dialogue information than I did.  -Kilelen

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Ah. greetings!  I am Kaza Raj, trainer of young Vah'shir!  Bring me the items I ask and I will reward you with pieces of armor to protect you in your travels.  I have a fine pair of [gloves] available now if you're interested.");
	elseif(e.message:findi("glove")) then
		e.self:Say("Great!  Let's start with the gloves then, shall we?  Gloves, yes indeed - I will give them to you if you go out and kill Cht'Thk Bloodlings.  Bring me four Sharp Bloodling Mandibles as proof of your deeds.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("Ah yes, a  Bracer. I'm sure I have one here somewhere.  I'll look for it while you do me a service.  Skeletal Brigands and Hunters have been endangering our young ones, seek them out and bring me four Broken Skulls!");
	elseif(e.message:findi("boots")) then
		e.self:Say("You are doing fine work. I'm so pleased to have met you!  I'm confident you can help me again if you're interested.  The guards have mentioned a problem with Shades roaming too near the city.  I'd like to see if we can do something about that. Go and kill Lesser Shades, and bring me four Shadowed Claws and I will give you some boots as a reward!");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("Have you seen the Loda Kai in your explorations?  They are a great menace, oh very bad indeed!  They're nothing but criminals and brigands, ooooh how I hate them.. Fetch me four Loda Kai earrings and I shall give you some fine sleeves for your trouble!");
	elseif(e.message:findi("cap")) then
		e.self:Say("Excellent work dispatching those Brigands! Now seek out Loda Kai thugs and return with four Insignia, I shall give you a useful cap if you serve me well!");
	elseif(e.message:findi("tunic")) then
		e.self:Say("A breastplate shall complete your set! Bring me four carapaces from Cht'Thk Bloodbulks and I will give you a wonderful tunic!");
	elseif(e.message:findi("pant")) then
		e.self:Say("Hmm, you are growing more mighty as time passes - Kill Saurek Claw Beasts and bring me four fangs, I have most excellent pants if you succeed.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 2476, item2 = 2476, item3 = 2476, item4 = 2476})) then--Broken Brigand Skull  x4
		e.self:Say("Excellent! Here are your Bracer! Would you like to get some [Boots]?");
		e.other:Faction(e.self,1513,15); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2453); --Ghulam Bracer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2460, item2 = 2460, item3 = 2460, item4 = 2460})) then--Sharp Bloodling Mandible  x4
		e.self:Say("Excellent! Here are your Gloves! Would you like to get a [Bracer]?");
		e.other:Faction(e.self,1513,15); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2452); --Ghulam Gloves
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2477, item2 = 2477, item3 = 2477, item4 = 2477})) then--Shadowed Claw  x4
		e.self:Say("Excellent! Here are your Boots! Would you like to get some [Sleeves]?");
		e.other:Faction(e.self,1513,20); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2454); --Ghulam Boots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2478, item2 = 2478, item3 = 2478, item4 = 2478})) then--Loda Kai Earring  x4
		e.self:Say("Excellent! Here are your Sleeves! Would you like to get a [Cap]?");
		e.other:Faction(e.self,1513,25); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2455); --Ghulam Armguards
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2479, item2 = 2479, item3 = 2479, item4 = 2479})) then--Loda Kai Insignia  x4
		e.self:Say("Excellent! Here is your Cap! Would you like to get some [Pants]?");
		e.other:Faction(e.self,1513,25); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2456); --Ghulam Cap
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2480, item2 = 2480, item3 = 2480, item4 = 2480})) then--Saurek Fang  x4
		e.self:Say("Excellent! Here are your Pants! Would you like to get a [Tunic]?");
		e.other:Faction(e.self,1513,20); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2457); --Ghulam Legplates
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 2481, item2 = 2481, item3 = 2481, item4 = 2481})) then--Bloodbulk Carapace  x4
		e.self:Say("Excellent! Here is your Tunic!");
		e.other:Faction(e.self,1513,25); -- Faction: Guardians of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,2459); --Ghulam Tunic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
