function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to you " .. e.other:GetCleanName() .. " I hope you yearn to become a Steel Warrior as we all are here in the Bunker. We are in need of more recruits to continue the [war].");
	elseif(e.message:findi("war")) then
		e.self:Say("The war I speak of is the one we Steel Warriors have sworn to wage agianst [Clan Deathfist] in the Commonlands. We are doing a fine job but we require more weapons. We are expecting a shipment of blades from Groflahs Forge. We require a warrior of the bunker to [get our shipment]. Maybe you.");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("If you do not know of Clan Deathfist go ask Cain who they are. He will not only tell you he will sign you up to help fight our war!");
	elseif(e.message:findi("shipment")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("We would be most thankful for your service. Please take this voucher over to Groflah at Groflahs Forge in North Freeport. He will give you the shipment of weapons.");
			e.other:SummonCursorItem(18820); -- Item: Sealed Letter
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "This is only one sword. I requested four altogether. You shall not get your payment until I get my fourth sword."

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12241,item2 = 12242,item3 = 12243,item4 = 12244}, 1, text)) then -- Raw Short Sword 1-4
		e.self:Say("Good work, " .. e.other:GetCleanName() .. ". The bunker shall be well stocked. Here you are, my friend. Take this raw blade. You can take it to Groflah - he will sharpen and polish it for you. It should be a formidable weapon.");
		e.other:Faction(e.self,311,20); -- Steel Warriors
		e.other:Faction(e.self,262,4); -- Guards of Qeynos
		e.other:Faction(e.self,230,-3); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-3); -- Freeport Militia
		e.other:Faction(e.self,281,4); -- Knights of Truth
		e.other:QuestReward(e.self,0,math.random(10),math.random(10),0,13919,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
