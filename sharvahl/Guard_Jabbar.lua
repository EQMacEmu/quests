function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings! You wouldn't happen to be the one delivering the tea I requested from Ahlan, are you?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31766})) then
		e.self:Say("Ah the tea! I've been anxiously awaiting your arrival " .. e.other:GetCleanName() .. "! We'd almost run out of this wonderful Gravel leaf tea. Take this seal back to Ahlam, and give him my thanks.");
		eq.start(37);
		e.other:QuestReward(e.self,0,0,0,0,31775,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Time for dinner you wretches!");
	elseif(e.wp == 3) then
		e.self:Say("Wake up maggot, time for dinner!' Guard Jabbar places the meal on the endo fhte bed. The grimling feasts hungrily on it, drinking all the sedative tea in one gulp.");
	elseif(e.wp == 4) then
		e.self:Emote("kicks the sleeping grimling and sets down another meal tray on the stone bed.");
	elseif(e.wp == 7) then
		e.self:Emote("grunts at the grimling sitting in the corner and hands him the tray. The grimling fingers the food suspiciously for a moment and then begins to eat.");
	elseif(e.wp == 8) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(155209)) then
			e.self:Say("Get up Gendalic, time for your evening meal.");
			eq.get_entity_list():GetMobByNpcTypeID(155209):Emote("glances up from the ground but ignores Guard Jabbar and continues starying at the wall. He appears to be studying something. perhaps the design of the stones in the wall.");
		end
	elseif(e.wp == 9) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(155209)) then
			e.self:Emote("growls sending a shriver of fear up your spine. He methodically sets the tray down on the ledge and turns to face Gendalic. Quick as lightning, Guard Jabbar strikes Gendalic hard in teh lower back, causing him to lurch forward and smack his face against the wall.");
			eq.get_entity_list():GetMobByNpcTypeID(155209):Emote("cries out in pain and  and falls to the floor of the cell, guarding his face with his hands.  Guard Jabbar glares at him and mutters something under his breath as he turns and walks out of the cell.");
		end
	elseif(e.wp == 13) then
		eq.stop();
	end
end
