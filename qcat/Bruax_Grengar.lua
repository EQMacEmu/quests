function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail " .. e.other:GetCleanName() .. ". I am Bruax Grengar, master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the [sorcerous arts]. If you a practitioner of a sorcerous art I can give you instructions to obtain an [outfit and robe] that will assist you in your work. Once you have been properly outfitted I will also assist you in acquiring a [Staff of the Bloodsabers].");
		elseif(e.message:findi("sorcerous arts")) then
			e.self:Say("I speak of those who practice the sorcerous arts other than necromancy: the arts of Enchantment, Magery, and Wizardry. It is a common misnomer proclaimed by those uneducated to the ways of the Plague Bringer that only Shadowknights and Necromancers serve Bertoxxulous. In fact this temple alone has members from all walks of life, from tailors, scholars, and blacksmiths to warriors and sorcerers.");
		elseif(e.message:findi("outfit and robe")) then
			e.self:Say("I have prepared this special curing kit for the crafting of an outfit and robe. The materials required for each article of clothing vary. Do you desire to craft a [scourge sorcerer cap], [scourge sorcerer wristband], [scourge sorcerer gloves], [scourge sorcerer boots], [scourge sorcerer sleeves], [scourge sorcerer pantaloons], or [scourge sorcerer robe]?");
			e.other:SummonCursorItem(17125); -- Item: Curing Kit
		elseif(e.message:findi("cap")) then
			e.self:Say("To craft a Scourge Sorcerer Cap you will require two [silk thread], klicnik drone bile, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Cap Pattern.");
			e.other:SummonCursorItem(19555); -- Item: Tattered Cap Pattern
		elseif(e.message:findi("wristband")) then
			e.self:Say("To craft a Scourge Sorcerer Wristband you require a [silk thread], klicnik drone bile, and a king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Wristband Pattern.");
			e.other:SummonCursorItem(19558); -- Item: Tattered Wristband Pattern
		elseif(e.message:findi("glove")) then
			e.self:Say("To craft Scourge Sorcerer Gloves you require two [silk thread], klicnik drone bile, two giant field rat whiskers, and a large king snake skin. Once you have the necessary components combine them in your Curing Kit with this Tattered Glove Pattern.");
			e.other:SummonCursorItem(19559); -- Item: Tattered Glove Pattern
		elseif(e.message:findi("boot")) then
			e.self:Say("To craft Scourge Sorcerer Boots you require two [silk thread], klicnik drone bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Boot Pattern.");
			e.other:SummonCursorItem(19561); -- Item: Tattered Boot Pattern
		elseif(e.message:findi("sleeve")) then
			e.self:Say("To craft Scourge Sorcerer Sleeves you require two [silk thread], klicnik warrior bile, and two large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Sleeves Pattern.");
			e.other:SummonCursorItem(19557); -- Item: Tattered Sleeve Pattern
		elseif(e.message:findi("pantaloon")) then
			e.self:Say("To craft Scourge Sorcerer Pantaloons you require two [silk thread], klicnik warrior bile, and four large king snake skins. Once you have the necessary components combine them in your Curing Kit with this Tattered Leggings Pattern.");
			e.other:SummonCursorItem(19560); -- Item: Tattered Pant Pattern
		elseif(e.message:findi("robe")) then
			e.self:Say("To craft a Scourge Sorcerer Robe you will require three [silk thread], klicnik noble bile, two giant king snake skins, and a giant whiskered bat fur. Once you have the necessary components combine them in your Curing Kit with this Tattered Robe Pattern.");
			e.other:SummonCursorItem(11395); -- Item: Tattered Robe Pattern
		elseif(e.message:findi("staff of the bloodsabers")) then
			e.self:Say("A Staff of the Bloodsabers is a useful implement for young sorcerers dedicated to Bertoxxulous the Plague Lord. I will assist you in the creation of a staff but first you must complete a task for me. The sorcerers of The Order of Three are supporters of Antonius Bayle IV, the haughty ruler of Qeynos. They lend magical aid to the Knights of Thunder and Priests of Life to identify and capture members of the Bloodsabers. A rather troublesome member of The Order of Three, Larkin Tolman, has recently been spotted at a settlement in the Western Plains of Karana. Find this Larkin Tolman and bring me his head.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Hail " .. e.other:GetCleanName() .. ". I am Bruax Grengar, master necromancer of the Bloodsabers. I assist not only young necromancers with their training but also aid all those Bloodsabers who have chosen to practice the sorcerous arts.");	-- made up text
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20204})) then
		e.self:Say("Well done. The Bloodsabers have many enemies within the city of Qeynos and its surrounding regions. You must exercise much caution when not within the safety of our temple here in the Qeynos Catacombs. Take this Rough Bloodsaber Staff and when you have gathered a Giant King Snake Skin, two Gnoll Fangs, and a Giant Fire Beetle Eye, return them to me with this staff and I will complete its construction.");
		e.other:Faction(e.self,221,10); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupted Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,20203,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 20203, item3 = 19946, item4 = 13251})) then
		e.self:Emote("smooths the shaft of the staff, fashions a grip from the giant king snake skin, secures the giant fire beetle eye in a metal fixture and attaches it to the top of the staff. 'Here is your Staff of the Bloodsabers young Scourge Sorcerer. Go now and spread the disease!");
		e.other:Faction(e.self,221,5); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-1); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupted Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,20264,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45065 -- Bruax_Grengar
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
