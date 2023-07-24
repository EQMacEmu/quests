function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("hail")) then
			e.self:Say("You have entered the sacred temple of Tallon Zek. This is the Temple of Tactics, where we teach what must be done to achieve goals in the most efficient manner.");
		elseif(e.message:findi("teach")) then
			e.self:Say("I cannot teach one of your kind the arts of war. I must teach the other Kromzek at this time. If you were to serve the Temple of Tactics I might consider giving you a few words of wisdom.");
		elseif(e.message:findi("serve the temple")) then
			e.self:Say("The great father of war, Rallos Zek, wishes the destruction of the inferior race known as the Coldain. As the high priest of Tallon Zek, I see that they use great tactics to evade destruction. Find the ones who teach these tactics to the other Coldain and bring back the books that contain the ancient Coldain tactics and strategies. Do not waste my time without a scroll or book that those tiny beasts hold.");
		end
	elseif(e.other:GetFaction(e.self) < 6) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and (item_lib.check_turn_in(e.self, e.trade, {item1 = 24987}, 0) or item_lib.check_turn_in(e.self, e.trade, {item1 = 24988}, 0))) then
		e.self:Say("You are a brave little beast to gain this tome. Let me impart a bit of wisdom to you. Tactics must change - if you do not ever adapt to new surroundings, environments and rules, you will surely perish.");
		e.other:Faction(e.self,448,20); -- Faction: Kromzek
		e.other:Faction(e.self,419,5); -- Faction: Kromrif
		e.other:Faction(e.self,429,5); -- Faction: King Tormax
		e.other:Faction(e.self,430,-10); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(25037,25038,25039,25042),50000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

