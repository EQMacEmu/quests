--Sentry_Ferin.pl
--Champion of the Vah Shir

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". Pardon, but I've no time for chit chat, the [poachers] never rest.");
	elseif(e.message:findi("poachers")) then
		e.self:Say("Some of the Loda Kai heathens have seen fit to trade in the pelts of our felidae cousins. It disgusts me to think what they are doing with the hides of the proud cats of this land. Were there only adventurers brave enough to [champion their cause]...");
	elseif(e.message:findi("champion their cause")) then
		e.self:Say("Fighting for the honor of our cause is no small undertaking. Go and hunt down this cowardly lot. Take back from them what they have stolen and fill this casket so that the fallen cats might be honored properly.");
		e.other:SummonCursorItem(17891);--Venerated Cask
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30852})) then --Sealed Cask
		e.self:Say("You are truly a friend to the Felidae. Take this shroud as a small token of the honor you have done to our people - it is just a small step towards becoming a champion among our people.");
		e.other:Faction(e.self,1513, 8);--Guardians of Shar Vahl faction
		e.other:QuestReward(e.self,0,0,0,0,30854); --Hero's Shroud
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
