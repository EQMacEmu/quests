function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up and smiles.  'Hiya. I just love fishing, don't you?'");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh! Tolli sent you over here didn't he. If you're a rogue and want some armor just let me know.");
	elseif(e.message:findi("rogue")) then
		e.self:Say("This stuff isn't free no sir! I have a mask. cloak. gauntlets. gorget. waistband. and a dirk.  Just ask and I'll tell ya what ya have to do to get it.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask of concealment you're going to have to go get me an astral jewel, a mark of deceit, and an engraved fire opal statuette.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak of concealment you're going to have to go get me a sun jewel, a mark of secrecy, an engraved ivory statuette, and a polished gemstone.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets of concealment you're going to have to go get me a moon jewel, a mark of deception, and an engraved gold statuette.");
	elseif(e.message:findi("gorget")) then
		e.self:Say("For the gorget of concealment you're going to have to go get me a star jewel, a mark of trickery, and an engraved wooden statuette.");
	elseif(e.message:findi("waistband")) then
		e.self:Say("For the waistband of concealment you're going to have to go get me a cloud jewel, a mark of silence, an engraved platinum statuette, and a true silver needle.");
	elseif(e.message:findi("dirk")) then
		e.self:Say("For the dirk of concealment you're going to have to go get me a sky jewel, a mark of greed, an engraved mithril statuette, and a dread hilt."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You have done well to bring me this, but there is more needed before you get your reward.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494,item2 = 5287,item3 = 5288},1,text)) then -- astral jewel. a mark of deceit. and an engraved fire opal statuette
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3795,25000); -- Mask
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488,item2 = 5289,item3 = 5290,item4 = 5291},1,text)) then -- sun jewel. a mark of secrecy. an engraved ivory statuette. and a polished gemstone.
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3796,25000); -- cloak
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489,item2 = 5292,item3 = 5293},1,text)) then -- moon jewel. a mark of deception. and an engraved gold statuette
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3797,25000); -- guantlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490,item2 = 5294,item3 = 5295},1,text)) then -- star jewel. a mark of trickery. and an engraved wooden statuette
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3798,25000); -- gorget
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491,item2 = 5285,item3 = 5297,item4 = 5298},1,text)) then -- cloud jewel. a mark of silence. an engraved platinum statuette. and a true silver needle
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3799,25000); -- waistband
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492,item2 = 5299,item3 = 5326,item4 = 5327},1,text)) then -- sky jewel. a mark of greed. an engraved mithril statuette. and a dread hilt.
		FactionReward(e)
		e.other:QuestReward(e.self,0,0,0,0,3800,25000); -- Dirk
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function FactionReward(e)
	e.self:Say("" .. e.other:GetCleanName() .. " take this and use it with pride.")
	e.other:Faction(e.self,1502,5); -- Katta Castellum Citizens
	e.other:Faction(e.self,1503,1); -- Validus Custodus
	e.other:Faction(e.self,1504,1); -- Magus Conlegium
	e.other:Faction(e.self,1499,-2); -- Citizens of Seru
	e.other:Faction(e.self,1483,-1); -- Seru
	e.other:Faction(e.self,1487,-1); -- Shoulders of Seru
end
