function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Lodge of the Dead. May you serve our Queen with the bleeding of others.");
	elseif(e.message:findi("befallen")) then
		e.self:Say("It is true that the return of Marnek could create difficulties for us, especially if this has the blessing of Solusek Ro himself. Therefore, I command you to deliver to me any further information you uncover regarding the plans of the Burning Dead, and likewise I order you to return here at my bidding for further instructions in this matter. Now, begone.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18474})) then
		e.self:Say("Very interesting, servant of the Queen. This deed has stayed my wrath for this interruption of my business. Where did you find this?");
		e.other:Faction(e.self,239,1); -- Faction: The Dead
		e.other:Faction(e.self,303,1); -- Faction: Queen Cristanos Thex
		e.other:Faction(e.self,278,-3); -- Faction: King Naythox Thex
		e.other:Faction(e.self,275,-3); -- Faction: Keepers of the Art
		e.other:Faction(e.self,245,-3); -- Faction: Eldritch Collective
		e.other:Faction(e.self,1522,-3); -- Faction: Primordial Malice
		e.other:QuestReward(e.self,0,8,0,0,0,6400);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 31492})) then
		e.self:Say("Ha ha ha ha! Oh the poor steed of a noble paladin! Bah, it will find no rest yet. I who can command the spirits of the dead demand it serve you once again.");
		e.other:Faction(e.self,239,1); -- Faction: The Dead
		e.other:Faction(e.self,303,1); -- Faction: Queen Cristanos Thex
		e.other:Faction(e.self,278,-3); -- Faction: King Naythox Thex
		e.other:Faction(e.self,275,-3); -- Faction: Keepers of the Art
		e.other:Faction(e.self,245,-3); -- Faction: Eldritch Collective
		e.other:Faction(e.self,1522,-3); -- Faction: Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,31496,6400);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18758})) then --Tattered Note
		e.self:Say("Just what I need in this outfit, another waste of flesh. Here, put this on. Go bother Noxhil for a while - I'm sure he has some menial task for you.  You'd better prove yourself of value to me. I hear I can get a few plat for the skull of an idiot on the black market, and I could make a fortune from your type. Now, get outta here!");
		e.other:Faction(e.self,239,100); --The Dead
		e.other:Faction(e.self,303,15); --Queen Cristanos Thex
		e.other:Faction(e.self,278,-15); --King Naythox Thex
		e.other:Faction(e.self,275,-15); --Keeper of the Art
		e.other:Faction(e.self,245,-15); --Eldritch Collective
		e.other:Faction(e.self,1522,-200); --Primodial Malice
		e.other:QuestReward(e.self,0,0,0,0,13587,20);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
