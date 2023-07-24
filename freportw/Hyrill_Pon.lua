function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What do you want? Leave me be! Can't a man drown his sorrows in peace!?");
	elseif(e.message:findi("drown.* sorrow")) then
		e.self:Say("I can buy my own drinks, thank you. Now, leave me alone.");
	elseif(e.message:findi("letter.* yiz")) then
		e.self:Say("My brother Yiz?! That worthless hunk of orc dung... Last I heard, he was still searching for those [blasted eyes].");
	elseif(e.message:findi("blasted eye")) then
		e.self:Say("That is none of your business, bub!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18010})) then -- Torn Parchment
		e.self:Say("Peh! He thinks this old skull he found is a legendary skull of Wun Toque. It is said, a wizard who possesses one is granted power and intelligence far beyond those of his peers. Yiz was searching for the skulls missing ruby eyes. It seems he found the location of the first eye. Hmm.. Lynuga.. Lynuga.. I think I have heard that name before.. Yeah! Now I remember. I met her in the Foreign Quarter of Neria.. um.. Highpass Hold. She was trying to hawk some stolen gems! I think she mumbled something about going home to Grobb. I sure don't have time to track her down.");
		e.other:Faction(e.self,346,10); -- Faction: Commons Residents
		e.other:Faction(e.self,330,2); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,2); -- Faction: Knights of Truth
		e.other:Faction(e.self,362,1); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13987})) then -- Jeweled Skull (1st version)
		e.self:Say("You found it!? My sap of a brother was right after all! I sure don't want that thing. It sends shivers down my spine just holding it. Here. Take it!");
		e.other:Faction(e.self,346,100); -- Faction: Commons Residents
		e.other:Faction(e.self,330,25); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,25); -- Faction: Knights of Truth
		e.other:Faction(e.self,362,15); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,0,0,0,0,13988,2000); -- Jeweled Skull (2nd version)
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13988})) then -- Jeweled Skull (2nd version)
		e.self:Say("'Hmmm. On second thought, I might be able to get a good price for this in Neria... um... Highpass Hold. See ya, chum!");
		e.other:Faction(e.self,346,25); -- Faction: Commons Residents
		e.other:Faction(e.self,330,6); -- Faction: The Freeport Militia
		e.other:Faction(e.self,281,6); -- Faction: Knights of Truth
		e.other:Faction(e.self,362,3); -- Faction: Priests of Marr
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Hyrill_Pon.pl
