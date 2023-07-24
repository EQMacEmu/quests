function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What you want?!! Face so ugly you scare fish away!! ..sniff, sniff. Smell so bad, too!! Me sure is hungry. Wish had [grub locker].");
	elseif(e.message:findi("grub locker")) then
		e.self:Say("You gots grub locker!! Give to me. Me sick of fish and not many dwarves fall off ship. Me pay a plat to get me grub locker from the Gobbler in Neriak. Go to him and say you [deliver grub locker] if you wants one plat.");
	elseif(e.message:findi("wrapper") or e.message:findi("recipe")) then
		e.self:Say("You no get my wrapper!  Me use it later when me needs to make more room in stomach!  You never get it!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12203})) then -- Grub Locker
		e.self:Say("Oooh!! Grub locker! There is a loud click. He opens the locker and unwraps dwarf pickles. What this dumb wrapper? R, E, C, I, P, E.. Ahh!! It say pickles!! Me read good. Here your plat. Me give you little more. Me was very hungry for pickles.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,235,10); --Da Bashers
		e.other:Faction(e.self,222,-1); --Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,2,0,1500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
