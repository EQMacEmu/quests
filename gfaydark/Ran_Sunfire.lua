function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. " .. e.other:GetCleanName() .. "! I trust you are not afraid of heights. Kelethin is a grand city. but it is also a safe haven from predators and evil beings. About the only thing to fear are the [pixie tricksters].");
	elseif(e.message:findi("pixie trickster")) then
		e.self:Say("An irritating lot of fairy folk. They have been starting fires in our great forest. They may just burn our grand community down. We will have to [exterminate the pixies]. It is unfortunate. but it is for the good of the entire forest.");
	elseif(e.message:findi("grynn")) then
		e.self:Say("Grynn is my friend. He chose to follow me one day and has been here ever since. He tells me much of the goings-on in the woods. Lately, he has mentioned a problem with the [pixie tricksters].");
	elseif(e.message:findi("exterminate the pixie")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Then I give you this pouch. Should you fill and combine it with pixie dust, I shall pay you greatly for your deeds. We may even find a use for the dust itself. Careful, small though they may be, many are quite strong. Search for the weak ones for now.");
			e.other:SummonCursorItem(17957); -- Item: Empty Pouch
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("Faydark's Champions cannot call you foe. but you have yet to earn our trust.");
		else
			e.self:Say("Your ways are considered vile to Faydark's Champions. Leave before my rage overcomes my restraint.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and (item_lib.check_turn_in(e.self, e.trade, {item1 = 12109 }))) then -- Pouch of Pixie Dust
		e.self:Say("We thank you for your deed. Here, then, is a small reward. Nothing more than long forgotten equipment, but it may be useful to a young ranger.");
		e.other:Faction(e.self,246,20); -- Faydark champions
		e.other:Faction(e.self,279,5); -- King Tearis Thex
		e.other:Faction(e.self,226,5); -- Clerics of Tunare
		e.other:Faction(e.self,310,5); -- Soldiers of Tunare
		e.other:Faction(e.self,234,-5); -- Crushbone Orcs
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,eq.ChooseRandom(2111,2112,2104,2108,2106,2143,2148,2142,2146,2139,2147,2138,2141,2137,2144,2140,2145),800); -- Patchwork Pants, Patchwork Boots, Patchwork Tunic, Patchwork Sleeves, Patchwork Cloak, Raw-hide Belt, Raw-hide Boots, Raw-hide Cloak, Raw-hide Gloves, Raw-Hide Gorget, Raw-hide Leggings, Raw-hide Mask, Raw-hide Shoulderpads, Raw-hide Skullcap, Raw-hide Sleeves, Raw-hide Tunic, Raw-hide Wristbands  
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:gfaydark  ID:54104 -- Ran_Sunfire 
