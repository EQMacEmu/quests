function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("hail")) then
			e.self:Say("Rrrr..I am  Asad. Shazda of the Kerran [Sejah]. It is my duty to ensure the safety of what lands have not been taken from us by the Erudites. and to train my soldiers in the fighting styles of our heritage.");
		elseif(e.message:findi("sejah")) then
			e.self:Say("The soldiers of our sejah are all trained from the time they are weaned from their matriarchs. If you wish to be honored by the sejah you must prove to us your loyalty and devotion to the defense of our lands. In Toxxulia Forest there are Erudite emissaries who constantly attempt to encroach upon our territory. Bring me the head of one such emissary.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12319})) then
		e.self:Say("Excellent work, young ayyar! You have proven your willingness to dispose of the enemies of our tribe, now you must face one of their most murderous sentries! Bring me the head of Sentinel Creot and I shall induct you into our sejah!");
		e.other:Faction(e.self,382,20); -- Faction: Kerra Isle	
		e.other:QuestReward(e.self,0,6,0,0,10343,5000);
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12438})) then
		e.self:Say("You have proven your devotion to our cause and defeated one of the greatest threats to our people. I welcome you into the Kerran Sejah. Wear this bracer as a symbol of your station in the Kerran tribes.");
		e.other:Faction(e.self,382,55); -- Faction: Kerra Isle
		e.other:QuestReward(e.self,0,0,0,5,3147,6500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:kerraridge  ID:74012 -- Shazda_Asad
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
