function event_spawn(e)
	eq.set_timer("wish",3000000);
end

function event_timer(e)
	e.self:Say("Errrrrmf. If only just that [wish] for Urrkath?");
end

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("hail")) then
			e.self:Say("Errr? What you say to Urrrkath? Ah. Hello to you as well, furrrless type person.");
		elseif(e.message:findi("wish")) then
			e.self:Say("Wish? Oh. Urrkath old kerran. Urrkath pass on soon. It great disappointment that Urrkath never see beautiful forest of elves. Now all Urrkaath want is sylvani leaf from elf forest. So me can see at least little part of forest.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1155})) then
		e.self:Say("Errr? This is.. this is silvani leaf! Rrrrrr.. So nice. This means much to Urrkath, furrrless one. Please, take this for such kind work.");
		e.other:Faction(e.self,382,5); -- Faction: Kerra Isle
		e.other:QuestReward(e.self,0,0,0,0,2045,500);
	end
end

--END of FILE Zone:kerraridge  ID:74090 -- Urkath_Greyface 
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------