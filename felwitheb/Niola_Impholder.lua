function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("fetch")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.count_handed_item(e.self, e.trade, {13068}, 4) > 0) then
		e.self:Say("Ah yes.  These are exactly what I need.  Thank you very much.");
		e.other:Faction(e.self,275,2,0); -- Faction: Keepers of the Art
		e.other:Faction(e.self,279,1,0); -- Faction: King Tearis Thex
		e.other:Faction(e.self,246,1,0); -- Faction: Faydarks Champions
		e.other:Faction(e.self,239,-1,0); -- Faction: The Dead
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,{itemid = eq.ChooseRandom(15310,15310,15310,15310,15310,15310,15310,15310,15310,15332),exp = 20}); -- Item(s): Spell: Flare (15310), Spell: Shield of Fire (15332)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18777},0)) then -- Enrollment Letter
		e.self:Say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild tunic. You have much to learn, so let's get started.");
		e.other:Faction(e.self,275,100,0); -- Keepers of the Art
		e.other:Faction(e.self,279,25,0); -- King Tearis Thex
		e.other:Faction(e.self,246,15,0); -- Faydark's Champions
		e.other:Faction(e.self,239,-25,0); -- The Dead
		e.other:QuestReward(e.self,0,0,0,0,13592,20); -- Faded Training Robe*
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18902})) then
		e.self:Say("What? Not as supposed? What can he... Well, that's all well and good. You, I assume, wish a reward for your 'valiant work'? Well, here you go, adventurer.");
		e.other:QuestReward(e.self,0,0,0,0,1307,500); -- Item: Gossamer Robe
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder
