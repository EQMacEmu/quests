function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("Hail")) then
			e.self:Say("What?  What do you want. furless?  My tseq. Graalf. lies sick and you waste time with talk when you [cannot help].");
		elseif(e.message:findi("cannot help")) then
			e.self:Say("The shamans. they have said I need [talismans] to ward the sickness from Graalf.");
		elseif(e.message:findi("talisman")) then
			e.self:Say("Errr?  You wish to help?  We will see.  I need a tiger's skin. from a tigerrr not of ourrr village. for its brave spirit. an aviaks charm. and a giant snake fang for the poison that can be made into an antidote.  If you truly intend to help. then good speed and hurry!");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end
	
function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 7005, item2 = 13737, item3 = 13762})) then
		e.self:Say("I cannot believe. Thank you. Please, take this talisman. I bought from wandering shaman but it no help Graalf, maybe it help you. Now please go, Errrak must see if this will help Graalf.");
		e.other:Faction(e.self,382,5); -- Faction: Kerra Isle	
		e.other:QuestReward(e.self,0,0,0,0,10139);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:kerraridge  ID:74080 -- Errrak_Thickshank
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
