function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("" .. e.other:GetCleanName() .. ", your name has reached my ears more than a few times. Rumors fly that your kind will be the downfall of both the dragons and the Coldain.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("dragon")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The dragons are not my primary concern, Kyenka has a greater hatred for them. I leave matters regarding to them in his capable hands. My worries are of the Coldain.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("coldain")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("I do not fully trust the Kromrif to keep Kael Drakkel protected from the menace of the tiny savages. The Kromrif do not actively seek to kill them. If the Coldain are left to breed they will one day swarm over Kael and no number of Kromzek warriors will be able to save us.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("kromrif")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The Frost giants who call Kael their home have grown far too lax. So few of them train daily and actively seek out the Coldain to slay. I have advised King Tormax to send Kromzek raiding parties to raze Thurgadin, however, each time he reminds me that our strongest warriors must stay to guard against the dragon menace. What I need is a band of mercenaries to seek out and assassinate key Coldain leaders. We must destroy their ability to make war.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("assassinate")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("Perhaps assassinate is not the best word. I simply wish the death of some of the more compitent (sic) advisors of that foolish Dain. Within the halls of Icewell keep dwells a huntsman that has stood by the Dains side since he was a mere child. The court scribe is also more then he appears to be. Bring me their heads, I will reward you for each one. That is the only proof I will take of their deaths.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25122}, 0)) then -- Head of the Huntsman
		e.self:Say("The death of this one must be causing great strife amoung the Coldain. Your work is greatly appreciated. I wish I could reward you with more, but these boots are among the few things I have to give.");
		e.other:Faction(e.self,448,30); -- Faction: Kromzek
		e.other:Faction(e.self,419,7); -- Faction: Kromrif
		e.other:Faction(e.self,429,7); -- Faction: King Tormax
		e.other:Faction(e.self,430,-15); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25027,75000); -- Coldain Skin Boots
	elseif(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25123}, 0)) then -- Head of the Royal Scribe
		e.self:Say("Take these gloves and continue to strike fear into the heart of the Coldain.  A daring raid upon Icewell Keep itself deserves no less.");
		e.other:Faction(e.self,448,30); -- Faction: Kromzek
		e.other:Faction(e.self,419,7); -- Faction: Kromrif
		e.other:Faction(e.self,429,7); -- Faction: King Tormax
		e.other:Faction(e.self,430,-15); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25026,75000); -- Coldain Skin Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)

	if (not e.joined) then
		e.self:SetRunning(false);
	end
end
