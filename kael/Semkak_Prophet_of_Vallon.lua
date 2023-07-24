function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("hail")) then
			e.self:Say("You have entered the sacred temple of Vallon Zek. This is the Temple of Strategy. We teach what must be done to be a great leader. Forethought is a powerful tool.");
		elseif(e.message:findi("teach")) then
			e.self:Say("I cannot teach one of your kind the arts of war at this time. I must teach the other Kromzek and Kromrif that proper strategy will allow us to win the war against the dragons. If you were to serve the temple of Vallon, I might consider giving you a few words of advice about strategy.");
		elseif(e.message:findi("serve the temple")) then
			e.self:Say("The dragons of Velious are ancient and wise beyond belief. They have ageless strategies to destroy their foes. The Temple of Strategy must gain the knowledge they hold. I have heard rumors of a great dragon burial ground. If this tomb indeed exists, find it and seek out the knowledge of the dragons who are now dead. Bring whatever you believe will teach us their strategies and tactics of the past.");
		end
	elseif(e.other:GetFaction(e.self) < 6) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and (item_lib.check_turn_in(e.self, e.trade, {item1 = 24986}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 24985}, 0))) then
		e.self:Say("This tablet holds great knowledge. The Temple of Strategy thanks you, " .. e.other:GetCleanName() .. ". Take this and know that your own strategies are wise indeed if you have acquired this tablet from the depths of the dragons' graveyard.");
		e.other:Faction(e.self,448,20); -- Faction: Kromzek
		e.other:Faction(e.self,419,5); -- Faction: Kromrif
		e.other:Faction(e.self,429,5); -- Faction: King Tormax
		e.other:Faction(e.self,430,-10); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(25036, 25040, 25034, 25035),50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
