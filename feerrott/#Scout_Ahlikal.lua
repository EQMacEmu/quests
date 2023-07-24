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

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9032})) then
		e.self:Say("Amazing work, " .. e.other:GetCleanName() .. "! We are all in your debt. I have wrapped the totem to prevent its harmful magic from affecting you. Please keep it in the box until you can return it to Elder Dumul. If you have not found the other spirits, please seek them out. If you have filled the container, please seal it and return to Shar Vahl. Here is your seal. May the spirits watch over you.");
		e.other:QuestReward(e.self,{items = {9031,9033},exp = 5000}); -- Item: Official Seal of the Khati Sha, Wrapped Spider Totem
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end