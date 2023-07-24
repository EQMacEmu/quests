function event_say(e)
	if(e.message:findi("supplies")) then
		e.self:Say("Looking for supplies, are we?  Doing a bit of adventuring?  You'd best head over to Rolyn Longwalker's shop, Beyond Faydark.  It would be next to Faydark's Bane.");
	elseif(e.message:findi("wizard guild") or e.message:findi("enchanter guild") or e.message:findi("magician guild")) then
		e.self:Say("All three circles of magic can be found at the Keepers of the Art.  They are just past the fishing shop near the lake.");
	elseif(e.message:findi("forge")) then
		e.self:Say("We have a pair of forges available for public use.  You can find them inside the Emerald Armor.");
	elseif(e.message:findi("bank")) then
		e.self:Say("If you are searching for a bank, go to the center of town.  There you shall find the Felwithe Keeper.");
	elseif(e.message:findi("inn") or e.message:findi("rest")) then
		e.self:Say("Need to rest?  Just go to the left of the paladin's temple and you can find the Traveler's Home.");
	elseif(e.message:findi("tavern")) then
		e.self:Say("Tovanik's Venom is what you are seeking.  It is near the local inn.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("Look to the right of the paladin's temple and you shall find Faydark's Bane.  It is one of the finest weapons shops in Faydwer.  Their longswords, especially, are in high demand.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18901})) then
		e.self:Say("I.. but.. she.. You can take this. I guess I don't need it any more.");
		e.other:QuestReward(e.self,0,0,0,0,14640,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end