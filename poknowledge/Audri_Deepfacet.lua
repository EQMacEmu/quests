--------------------------
--Quest Name:Turnin NPC for one Armor Task given by Castlen Drewe
--Author: Domel
--NPCs Involved: 2 [Castlen Drewe(202294) and Audri Deepfacet(202069)]
--Items Involved: 1 Permafrost Crystals(22121)
----------------------------------
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. traveler. and welcome to New Tanaan. You will find that there is much to be gained in the way of knowledge here. Knowledge not only of the mind. but of skill. I am an adept jeweler and have offered my services to the city to repay its gracious host to me over the years. Please. feel free to search my inventory and purchase that which you might fancy.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 22121})) then--Permafrost crystal
		e.self:Say("It is so lovely, just as I saw before! I believe I can fashion something quite nice for you out of it. I need only a chip to study for myself. Thanks so much! ");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
