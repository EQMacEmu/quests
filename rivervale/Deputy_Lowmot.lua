function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "!  I am Deputy Lowmot.  In addition to my duties as a deputy, I am also in charge of organizing all of our meals here at the Guardian Stronghold."); 	
	elseif(e.message:findi("nice hat") or e.message:findi("nice mask")) then
		e.self:Say("Thank you. It is worn with pride and is the trademark of the deputies of the Guardians of the Vale.");
	elseif(e.message:findi("farm")) then
		e.self:Say("Tagglefoot's Farm sits in south Rivervale toward the entrance from Kithicor Forest. Will Tagglefoot is the owner and along with the help of his fellow druids, the Storm Reapers, they supply Rivervale with plenty of food.");
	elseif(e.message:findi("kithicor")) then
		e.self:Say("Kithicor Forest can be found past the south entrance near the Chapel of Mischief.");
	elseif(e.message:findi("bank")) then
		e.self:Say("In Rivervale, you will find our vault inside Guardian Stronghold. It will be near the entrance. I believe Donlo Goobler is the teller.");
	elseif(e.message:findi("mischief")) then
		e.self:Say("The Chapel of Mischief would be found toward the south entrance of Rivervale. It is where the Clerics of Mischief hold their services.");
	elseif(e.message:findi("ranger guild") or e.message:findi("druid guild")) then
		e.self:Say("The farmers of Rivervale all congregate at Will Tagglefoot's Farm.");
	elseif(e.message:findi("cleric guild")) then
		e.self:Say("The Priests of Mischief hold their services at the Chapel of Mischief.");
	elseif(e.message:findi("gubbin")) then
		e.self:Say("Mayor Gubbin is our great halfling leader. If you wish to speak with him, he can be found in Guardian Stronghold. It is from there that he dispenses his wisdom.");
	elseif(e.message:findi("king") or e.message:findi("leader") or e.message:findi("mayor")) then
		e.self:Say("Rivervale is governed by Mayor Gubbin.");
	elseif(e.message:findi("misty")) then
		e.self:Say("You will find the Misty Thicket through the west entrance by Guardian Stronghold.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("If I were looking to purchase a fine weapon of superior craftsmanship, I would look to Rantho's Weaponry in Guardian Stronghold.");
	elseif(e.message:findi("kevlin") or e.message:findi("armor")) then
		e.self:Say("Kevlin's Gear is a good place to find armor if you plan on venturing into Kithicor Forest or the Misty Thicket. If you need it, it is located next to the Fool's Gold.");
	elseif(e.message:findi("loom") or e.message:findi("sewing")) then
		e.self:Say("Meeka Diggs in the center of Rivervale behind the Fool's Gold Tavern may be able to provide you with a sewing kit. There is also a loom near where she peddles her goods.");
	elseif(e.message:findi("forge")) then
		e.self:Say("There is a forge at the Tagglefoot's Farm near the vegetable stand and the main house of the farm.");
	end
end

function event_trade(e)
local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13959})) then -- can be done at dubious
		e.self:Say("Oh good!  Hey.  You are not Jillin..  Helping out Blinza huh?  She is quite a woman..  Yes indeed.  Quite a woman..  ah..  Oh sorry.  Here you go.  Thanks again.  Mayor Gubbin will be pleased.");
		e.other:Faction(e.self,263, 1); -- Faction: Guardians of the Vale
		e.other:Faction(e.self,286, 1); -- Faction: Mayor Gubbin
		e.other:Faction(e.self,355, 1); -- Faction: Storm Reapers
		e.other:Faction(e.self,292, 1); -- Faction: Merchants of Rivervale
		e.other:Faction(e.self,334, -1); -- Faction: Dreadguard Outer
		e.other:QuestReward(e.self,math.random(5),math.random(2),0,0,0,10);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:rivervale  ID:19110 -- Deputy_Lowmot 
