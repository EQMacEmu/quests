-- Quest for Darkforge Gauntlets/Greaves/Boots

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Away from this place of torment!  Make haste and flee before you, too, share my [gruesome fate]!!");
	elseif(e.message:findi("gruesome fate")) then
		e.self:Say("I was once a proud shadowknight, but failed I did in my master's quest.  I was sent into a lizard fortress deep in the swamplands.  I was to seek out an ancient item for my master.  I failed and was captured. The lizards stripped me of my [darkforge armor] and planned to boil me alive.  Before they could do so, I escaped.  Upon my return to my master's lair I found myself in a [worse predicament].");
	elseif(e.message:findi("worse predicament")) then
		e.self:Say("I was torn apart by my master and my bones were given as toys to my master's associates!!  I am now only half Grandyf the Vile.  My hands, feet and legs were sent here and assembled with spare bones of other unfortunates.  Since this is the case, I can only [create darkforge armor] in the form of boots, greaves and gauntlets.");
	elseif(e.message:findi("create darkforge armor")) then
		e.self:Say("I and I alone have the power to create darkforge armor!!  It was crafted for me so naturally it is to be worn by shadowknights only.  My armor was taken by the lizardman crusaders.  Unfortunately for them, it lost all power and cannot be worn.  I would be glad to see it put to good use. Do you [seek the darkforge armor]?");
	elseif(e.message:findi("seek the darkforge armor")) then
		e.self:Say("Darkforge gauntlets require both of my decayed gauntlets and one enchanted platinum bar.  For the darkforge greaves, I will need both decayed legplates and two pieces of melatite from the Solusek Mining Company.  For the boots, I need both my decayed boots and two parts of fairy dust.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Two portions of fairy dust and the right and left decayed boots!!";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12292, item2 = 12291, item3 = 16507})) then
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", here is your reward.");
		e.other:QuestReward(e.self,0,0,0,0,3144,5000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12294, item2 = 12293, item3 = 12297, item4 = 12297})) then
		e.self:Say("You have been granted the darkforge greaves!!");
		e.other:QuestReward(e.self,0,0,0,0,3145,5000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12296, item2 = 12295, item3 = 12106, item4 = 12106},1,text1)) then
		e.self:Say("You may now wear the darkforge boots!!");
		e.other:QuestReward(e.self,0,0,0,0,3146,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Updated and corrected by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
