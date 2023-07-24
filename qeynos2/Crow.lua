function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -200) then			
			e.self:Say("Welcome to Crow's! If you're thirsty, we have a fine selection of brews and ales.");
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");		
		end	
	elseif(e.message:findi("brew")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("It's my own personal recipe, and it's the best ale this side of the Serpent's Spine. Been having trouble keeping up with the demand for it, though. Especially with those little Irontoe drunkards running around.");		
		else
			e.self:Say("Heh...  With all you've done, I'm surprised you're still alive.");
		end
	elseif(e.message:findi("kane")) then
		e.self:Say("Yeah, I need someone to run over to Kane's for me. I need to find out how many cases of [Crow's special brew] he needs for next week.");
	end	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 17600})) then
		e.self:Say("What are you? The Rat's new bag man? Peh, he is useless. That bum drinks any gold he gets. Here ya go, kid!");
		-- Confirmed Live Factions
		e.other:Faction(e.self,223,2,0); -- +Circle of Unseen Hands
		e.other:Faction(e.self,291,-1,0); -- -Merchants of Qeynos
		e.other:Faction(e.self,230,1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-1,0); -- -Guards of Qeynos
		e.other:Faction(e.self,273,1,0); -- Kane Bayle
		e.other:QuestReward(e.self,0,0,math.random(8),0,13901,250);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end

function event_signal(e)

	if(e.signal == 1) then
		e.self:Say("You ok Sabs?");
		eq.signal(2083, 2); -- NPC: Sabnie_Blagard
	elseif(e.signal == 2) then
		e.self:Say("'Testing one two three four'");
		eq.signal(2083,5); -- NPC: Sabnie_Blagard
	elseif(e.signal == 3) then
		e.self:Say("Excellent. To think that he thought he could stroll in here from Highpass and take over my action. He will learn the hard way what happens to merchants who think they can operate here without our support and protection.");

		local sabs = eq.get_entity_list():GetMobByNpcTypeID(2083);		-- NPC: Sabnie_Blagard
		if ( sabs.valid ) then
			e.self:FaceTarget(sabs);
		end

	elseif(e.signal == 4) then
		e.self:Say("Anything you say, my love.");
	elseif(e.signal == 5) then
		e.self:Say("Bwah! Ha! Ha! I love it when he does that! HA HA HA! You are too much, Flynn!");
	end

end
