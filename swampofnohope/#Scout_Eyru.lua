function event_spawn(e)
	eq.set_timer("depop",3600000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9042})) then
		e.self:Say("Splendid job, " .. e.other:GetCleanName() .. ". This wrapping should help to shield you from any of the negative properties that may be manifested in the totem. You should be fine if you keep it in the box that you were given. Once you collect all of the totems, please seal the box and return it to Shar Vahl. Be careful to protect the totems during the course of your travels. The balance of power in several realms is reliant on your ability to fulfill this mission. Please do not fail us.");
		e.other:QuestReward(e.self,{items = {9043,9031},exp = 5000}); -- Item: Wrapped Alligator Totem
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
