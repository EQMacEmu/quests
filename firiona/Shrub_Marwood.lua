-- Handy Shillelagh & Beguile Plants
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("brushes pollen off of his tunic. 'Aachoo!! Oh!! Hello. Please look around. Unless you are a [druid looking for work].'");
		e.self:DoAnim(55);
	elseif(e.message:findi("druid looking for work")) then
		e.self:Say("Good. I need a stout adventurer to go to the wilds and find me a few items. I need some tump stumps - one Kromdul and one Kromdek type. I also need a mantrap root. Get me those three things and I will give you this handy shillelagh I found in the forest.");
		e.self:DoAnim(48);
	elseif(e.message:findi("fertile crop")) then
		e.self:Say("Looking to get hold of my family druid spell, ehh? It doesn't come without a price. Lucky for you all I need is for you to run a small errand for me. Go fetch me a Sarnak farsight crystal, some Sarnak nightdust, some strathebone heal silk and some powder of Tsu. Do that and I will give you a copy of my family secret.");
		e.self:DoAnim(60);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "Hey!! Trying to pull a fast one?!! I said I wanted tump stumps of Kromdek and Kromdul type and a mantrap root!!";		
	local text2 = "If you want the [Fertile Crop] druid spell, I must insist that you complete your small task.";	

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12960, item2 = 12955, item3 = 12958},1,text1)) then
		e.self:Emote("tosses the mantrap root out the window.. SPLASH!! 'I made a mistake. I didn't need that one. Here is the shillelagh I told you about. I found it in some burned out woods far from here. I cleaned it up and found it had a spark of mana so I had it enchanted with a few charges of my spell, [Fertile Crop]. Hope you like it.'");
		e.other:Faction(e.self,248,5); --inhabitants of firiona
		e.other:Faction(e.self,326,3); --emerald warriors
		e.other:Faction(e.self,312,3); --storm guard
		e.other:Faction(e.self,441,-1); --legion of cabilis
		e.other:Faction(e.self,313,-1); --pirates of gunthak
		e.other:QuestReward(e.self,0,0,0,0,12953,25000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 11579, item2 = 12753, item3 = 12957, item4 = 12959},1,text2)) then
		e.self:Say("Great work! I wish I had the coin to hire you on permanently. Maybe I will, when I find the lost trade city of Torsis. Here is the spell I copied for you. Careful, the ink is still drying.");
		e.other:Faction(e.self,248,5); --inhabitants of firiona
		e.other:Faction(e.self,326,3); --emerald warriors
		e.other:Faction(e.self,312,3); --storm guard
		e.other:Faction(e.self,441,-1); --legion of cabilis
		e.other:Faction(e.self,313,-1); --pirates of gunthak
		e.other:QuestReward(e.self,0,0,0,0,12954,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
