function event_say(e)
	if(e.message:findi("hail")) then	
		if(e.other:GetFaction(e.self) < 4) then
			e.self:Say("Greetings, merry gentlefolk! If you enjoy the music, please feel free to cross my palm with gold.");
		else
			e.self:Say("Oh look, a talking lump of refuse. How novel!")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local etched = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {gold = 2})) then
		e.self:Say("Rat spittle! Busted another string! You seem like a good music loving citizen, could you please run to the Wind Spirit's Song and grab me a fresh set of lute strings?");
		e.other:Ding();
		-- confirmed live factions
		e.other:Faction(e.self,284, 2,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281, 1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262, 1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304, -1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285, -1,0); -- Faction: Mayong Mistmoore
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13709})) then -- Lute Strings
		e.self:Say("'Many thanks, merry gentlefolk! Let me cross your palm in gratitude for your kindness. Hmmmm where did my lucky coin go?");
		-- confirmed live factions
		e.other:Faction(e.self,284, 2,0); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281, 1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262, 1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304, -1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285, -1,0); -- Faction: Mayong Mistmoore
		if(math.random(3) == 3) then -- you only get the coin sometimes
			etched = 13710; -- Etched Silver Coin
		end
		e.other:QuestReward(e.self,0,math.random(20),math.random(10),1,etched,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13710})) then -- Etched Silver Coin
		e.self:Say("'My lucky coin! How did it get in there? Well, never mind that. You are an honest person and although honesty is its own reward, I feel obligated to return the favor. Take this to Dionna if you enjoy music. Farewell friend!");
		e.other:Faction(e.self,284, 2); -- Faction: League of Antonican Bards
		e.other:Faction(e.self,281, 1); -- Faction: Knights of Truth
		e.other:Faction(e.self,262, 1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304, -1); -- Faction: Ring of Scale
		e.other:Faction(e.self,285, -1); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,13708,5000); -- Note From Fabian
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
