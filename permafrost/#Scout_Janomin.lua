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

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9036})) then
		e.self:Say("Perfect work, " .. e.other:GetCleanName() .. "! I am glad the Elders made such a wise choice in sending you. I must admit, I was rather scared during the exploration of these halls. This lair is quite foul, quite foul indeed! Take this wrapped totem and place it in the case that you were given. Once you have all of the totems, seal the case and make your way back to Shar Vahl. I work my way back as well. Thank you again. ");
		e.other:QuestReward(e.self,{items = {9037,9031}}); -- Items: Wrapped Ice Bear Totem, Official Seal of the Khati Sha
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
