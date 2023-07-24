function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Halt, beyond lies the home of the Kin, servants of the mighty Yelinak.  Be forewarned, those who would be enemies to the Kin, shall find themselves fodder for the cubes.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114581)) then
			eq.get_entity_list():GetMobByNpcTypeID(114581):Say("You had best speak with the herald before journeying deep into the Sky Shrine.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local helmet = item_lib.count_handed_item(e.self, e.trade, {29062});
	
	if(helmet > 0) then	
		repeat
			e.self:Say("Very good, you are on your way to proving yourself.");
			e.other:Faction(e.self,430,15);  	--CoV
			e.other:Faction(e.self,436,3);  	-- Yelinak
			e.other:Faction(e.self,448,-7); 	-- Kromzek
			e.other:QuestReward(e.self,0,0,0,0,0,10000);
			helmet = helmet - 1;
		until helmet == 0;
	end

	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 10) then
		e.self:Say("Pardon my intrusion master, but I bring you news from the gate.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114343)) then
			eq.get_entity_list():GetMobByNpcTypeID(114343):Say("It is all right Enots, what news do you bring me?");
			e.self:Say("My lord, outsiders have arrived at our gates.  They are of a race I have never seen.  Kcor is with them now attempting to discern their intent.");
			eq.get_entity_list():GetMobByNpcTypeID(114343):Say("That is alarming indeed, thank you for this information.  Please now return to your post and watch these outsiders.  Guardian Selbbep, please inform the council that I wish a meeting on this latest news.");
			e.self:Say("Very well, master. My will is but to obey the Kin.");
			eq.get_entity_list():GetMobByNpcTypeID(114535):Say("Yes my lord, right away.");
		end
	elseif(e.wp == 21) then
		e.self:Say("Herald Ziglark Whisperwing wishes an audience with the outsiders; please do not keep him waiting.");
		e.self:CastToNPC():StopWandering();
	end
end
