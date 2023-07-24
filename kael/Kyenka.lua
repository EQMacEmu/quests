function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("My, it is the great " .. e.other:GetCleanName() .. " who stands before me! Rumors of your greatness have spread even to the court of King Tormax. I am Kyenka, Duke of Kael Drakkel. I advise King Tormax on matters concerning the nefarious dragons.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("dragon")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The living dragons of this realm are the bane of Kael Drakkel and its people. Eventually they will be gone and only we Kromzek will remain. We will purge this land of their menace.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("purge")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The beasts must be slain. They only bring strife to this world. You are a powerful mercenary, and are sympathetic to my cause, I would assume. You could become rich beyond your wildest dreams by assisting King Tormax and me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("assist")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("Rally together a band of adventurers and track down and slay the elder dragons of this continent. For each head you return to me I will impart a gift to you.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25119}, 0)) then
		e.self:Say("This beast must have taken quite a force to slay. These boots have been crafted to reward your kind for such great efforts. Take them and wear them with pride. They will be a warning to other dragons that you are a great slayer of their kind.");
		e.other:Faction(e.self,448,30); -- Faction: Kromzek
		e.other:Faction(e.self,419,7); -- Faction: Kromrif
		e.other:Faction(e.self,429,7); -- Faction: King Tormax
		e.other:Faction(e.self,430,-15); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25029,75000);
	elseif(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25118}, 0)) then
		e.self:Say("You serve the crown well, " .. e.other:GetCleanName() .. ". This is one less beast to ruin our lands. Take these pauldrons which I have fashioned from the first dragon scales brought to King Tormax's court.");
		e.other:Faction(e.self,448,30); -- Faction: Kromzek
		e.other:Faction(e.self,419,7); -- Faction: Kromrif
		e.other:Faction(e.self,429,7); -- Faction: King Tormax
		e.other:Faction(e.self,430,-15); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25028,75000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	else
		eq.signal(113137, 1); -- NPC: #Sentinel_Weldren
		eq.signal(113136, 1); -- NPC: #Sentinel_Drakeslayer
	end
end
