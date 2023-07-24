function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("May the blessings of the Rainkeeper protect you in your travels. I am Kasine Paegra, keeper of the [Order of Thunder] medallions.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat!");
		end
	elseif(e.message:findi("order of thunder")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The Order of Thunder is the medal awarded to a Knight of Thunder who has proven himself superior to the average warrior. All knights and priests of Thunder have one, save for the youngest members. Along with the medal comes great respect. You might say the wearer becomes more charismatic. Should you find one, please return it to Kasine Paegra, unless told otherwise.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat!");
		end
	elseif(e.message:findi("karana")) then
		e.self:Say("Karana, the Rainkeeper, is the provider of the storms. If it were not for the storms of Karana, life would not flourish. All should pay tribute to the Rainkeeper.");
	elseif(e.message:findi("enchant")) then
		if(e.other:GetFactionValue(e.self) >= 900) then
			e.self:Say("If you wish the power of the Rainkeeper to once again whine upon your weapon, you must hand me Bonethunder and 500 Gold Coins.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Well, friend, the Temple of Thunder has recognized and appreciates your past deeds for us. But this matter is of vital importance to us and we need more proof of your devotion to our cause.");
		else
			e.self:Say("You have proven yourself not only an enemy of the Knights of Thunder, but an enemy of Karana himself.  Now leave, sewer rat!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I am ordered to only enchant the spell when I have both Bonethunder and 500 gold coins.";
	
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13287}, 0)) then --Order of Thunder (WK Paladin)
		e.self:Say("You are a very honorable person. You have returned an Order of Thunder which you truly do not need. I give you the protection of the Rainkeeper to watch over you. May it keep you from harm. Go and serve.");
		-- Confirmed Live Experience and Faction
		e.self:CastSpell(11,e.other:GetID()); -- holy armor
		e.other:Faction(e.self,280,10);		--Knights of Thunder
        e.other:Faction(e.self,221,-10);	--BloodSabers
        e.other:Faction(e.self,341,7);		--Priest of Life
        e.other:Faction(e.self,262,7);		--Guards of Qeynos
		e.other:QuestReward(e.self,{exp = 1000});
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13288}, 0)) then --Order of Thunder (Drosco)
		e.self:Say("You have returned an Order of Thunder which has been drained of all its power.  I wonder how this could have happened.  No doubt evil is behind this.  Thank you for its return.  I give you the blessings of Karana.  Go and serve the Rainkeeper.");
		e.self:CastSpell(200,e.other:GetID()); -- minor healing
		e.other:Faction(e.self,280,20);		--Knights of Thunder
        e.other:Faction(e.self,221,-20);	--BloodSabers
        e.other:Faction(e.self,341,15);		--Priest of Life
        e.other:Faction(e.self,262,15);		--Guards of Qeynos
		e.other:QuestReward(e.self,{exp = 1000});
	elseif(e.other:GetFactionValue(e.self) >= 900 and item_lib.check_turn_in(e.self, e.trade, {item1 = 6358, gold = 500},1,text)) then -- useless recharge quest, item doesn't have charges anymore -- Bonethunder Staff
		e.self:Say("The Rainkeeper has bestowed this weapon with power once more. Take it and defend our temple.");
		e.other:QuestReward(e.self,0,0,0,0,6358,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1054 -- Kasine_Paegra