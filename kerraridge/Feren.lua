-- Razortooth

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("Hail")) then
			e.self:Say("Rarr.  Me is Feren.  Me is fisher.  That means Feren catches [fish].");
		elseif(e.message:findi("what fish")) then
			e.self:Say("All kinds of fish.  Tasty fish.  All day Feren catches the fishes so all Kerran can eat.  I do for good of all Kerran.  Rrrrr.  One thing bother Feren always though.  Is bad fish.  [Razortooth].");
		elseif(e.message:findi("what razortooth")) then
			e.self:Say("Rrrrrr!  Razortooth mean fish.  Razortooth eat fish off Feren's line.  Razortooth gnaw Feren's boat.  Razortooth smart and dangerous.  Feren never able to catch Razortooth.  This haunt Feren for months.  If you was able to catch Razortooth. Feren be forever grateful. Maybe even give you possessions.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6348})) then --Razor Tooth
		e.self:Say("Rarr, Feren not haunted by Razortooth no more. Feren grateful and give you this possession.");
		e.other:Faction(e.self,382,10); -- Kerra Isle
		e.other:QuestReward(e.self,0,0,0,2,1062,500); --Kerran Fishingpole
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

--END of FILE Zone:kerraridge  ID:74088 -- Feren
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
