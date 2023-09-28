function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! Ye've come to [serve Halas]. have ye not? We're the Wolves o' the North and it is our task to defend our city from harm.");
	elseif(e.message:findi("serve halas") or e.message:findi("orc troopers") or e.message:findi("protect the pass")) then
		if(e.other:GetFaction(e.self) < 5) then -- requires amiably
			if(e.message:findi("serve halas")) then
				e.self:Say("Halas is surrounded by barren arctic tundra. We've many foes. Among them are the [orc troopers]. [ice goblins] and the ever-present polar bears.");
			elseif(e.message:findi("orc troopers")) then
				e.self:Say("So. Ye think yerself strong enough to battle the snow orc troopers? I pray to the Tribunal that ye are. If ye can return to me four wrath orc wristbands from the troopers' bodies. I'll reward ye with the [Seax].");
			elseif(e.message:findi("protect the pass")) then
				e.self:Say("Then travel to the Everfrost Peaks and take this pack with you.  I want you to return this pack to me when it is filled with the beaded ice necklaces of the Ice Goblins.  When it is filled, combine the items and return it to me and I shall decide if you deserve a reward for your deed.");
				e.other:SummonCursorItem(17944); -- Item: Empty Bag
			end						
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do to earn our trust. Perhaps ye should inquire o' the [gnoll bounty].");
		elseif(e.other:GetFaction(e.self) > 5) then
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end			
	elseif(e.message:findi("ice goblins")) then
		e.self:Say("The ice goblins have plagued our community fer some time now. At times. they even manage to get inside our walls. Fer the most part. they prey on travelers who pass through Everfrost Peaks. Since they're a weak race. we employ our youngest warriors to [protect the pass].");
	elseif(e.message:findi("seax")) then
		e.self:Say("The Seax is a Northman warrior's piercing weapon. Dinnae confuse this with another [weapon] related to the Seax called the Langseax. The local rogues have also learned to master the Seax. I'll only offer it to those who battle the [orc troopers].");
	elseif(e.message:findi("gnoll bounty")) then
		e.self:Say("I've placed a bounty on the gnolls o'Blackburrow. Their whelps have invaded our land and we must carry the fight into their dens. Join the fight and return three gnoll fangs as proof of yer victory in Blackburrow. Do so, and earn the respect o' the Wolves o' the North.");
	elseif(e.message:findi("weapon")) then
		e.self:Say("The Langseax is a one-handed slashing weapon crafted fer a warrior. Tis the brother to the [Seax].");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12223, item2 = 12223, item3 = 12223, item4 = 12223},0)) then -- requires amiably
		e.self:Say("Ye're becoming a fine champion o' Halas. Take th' Seax. May ye always defend Halas!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,20);			-- Wolves of the North
		e.other:Faction(e.self,327,4);			-- Shamen of Justice
		e.other:Faction(e.self,328,5);			-- Merchants of Halas
		e.other:Faction(e.self,311,1);			-- Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,7322,3000); -- Seax
	elseif(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13898},0)) then -- requires amiably, Bag of Ice Necklaces
		e.self:Say("Ye've done well, me young " .. e.other:Class() .. " .  We've gathered these to add to yer provisions.  While in the Everfrost Peaks, be on the watch fer any gnolls ye may find.  I declare there to be a [gnoll bounty].");
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,10);			-- Wolves of the North
		e.other:Faction(e.self,327,2);			-- Shamen of Justice
		e.other:Faction(e.self,328,2);			-- Merchants of Halas
		e.other:Faction(e.self,311,1);			-- Steel Warriors
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),0,eq.ChooseRandom(13005,13007,13006,13002,13003),3800); -- Random Reward: Ration, Iron Ration, Water Flask, Torch
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 13915, item3 = 13915},0)) then	-- Gnoll Bounty - Return 3 Gnoll Fangs
		e.self:Say("Fine work, fine work!  The gnoll threat must be extinguished before it can ever fully grow.  Ye've done yer part to aid our cause.  Please allow me to repay ye with a few provisions and a wee bit o' coin.  Then, continue with yer good deeds.");
		-- Confirmed Live Factions and exp data
		e.other:Faction(e.self,320,15);		-- Wolves of the North
		e.other:Faction(e.self,327,3);		-- Shamen of Justice
		e.other:Faction(e.self,328,3);		-- Merchants of Halas
		e.other:Faction(e.self,311,1);		-- Steel Warriors
		e.other:QuestReward(e.self,math.random(0,5),math.random(0,5),math.random(0,5),0,eq.ChooseRandom(13005,13007,13006,13002),8000); -- Iron Ration, Ration, Water Flask, Torch
	end
item_lib.return_items(e.self, e.other, e.trade)
end
