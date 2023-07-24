function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome you. You look all skin 'n bones. Eat you must do. Chef Dooga can fix up goodies for you. Try [HEHE meat].");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("It is a secret ground meat made with high elf, human, and Erudite Flesh. Mmmm. It good stuff. Dooga make it and [the Gobbler] make it. If you find any of those meats in the swamps bring to me and I pay you.");
	elseif(e.message:findi("gobbler")) then
		e.self:Say("You no hear of the Gobbler!! Him great butcher. Have all kinds of meat. Him am low on froglok legs. Dooga supply him. Dooga need someone to [deliver froglok legs].");
	elseif(e.message:findi("recipe")) then
		e.self:Say("Recipe, recipe, recipe!  All want Chef Dooga's recipes.  Me no give out secrets.  Only HEHE meat recipe me share.  Me share that only wit [the Gobbler].");
	elseif(e.message:findi("apron")) then
		e.self:Say("Apron?! Me gots aprons, but dey no grow on trees. You bring Dooga proof you a butcher first. You makes me three portions of pickled froglok then me allow you to also pay me ten gold for apron.");
	elseif(e.message:findi("froglok legs")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You think so!! That be good thing. Make the Gobbler happy. Maybe he give you something good. Maybe not. You take this. Deliver meat.");
			e.other:SummonCursorItem(13384); -- Item: Preserved Leg
		else
			e.self:Say("Come closer. Bouncer smash your head!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Chef Dooga asks for three pickled frogloks and ten gold pieces for da ogre butcher apron.";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13364})) then -- Human flesh
		e.self:Say("MmmmMmm. Human make good meat pies. Here. A little coins for you.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,228,2); 	--Clurg
		e.other:Faction(e.self,274,-2);	--Kazon Stormhammer
		e.other:Faction(e.self,232,2); 	--Craknek Warriors
		e.other:Faction(e.self,261,2); 	--Green Blood Knights
		e.other:Faction(e.self,337,2); 	--Oggok Gaurds			
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,0,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13365})) then -- High Elf flesh
		e.self:Say("High elf!! Now that is a good meat.  Goes good with Ogre Swill.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,228,2); 	--Clurg
		e.other:Faction(e.self,274,-2);	--Kazon Stormhammer
		e.other:Faction(e.self,232,2); 	--Craknek Warriors
		e.other:Faction(e.self,261,2); 	--Green Blood Knights
		e.other:Faction(e.self,337,2); 	--Oggok Gaurds		
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,0,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13452, item2 = 13452, item3 = 13452, platinum = 1},1,text)) then
		e.self:Say("Here is da ogre butcher apron. Gos and cook.")
		-- Confirmed Live Factions
		e.other:Faction(e.self,228,5); 	--Clurg
		e.other:Faction(e.self,274,-5);	--Kazon Stormhammer
		e.other:Faction(e.self,232,5); 	--Craknek Warriors
		e.other:Faction(e.self,261,5); 	--Green Blood Knights
		e.other:Faction(e.self,337,5); 	--Oggok Gaurds		
		e.other:QuestReward(e.self,0,0,0,0,12217,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
