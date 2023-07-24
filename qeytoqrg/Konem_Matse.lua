function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, greetings, young " .. e.other:GetCleanName() .. ", how are you on this fine day? Perfect day for a nice stroll through the hills, if I do say so myself.");
	end	
end

function event_waypoint_arrive(e)
	if(e.wp == 2 or e.wp == 5) then
		eq.set_anim(4072,1);
	elseif(e.wp == 3) then
		eq.set_anim(4072,0);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18921})) then -- Message to Konem
		e.self:Say("Oh I see.. Phin's always after me about something.  I mean, it's not my fault the order hasn't come in yet.  Hey, since I'm so busy right now, why don't you be a friend and take this back to Phin for me, huh?");
		-- Confirmed Live Factions
		e.other:Faction(e.self,309,5,0); -- Silent Fist Clan
		e.other:Faction(e.self,262,1,0); -- Guards of Qeynos
		e.other:Faction(e.self,361,1,0); -- Ashen Order
		e.other:QuestReward(e.self,0,0,0,0,18922,1500); -- Grathin's Invoice
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
