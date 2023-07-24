function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Aagggh..  Get away from here..  Go, run..  Far away..  Or I shall call [Karana's] wrath upon you!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("karana")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Heh!..  Ignorant one!  Begone, and take your stupidity with you!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Hey..  wow..  Now THESE are some good, meaty ears..  These will make one great rat ear pie..  Tell ya what, kid..  bring me a few more o' these beauties, and I'll give you my secret recipe for cooking 'em.";

	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13072})) then
		e.self:Say("Ahh yes..  These are a little small, but still some good eating, if you know how to cook 'em of course..   Here ya go, enjoy and may Karana keep your fields lush and green.");
		-- Confirmed Live Faction and Experience
		e.other:Faction(e.self,220,5); -- Arcane Scientists
		e.other:Faction(e.self,281,1); -- Knights of Truth
		e.other:Faction(e.self,296,-1); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:QuestReward(e.self,{itemid = 13719,exp = 100}); -- Item: Grilled Rat Ears
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13719})) then
		e.self:Say("Wha?..   Ah, I guess it's a bit of an acquired taste..  Oh well, your loss..  Here, take this..  They ain't no ears, but it's the least I could do..   And if ya find any more rat ears, good ol' Rephas here will be glad to take 'em off your hands for ya!");
		-- Confirmed Live Faction and Experience
		e.other:Faction(e.self,220,5); -- Arcane Scientists
		e.other:Faction(e.self,281,1); -- Knights of Truth
		e.other:Faction(e.self,296,-1); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:QuestReward(e.self,{itemid = eq.ChooseRandom(1038,13076,15041,15208,15205),exp = 100}); -- Item: Fish Scales, Tattered cloth sandals, Spell: Weaken, Spell: Lull, Spell: True North
	elseif(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13050,item2 = 13050,item3 = 13050},1,text)) then
		e.self:Say("Wow!..  How big was the dang varmint that these come off of?!  Bigger'n a ol' grizzly, I bet!  You've earned this, my friend!  It's my own secret recipe for rat ear pie..  sure is tasty, easy to make, and keeps your belly full while you're running about in the hills and such.  Take care, and may Karana keep your path clear and our lakes full.");
		-- Confirmed Live Faction and Experience
		e.other:Faction(e.self,220,5); -- Arcane Scientists
		e.other:Faction(e.self,281,1); -- Knights of Truth
		e.other:Faction(e.self,296,-1); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:QuestReward(e.self,{itemid = 18103,exp = 140}); -- Item: Rat Ear Pie
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 27428,item2 = 27429,item3 = 27430})) then
		e.self:Say("These were the exact pages I was missing. I have been compiling this research for Juegile. It is now finished so please bring this book to him. Thank you!");
		-- Confirmed Live Faction and Experience
		e.other:Faction(e.self,220,10); -- Arcane Scientists
		e.other:Faction(e.self,281,2); -- Knights of Truth
		e.other:Faction(e.self,296,-1); -- Opal Dark Briar
		e.other:Faction(e.self,330,-1); -- Freeport Militia
		e.other:QuestReward(e.self,{itemid = 27431,exp = 500}); -- Item: An Enchanted Book
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

