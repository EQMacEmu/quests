function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Meat!! You need meat. Me gots meat!! High elf meat, dwarf meat, human meat, [HEHE meat], [froggy legs]. Me got a lot.");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("HEHE meat? It human, Erudite 'n high elf, mashed together. Mmmm. Very tasty!");
	elseif(e.message:findi("froggy legs")) then
		e.self:Say("Froggy legs come from far away. Me get from friend, [Chef Dooga]. It not tasty. Trolls like it. Eat it up much. They eat too much froggy. Me glad [Nerbilik] leave Neriak!! He eat way too much froggy.");
	elseif(e.message:findi("chef dooga")) then
		e.self:Say("Friend in Oggok is Chef Dooga. Chef she is. Used to work in Neriak. She beautiful. She supply the Gobbler with [froglok legs]. They very low now. Fat trolls eat too many!! Me need to [pick up froglok legs].");
	elseif(e.message:findi("pick up froglok legs")) then
		e.self:Say("That good news. Oggok far away. Me got no time to go. If you go speak to Chef Dooga, say you pick up froglok legs. You bring back and me give you coin, maybe even something good.");
	elseif(e.message:findi("nerbilik")) then
		e.self:Say("Big and fat troll Nerbilik is. He leave to fish in tearsy ocean. Me promised to deliver him food or he come bak. The Gobbler needs some dumb person to [deliver grub locker] to Nerbilik.");
	elseif(e.message:findi("deliver grub locker")) then
		e.self:Say("Good. Me wrap order of dwarf pickles in.. HEY!! Me out of special wrapping paper!! Hmm.. Here. Me use dis. Now, <..click.. Locks grub locker> Here. You take to Nerbilik in tearsy ocean and he pay you. No think of opening locker. Only Nerbilik has key.");
		e.other:SummonCursorItem(12203); --Grub Locker
	end
end

function event_trade(e)
	local item_lib = require("items");
	local randrew = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13384})) then -- Preserved Leg
		e.self:Say("Uggh!! Froglok legs!! Me hate smelly legs, but me need it for fat trolls.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,353,5); -- Neriak Ogre
		if(math.random(100) < 20) then
			randrew = eq.ChooseRandom(13386,13385); -- Item(s): Ogre Butcher Gloves (13386), Ogre Meat Cleaver (13385)
		end
		e.other:QuestReward(e.self,0,0,math.random(5),0,randrew,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
