-- Test of Illusion - enchanter epic quest - staff of the serpent
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The hidden self inside a myriad of magic is one that walks quite softly. Yes, that is what you must seek.");
	elseif(e.message:findi("ready")) then
		e.self:Say("Scattered throughout the world are various items. To prove your worth, go collect these and return them to me. The Xolion Rod, Innoruuk's Word, Chalice of Kings, and snow blossoms.");
	elseif(e.message:findi("chalice of kings")) then
		e.self:Say("The Chalice of Kings is the chalice of elven kings. Previously thought to be lost to the ages, it was recently discovered. I need its magical powers to create a magical liquid.");
	elseif(e.message:findi("xolion rod")) then
		e.self:Say("This is the rod of an ancient civilization found on this continent. Nothing is known of it other than that the scaled ones discovered it years ago.");
	elseif(e.message:findi("snow blossoms")) then
		e.self:Say("These are flowers that are also used in the creation process. They were once widespread, but now I am told they only grow in select places.");
	elseif(e.message:findi("innoruuks word")) then
		e.self:Say("The strict doctrine of the priests of Innoruuk is used as a material component in the crafting. The power of their hate must not be underestimated.");
	elseif(e.message:findi("sack")) then
		e.self:Say("Before I provide the item, you must show me that you have spoken to Jeb.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10604})) then -- Item: Jeb's Seal
		e.self:Say("Ah yes, Jeb's seal. The time to craft a Serpent must have come. I will need components collected to craft the first of the pieces. I will also provide you with a sack in which you must combine the items. Are you ready to collect them?");
		e.other:QuestReward(e.self,{items = {17861,10604}});
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10635})) then
		e.self:Say("Excellent, you have done well. Here is the first piece of the staff. Now you must go seek out the second master; he will clear the path for you.");
		e.other:Faction(e.self,404,100); -- Faction: True Spirit
		e.other:QuestReward(e.self,0,0,0,0,10610,100000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
