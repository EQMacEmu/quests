function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Rrrroarrrrr...");	
	end
end

function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	if(e.timer == "follow") then
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(30061);
		
		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob);
			eq.stop_timer("follow");
		end
	end
end

function event_combat(e)
	if(e.joined == true) then
		e.self:Say("Grrroarrr !!");
		eq.signal(30061,1); -- NPC: Tundra_Jack
	else
		eq.signal(30061,3); -- NPC: Tundra_Jack
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12221})) then
		e.self:Emote("growls with happiness and licks your face.  Just enough time to swipe the sweaty shirt from his collar!!  Iceberg then runs off to enjoy his lion delight!!");
		eq.signal(30061,2); -- NPC: Tundra_Jack
		-- Confirmed Live Factions
		e.other:Faction(e.self,320,2,0); -- Faction: Wolves of the North
		e.other:Faction(e.self,327,1,0); -- Faction: Shamen of Justice
		e.other:Faction(e.self,328,1,0); -- Faction: Merchants of Halas
		e.other:Faction(e.self,311,1,0); -- Faction: Steel Warriors
		e.other:QuestReward(e.self,0,0,0,0,12226,1000); -- Item: Sweaty Shirt
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:everfrost  ID:30046 -- Iceberg 
