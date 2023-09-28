function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! We are the Steel Warriors of Freeport. Our training disciplines have created some of the finest warriors ever to walk upon Norrath. Perhaps the bards shall sing songs of you one day. Let your first mission be the extermination of [Clan Deathfist].");
	elseif(e.message:findi("clan deathfist")) then
		e.self:Say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts. If you are a true warrior of the bunker. perhaps you can begin with [the green and blue].");
	elseif(e.message:findi("bigger problem")) then
		e.self:Say("The bigger problem is the Freeport Militia. Go to the Hall of Truth and speak with the Knights of Truth about that. They have already started their campaign to rid the city of the militia. The so-called Freeport Militia is not to be trusted.");
	elseif(e.message:findi("green and blue")) then
		e.self:Say("The green and blue was a test for all skilled warriors. But we have no more bunker battle blades to spare, and I can not offer you the green and the blue. We must prepare for war!!");
	elseif(e.message:findi("bunker battle blade")) then
		e.self:Say(" The bunker battle blade was crafted and enchanted for use by warriors only. It has the power to strike down those creatures which hide behind their magic. Once bestowed upon a warrior, it cannot leave your side or it shall vanish from this realm forever. One must perform the [green and blue] to earn such a blade.");
	elseif(e.message:findi("opal")) then
		e.self:Say("Opal. Beautiful Opal Darkbriar. Never have I gazed upon a more beautiful creature. She works as a librarian at the Academy of Arcane Science. Some day she shall be mine. A warrior as bold as myself deserves the very best and she is truly that.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	local count = item_lib.count_handed_item(e.self, e.trade, {13916}, 2); -- Deathfist Slashed Belt x 2
	if(count > 0) then
		repeat
			e.self:Say("Very fine work " .. e.other:GetCleanName() .. ". With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");
			e.other:Faction(e.self,311,5,0); -- Steel Warriors
			e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
			e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,330,-1,0); -- Freeport Militia
			e.other:Faction(e.self,281,1,0); -- Knights of Truth
			e.other:QuestReward(e.self,0,0,8,0,0,17750); -- exp data confirmed
			count = count - 1;
		until count == 0;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18748})) then -- A Tattered Note
		e.self:Say("Welcome to the Steel Warriors, young warrior. It is time to prove your mettle. Look to the outskirts of Freeport and join the fray. Show Clan Deathfist what a warrior of the bunker can do.");
		e.other:Faction(e.self,311,100,0); -- Steel Warriors
		e.other:Faction(e.self,262,20,0); -- Guards of Qeynos
		e.other:Faction(e.self,230,-15,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,-15,0); -- Freeport Militia
		e.other:Faction(e.self,281,20,0); -- Knights of Truth
		e.other:QuestReward(e.self,0,0,0,0,13572,20);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:freportw -- Cain_Darkmoore
