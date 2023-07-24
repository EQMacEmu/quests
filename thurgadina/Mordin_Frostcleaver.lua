-- lead in text to figure out what to say to loremaster borannin to start
-- the prayer shawl quests
-- 
-- involved in 3rd prayer shawl quest

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, allo there, and welcome to me shop, " .. e.other:GetCleanName() .. ". Ye'll have to excuse the mess but I've been havin a bloody good time here lately. . . HAR HAR, ye get it? Anyways, thanks to you offlanders I now have a selection of some exotic meats never afore seen here on Velious.  I've been amazed at the demand for some of 'em.  I can't seem to keep shark meat in stock any more.  I wonder if eatin' raw fish is catching on?  In addition to supplyin' the freshest meat in Thurgadin I also offer tasks to would-be hunters in the wastes.");
	elseif(e.message:findi("tasks")) then
		e.self:Say("Sorry, " .. e.other:GetCleanName() .. ", but I've got no tasks to offer ye this week.  If ye be seriously lookin fer sumthin ta do ask ole Borannin 'bout duties fer the crown..");
	elseif(e.message:findi("tundrabear sandwich")) then
		e.self:Say("Dat's easy, ye just take a slab o' dat Tundra Kodiak meat and a jug o' sauce, put it in da oven, den combine the product with a loaf o' bread in a mixin' bowl an' there ye be.");
	elseif(e.message:findi("snow bunny stew")) then
		e.self:Say("Simple enuff, getcherself two hunksa Bunny meat and a jug o' sauces. Stir 'em in a mixin bowl, then put spices and two flasks o' water with it and cook it in a pot. Mmmm, zesty!");
	elseif(e.message:findi("ulthork meat pie")) then
		e.self:Say("Hmm, lemme look that one up. Been a while since I made one. Here we are, two Ulthork meats, a vinegar and a spices in a mixin' bowl. Put yer meat mix, a clump o' dough, an' a pie tin in da oven an' yer good ta go.");
	elseif(e.message:findi("snow griffin souffle")) then
		e.self:Say("This one's a bit tricky, ya toss four snow griffin eggs and a pack of spices in de oven. Ye must bake it just right or it's all gunna be wasted. When yer done bring it to Thoridain and if ye did it right he'll give ye his special seal. Just show Borannin that seal and yer shawl and he'll know that yer finished in the kitchen.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1420}, 0)) then
		e.self:Say("Hullo, " .. e.other:GetCleanName() .. ", I see you've signed on for a bit of food service eh? Well, we can always use an extra pair o' hands here dat's fer sure. First things first, warsh yer grubby mitts an' cook up dinner fer good ol' Leif. Should'n be too tough fer ye, he has simple enough taste. Make him a Tundrabear sandwich an' lemme know when he's been fed. Don'tcha ferget ta give him this with his meal.");
		e.other:QuestReward(e.self,0,0,0,0,1415);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1419}, 0)) then
		e.self:Say("Well don, outlander! We'll make a chef of you before we're through. Next you'll need to whip up some Snow Bunny stew fer Missus Coldheart. Again, give her this napkin with her meal an' lemme know when she's been served.");
		e.other:Faction(e.self,406,2); -- coldain
		e.other:Faction(e.self,405,1); -- dain
		e.other:Faction(e.self,448,-1); -- kzek
		e.other:Faction(e.self,419,-1); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1416,100000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1423}, 0)) then
		e.self:Say("Now yer cookin! Letsee here... Guard Leif, check... Trita Coldheart, check... Ahh yes, next we need an Ulthork meat pie fer Brita. She's a doll, smart too, but she can be testy when she's hungry so get movin'!");
		e.other:Faction(e.self,406,3); -- coldain
		e.other:Faction(e.self,405,1); -- dain
		e.other:Faction(e.self,448,-1); -- kzek
		e.other:Faction(e.self,419,-1); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1417,150000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1424}, 0)) then
		e.self:Say("More dirty dishes, eh? Well outlander, only one more meal to serve and I'll be done with ye. Make a snow griffin souffle fer the Grand Historian himself. It's his favorite.");
		e.other:Faction(e.self,406,3); -- coldain
		e.other:Faction(e.self,405,1); -- dain
		e.other:Faction(e.self,448,-1); -- kzek
		e.other:Faction(e.self,419,-1); -- krif
		e.other:QuestReward(e.self,0,0,0,0,1418,200000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

