function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("clicks as a plate slides to the side revealing a hose that extends and sucks up an item from the ground");
		end
	end	
end

function event_say(e)
	if (e.message:findi("628")) then
		e.self:Emote(".wizz.click.628.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 12164})) then -- Scrubber Key
		e.self:Emote(".wizz.click.628.");
		-- verified live faction
		e.other:Faction(e.self,695,-5,0); -- Clockwork Gnome
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(12162,12167));  -- Gnome Take (Good or Bad)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
