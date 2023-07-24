function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! What business do you have in the pens of the Qeynos Arena? Have you a report of the [escaped catman]?");
	elseif(e.message:findi("escaped catman")) then
		e.self:Say("We had a catman imprisoned here for use in future gladiator battles. He escaped. In the process, he bit off my assistant's hand which held the key to pen number seven. I now seek to hire a warrior to [retrieve key seven].");
	elseif(e.message:findi("retrieve key seven") or e.message:findi("second escaped gladiator")) then
		if(e.other:GetFaction(e.self) <= 4) then -- requires amiably
			if(e.message:findi("retrieve key seven")) then
				e.self:Say("Hmmm. You seem a bit young, but I shall give you a chance. Seek out the catman named Nomala. He most likely returned to [Kerra Isle]. He is not very powerful, but his people are surely watching over him. Retrieve the key for me and be rewarded.");
			elseif(e.message:findi("second escaped gladiator")) then
				e.self:Say("It appears our prize gladiator has escaped. He is a minotaur hero!! Trained by our best. He took down five of our greatest warriors during his escape. Rumor has it he fled to his homeland in the Steamfont Mountains. They say he is an outcast and does not live with his people. He appears during times of great need to champion the minotaurs. Return his shackles to me and glory is yours!!");			
			end				
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
		else
			e.self:Say("Your head shall look grand mounted on the wall of the Steel Warriors Arena!!");
		end		
	elseif(e.message:findi("kerra isle")) then
		e.self:Say("Kerra Isle is a dangerous place. The Kerra are not a friendly race. There is an island between Erudin and Qeynos which is inhabited by a more docile tribe of Kerra. I hear they took some of their Kerra beetles along with them to the island, too.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 20031})) then -- requires amiably
		e.self:Say("I thank you. I must admit I had my doubts, but you have proven yourself a true warrior. I salute you. You can be of some assistance to me.It see ms as though there has been a [second escaped gladiator] and I have a reward waiting for a human warrior.");
		-- Confirmed Live Factions and Experience
		e.other:Faction(e.self,311,10,0); -- Steel Warriors
		e.other:Faction(e.self,262,2,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:Faction(e.self,281,2,0); -- Knights of Truth
		e.other:QuestReward(e.self,math.random(10),math.random(10),0,0,eq.ChooseRandom(5013,5014,5015,5016,5019,5020,5021,5022,5023,5024,5025),2550); -- random rusty weapon
	elseif(e.other:GetFaction(e.self) <= 4 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12188})) then -- requires amiably
		e.self:Say("You are a true Steel Warrior!! Now you shall wear my hero bracers. I designed them for my greatest gladiators and you have shown yourself mighty enough to wear them.");
		-- Confirmed Live Factions and Experience
		e.other:Faction(e.self,311,75); -- Steel Warriors
		e.other:Faction(e.self,262,15); -- Guards of Qeynos
		e.other:Faction(e.self,230,-11); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-11); -- Freeport Militia
		e.other:Faction(e.self,281,15); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,2,12189,640800); -- Item: Hero Bracers
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13398})) then
		e.self:Say("I salute you. You have done well and crossed into the brotherhood of the Steel Warriors. Welcome. Take this. It is the mark of a Steel Warrior. Live the way of the warrior.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,311,25,0); -- Steel Warriors
		e.other:Faction(e.self,262,5,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-3,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-3,0); -- Freeport Militia
		e.other:Faction(e.self,281,5,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,13229,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18894})) then
		e.self:Say("So you are ready to encounter your final test. I wish you well, young warrior. Take this key to the pen on the left along the wall with three doors. There you shall meet your final challenge. Return with proof of victory. Exit before it is at an end and I shall not help you.");
		eq.unique_spawn(1005,0,0,-520,-120,-24.5); -- NPC: a_young_lion
		eq.set_timer("86",120000);
		-- Confirmed Live Factions
		e.other:Faction(e.self,311,5,0); -- Steel Warriors
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-1,0); -- Freeport Militia
		e.other:Faction(e.self,281,1,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,20029,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	if(e.timer == "86") then
		eq.signal(1005,1); -- NPC: a_young_lion
		eq.stop_timer("86");
	end
end

-- quests/qeynos/Grahan_Rothkar.pl 
