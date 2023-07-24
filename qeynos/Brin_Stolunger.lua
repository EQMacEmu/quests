function event_say(e)
	
	if(e.message:findi("Hail")) then
		e.self:Say("What?  What?!!  Are we a [young steel warrior]..  Or another [spectator] for the Arena?");
	elseif(e.message:findi("spectator")) then
		e.self:Say("As I thought!!  You shall be better off upon the ramparts of the arena.  It would be dreadful to see a fine citizen injured in the arena.");
	elseif(e.message:findi("young steel warrior")) then
		if(e.other:GetFaction(e.self) <= 4) then -- requires amiably
			e.self:Say("I say!! Good show!! I see the look of the warrior in you. Some day you may be as great as Brin Stolunger. Ha!! Still, you are surely wet behind the ears. You will need to polish your skills. Take this sack. Return it to me when you have filled it with 5 bat wings and 5 snake scales. Be sure you combine the contents of the bag before you give it back to me. Now, be off!!");
			e.other:SummonCursorItem(17935); -- Empty Arena Sack
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) <= 4) then -- requires amiably
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13399})) then -- Full Arena Sack
			e.self:Say("Jolly good!! You are clearly on your way to being a fine addition to the Steel Warriors. Now you must take this message to the person noted. All shall be explained.");
			-- Confirmed Live Factions
			e.other:Faction(e.self,311,10,0); -- Steel Warriors
			e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
			e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,330,-1,0); -- Freeport Militia
			e.other:Faction(e.self,281,2,0); -- Knights of Truth
			e.other:QuestReward(e.self,0,0,0,0,18893,10000); -- A Sealed Letter - lore: Note to Axe Broadsmith
		elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18895})) then -- Letter of Recommendation - lore: Letter of Recommendation from Axe
			e.self:Say("So I see you have performed the test of undead. Good show. Now it is time you truly tested your mettle. Take this note to Grahan Rothkar. He can be found beneath the arena in the pens. May you live to join our brotherhood.");
			-- Confirmed Live Factions
			e.other:Faction(e.self,311,10,0); -- Steel Warriors
			e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
			e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,330,-1,0); -- Freeport Militia
			e.other:Faction(e.self,281,2,0); -- Knights of Truth
			e.other:QuestReward(e.self,math.random(10),0,0,0,18894,20000); -- A Sealed Letter - lore: Letter to Grahan Rothkar
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- end -- quests/qeynos/Brin_Stolunger
