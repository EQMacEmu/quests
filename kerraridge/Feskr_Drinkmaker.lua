function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("Hail")) then
			e.self:Say("Erh?  If you not be here to help Feskr with his [problem] then Feskr want you to leave.");
		elseif(e.message:findi("what problem")) then
			e.self:Say("You wish to help?  Orrderrr of supplies I rrequest not arrive; ship sink.  Now Feskr needs supplies.  Feskr need bottle of Tunare's Finest. thunderhoof mushroom. tea leaf. and handmade backpack.  Rrrr. strange items but Feskr need to sell.  You bring. Feskr give you nice bag.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end		
end
	
function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12360, item2 = 14914, item3 = 14915, item4 = 17969})) then
		e.self:Say("Ahhh. This will help. Many Kerrans will like these. Here. Take this old bag. I have too many. Maybe it help you.");
		e.other:Faction(e.self,382,5); -- Faction: Kerra Isle
		e.other:QuestReward(e.self,0,0,0,0,17032,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:kerraridge  ID:74076 -- Feskr_Drinkmaker
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
