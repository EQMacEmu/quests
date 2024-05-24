function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my humble shop. I offer fine items fashioned from the skins of the beasts of Everfrost. Leather is my specialty and I can always use [extra hides].");
	elseif(e.message:findi("extra hides")) then
		e.self:Say("I will offer any hunter some used Tattered Armor for every Polar Bear Skin. I am sure that even you can wrestle the skins from the back of a polar bear cub.");
	elseif(e.message:findi("second job")) then
		e.self:Say("I have seen the warriors bringing in items called Wrath Orc Wristbands. Apparently they find them upon the lifeless bodies of the snow orc troopers. They are made from a skin I have yet to find. I will gladly reward you with either a Rawhide Tunic or Leggings or even perhaps Leather Gloves. All I ask for are Two Wrath Orc Wristbands.");
	elseif(eq.is_the_ruins_of_kunark_enabled() and e.message:findi("mammoth hide parchment")) then -- can be done at dubiously
		e.self:Say("Jinkus must've sent ye fer some more mammoth hide parchment fer his posters. Here, take it, free o' charge, as a donation to teh church and to the will o' the Tribunal as well");
		e.other:SummonCursorItem(12621); 							--Mammoth Hide Parchment
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "No reward until I've got TWO wrath orc wristbands!";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13761})) then -- can be done at dubiously
		e.self:Say("This is much apprreciated! Please accept this used armor in return and a gold piece as well, fer yer troubles. Ye've done well! I may have a [second job] fer ye, if ye like?");
		-- Confirmed Live Factions
		e.other:Faction(e.self,328, 5); -- Faction: Merchants of Halas
		e.other:Faction(e.self,320, 3); -- Faction: Wolves of the North
		e.other:Faction(e.self,327, 3); -- Faction: Shamen of Justice		
		e.other:QuestReward(e.self,0,0,math.random(5),0,eq.ChooseRandom(2131, 2134, 2127, 2126, 2129, 2125, 2133),1000); -- Item(s): Large Tattered Belt (2131)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12223, item2 = 12223},1,text)) then -- can be done at dubiously
		e.self:Say("Fine work hunter!  As your reward please accept this item which I have fashioned for you.");
		-- Confirmed Live Factions		
		e.other:Faction(e.self,328, 10); -- Faction: Merchants of Halas
		e.other:Faction(e.self,320, 7); -- Faction: Wolves of the North
		e.other:Faction(e.self,327, 7); -- Faction: Shamen of Justice		
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(2034, 2171, 2164),1000); -- Item(s): Large Leather Gloves (2034)
	end	
	item_lib.return_items(e.self, e.other, e.trade)	
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
