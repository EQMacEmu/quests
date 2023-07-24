function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The boss might need some help!");
		local stanos = eq.get_entity_list():GetMobByNpcTypeID(5088); -- Stanos_Herkanor
		if ( stanos.valid ) then
			e.self:MoveTo(stanos:GetX(), stanos:GetY(), stanos:GetZ(), -1, false);
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yeah, hello. I'm Prak, co-owner of the Golden Rooster. If you're thirsty, we have some great imported ales at our bar. If you're looking for a little excitement, try your hand at a little King's Court. We aim to please, my friend.");
	elseif(e.message:findi("rid of stald")) then
		e.self:Say("Good.. Zannsin said you had a special talent for this sort of thing, so here's your chance to prove it. What you need to do is follow Stald on his patrol, and when the coast is clear, take him down. Good luck. Oh yeah.. not that I don't trust you or anything, but bring me back some sorta proof that Stald is dead, got it?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18795})) then
		e.self:Say("Hmm, I see. We think we've found out who the mole is in Carson's guards, some guy named Stald. We need to get rid of this guy as quickly, and as quietly, as possible. Carson doesn't want to cause a stink by eliminating one of his own men, so he asked us to do it. What about you? Do you think [you could get rid of Stald] for us?");
		e.other:Faction(e.self,329,50); -- Carson Mccabe
		e.other:Faction(e.self,336,37); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,304,-12); -- Ring of Scale
		e.other:Faction(e.self,332,50); -- Highpass Guards
		e.other:Faction(e.self,331,50); -- Merchants of Highpass
		eq.unique_spawn(5119,0,0,464,127,31.75,47); -- NPC: Guard_Stald
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	elseif(e.other:GetFactionValue(e.self) >= 200 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13793})) then
		e.self:Say("Ah, boy! Looks like I owe Kaden two plat... I thought you'd fumble it up for sure. Well, you've impressed me friend. Here, take this back to Zan... I'll make sure note your fine works to Carson, too, next time we speak.");
		e.other:Faction(e.self,329,50); -- Carson Mccabe
		e.other:Faction(e.self,336,37); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,304,-12); -- Ring of Scale
		e.other:Faction(e.self,332,50); -- Highpass Guards
		e.other:Faction(e.self,331,50); -- Merchants of Highpass
		e.other:QuestReward(e.self,0,0,0,0,18028,500); -- Item: Message to Zannsin
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
