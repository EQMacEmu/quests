-- Edit on April 19, 2007 by Kilelen
-- Edit by spre
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then -- no faction requirements anywhere on this guy
		e.self:Say("Greetings! I am the operator of this scrapyard. If you have any scrap metal, I would be glad to purchase it from you in loads of four. The Gemchoppers no longer allow me to accept blackbox fragments and micro servos.");
	elseif(e.message:findi("fairy wing") or e.message:findi("faerie wing")) then
		e.self:Say("No!! You cannot have my magic Fairie Wing!! I need it. I read somewhere within the great library that the magic wing from a fairie princess will restore my full head of hair. Look at me!! I am bald!! I have no [friends] at all.");
	elseif(e.message:findi("friend")) then
		e.self:Say("Oh. You are just saying that so you can get my fairie wing. I will make you a deal. I cannot rely on this wing forever. I will trade it with you if you could get me a case of hair tonic. If you are a true friend you [will fetch the hair tonic] for me.");
	elseif(e.message:findi("hair tonic")) then
		e.self:Say("Great!! Here you go, my friend. Take this crate and within you shall fill each slot with hair tonic. When all are combined within the crate, return it to me for your wing. I am not sure what the tonic was or where I got it. There is some writing on the crate, but I could not identify it.");
		e.other:SummonCursorItem(17979); -- Item: Crate for Tonics
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I hear there is one more on the loose. Find him and then I shall pay you.";
	local text2 = "I now require all deliveries of Scrap Metal to be in loads of four.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13198, item2 = 13198, item3 = 13198, item4 = 13198},1,text2)) then -- Turn in 4 scrap metal
		e.self:Say("Grand! We always need more scraps to melt down. Here you are, then... Some coins for supporting Ak'Anon and a salvaged item from the scrapyard.");
		e.other:Faction(e.self,255,5,0); -- Faction: Gem Choppers
		e.other:Faction(e.self,288,1,0); -- Faction: Merchants of Ak'Anon
		e.other:Faction(e.self,333,1,0); -- Faction: King Ak'Anon
		e.other:Faction(e.self,238,-1,0); -- Faction: Dark Reflection
		e.other:Faction(e.self,1604,-1,0); -- Faction: Clan Grikbar
		e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(5013,10018,5014,10060,2159,5015,6016,17009,5016,9009,7010,5019,7009,5020,5023,12340,12340,17033,13004,13077,6027),200); -- Ran quest 50+ times, added all the rewards -- rusty, patchwork, hematite, chunk of metal ore, small buckler, large lantern, Purse, Forging Hammer
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9426, item2 = 28618, item3 = 29906, item4 = 28165})) then -- Bundle of Super Conductive Wires, Gold Tipped Boar Horn, Shard of Pure Energy, Silicorrosive Grease
		e.self:Say("Wow! I see my nephew finally read my list of items. I also see he is not delivering them himself, he is too young to bind himself to the library like that. These items should help me in my research to upgrade the scrapyard. Here let me pen a note to him so you can take it back to him.");
		e.other:QuestReward(e.self,0,0,0,0,15980,1000); -- Note for Fimli
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12336})) then
		e.self:Say("Huzzah!! You are my friend. Now you can take my old toupee and get it repaired. Just go to Freeport and ask Ping to [repair the toupee]. Hey!! You know what? He is the guy who sells the hair tonic!! I remember now. Well,.. Get my toupee repaired and I will give you the fairie wing.");
		e.other:QuestReward(e.self,0,0,0,0,12337); -- Item: A Tattered Toupee
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12254})) then
		e.self:Say("Double Huzzah!! You are a good friend " .. e.other:GetCleanName() .. ". Now mayhaps I shall find myself a wife. Here pal, the fairy wing. I hope it can give you a great head of hair. You need it.");
		e.other:QuestReward(e.self,0,0,0,0,12339); -- Item: A Glimmering Fairie Wing
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13216, item2 = 13217},1,text1)) then
		e.self:Say("Good. The citizens of Ak'Anon are safe from those little critters. They may have injured someone; that is why they are deactivated. Here is something I found in the scrapyard. I hope you can find a purpose for it.");
		e.other:Faction(e.self,255,10,0); -- Faction: Gem Choppers
		e.other:Faction(e.self,333,2,0); -- Faction: King Ak'Anon
		e.other:Faction(e.self,288,2,0); -- Faction: Merchants of Ak'Anon
		e.other:Faction(e.self,238,-2,0); -- Faction: Dark Reflection
		e.other:Faction(e.self,1604,-1,0); -- Faction: Clan Grikbar
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(5),0,eq.ChooseRandom(17981, 17981, 6027),250);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
