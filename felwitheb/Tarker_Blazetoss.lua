function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Hail and well met, " .. e.other:GetCleanName() .. "!  Have you come to study, or can you [perform a task] for me this day?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("perform a task")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("That is the spirit.  There are many black wolves wandering Faydark these days.  One of my brethren needs a black wolf skin as a component for his magic.  Bring me a black wolf skin, and I shall reward you for your efforts."); 
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18779})) then -- Enrollment Letter
		e.self:Say("Welcome to the wizards' guild of the Keepers of the Art. My name's Tarker, and I run this guild. You've got a lot of training ahead of you, so let's get started. Here, take this - it's our guild tunic. Wear it with honor, friend.");
		e.other:Faction(e.self,275,100,0); -- Keepers of the Art
		e.other:Faction(e.self,279,25,0); -- King Tearis Thex
		e.other:Faction(e.self,246,15,0); -- Faydark's Champions
		e.other:Faction(e.self,239,-25,0); -- The Dead
		e.other:QuestReward(e.self,0,0,0,0,13594,20); -- Singed Training Robe*
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13758})) then
		e.self:Say("This is just what I needed.. and with hardly a mark on it! You have my thanks. Here is a something that you might find useful.");
		e.other:Faction(e.self,275,1); -- Keepers of the Art
		e.other:Faction(e.self,279,1); -- King Tearis Thex
		e.other:Faction(e.self,246,1); -- Faydark's Champions
		e.other:Faction(e.self,239,-1); -- The Dead
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(7007,13009,6012,15374,10004,6018,10008),350); -- Item(s): Rusty Dagger (7007), Bandages (13009), Worn Great Staff (6012), Spell: Numbing Cold (15374), Copper Band (10004), Cracked Staff (6018), Gold Ring (10008)
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss
