
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Away from carver Cagrek you get!! Me's a busy troll. Must punish enmees of Grobb and feeds trolls a plenty. Trolls complain meats no good, complains dey want sum special bread. Dey says dey hears ogres have special meat which taste better den pris'ners of Grobb. Do you knows name of meat? What kinda [meat] dat be? Tell me!!");
	elseif(e.message:findi("fungus dung pie")) then
		e.self:Say("Oh nos! Him wants anudder wun?! Me just maked wun fer him! Yooz gos ta swamp and gets carver Cagrek four spore mushrooms. Be carefuls. Dey easy ta bash, buts sumtimes yooz bash dem too gud and dey falls aparts. Gets me four and me can make pie.");
	elseif(e.message:findi("oven mitten")) then
		e.self:Say("Oven mittens?! Whut you need for? You no cook! If you be tinkin you a cook me will gives you oven mittens, but first you brings me tree, not wun or too, but tree froglok meats and also gives me ten gold. You do dis den you get Grobb oven mittens.");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("HEHE meat!! What dat stand for? Mes need some of dis HEHE meat!! Gos and get me some. Cagrek not just want some. Cagrek want more dan twenny!! Cagrek want three HEHE meat and mes want HEHE recipe. You get and me makes " .. e.other:GetCleanName() .. " honeraree carver. Me gives you Grobb Cleaver. It cuts skins like dey butter!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Me needs FOUR spore mushrooms.";
	local text1 = "Yous a maroon or what! Me says bring back THREE HEHE meat and HEHE recipe!";
	local text2 = "You want oven mittens den you gives me THREE froglok meats and TEN gold.";
	
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 12191, item2 = 12191, item3 = 12191, item4 = 12191},1,text)) then
		e.self:Say("Gud werk! Me already made, err, founds dung part of meal. Here we go. One fungus dung pie! Enjoys.");
		e.other:Faction(e.self,235,5); --Da Bashers
		e.other:Faction(e.self,222,-1); --Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,0,12210,5000); -- Fungus Spore Pie
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 13409, item2 = 13409, item3 = 13409, gold = 10},1,text2)) then
		e.self:Say("Bouts time you gets everyting! Here is you Grobb oven mittens. Dey good to keep you from hot stuff.");
		e.other:Faction(e.self,235,2); --Da Bashers
		e.other:Faction(e.self,222,-1); --Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,0,12211,5000); -- Grobb Oven Mittens
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 13368, item2 = 13368, item3 = 13368, item4 = 18940},1,text1)) then
		e.self:Say("Finally!! What takes yous so long? Now carver Cagrek try and makes meat and feeds to trolls. Yous getting to be deputy carver. Mes give you Grobb cleaver!! Make strong and smarts on you it will. Just like carver Cagrek.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,235,30); --Da Bashers
		e.other:Faction(e.self,222,-4); --Broken Skull Clan
		e.other:QuestReward(e.self,0,0,0,3,5413,20000); -- Item: Grobb Cleaver
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
