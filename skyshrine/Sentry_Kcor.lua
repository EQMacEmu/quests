function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Halt, who goes there? Hmmm. What manner of strangers are you? Let it be known that the Kin hold no love for outsiders, only those truly worthy may walk amongst the Kin.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114566) and eq.get_entity_list():GetMobByNpcTypeID(114566):GetX() == -686 and eq.get_entity_list():GetMobByNpcTypeID(114566):GetY() == 50) then
			eq.get_entity_list():GetMobByNpcTypeID(114566):Say("It was because of an outsider that the dragons were forced to flee. Outsiders must not be trusted.");
			e.self:Say("Perhaps, but then again these strangers may be worthy of our trust unlike that vile Kragen Morshire, perhaps we should give them a chance to prove themselves truly worthy to walk amongst the Kin.");
			eq.get_entity_list():GetMobByNpcTypeID(114566):Say("Perhaps you are right Kcor, but we will see. ");
		end
	elseif(e.message:findi("worthy")) then
		e.self:Say("The vile giants, their hearts colder than the ice of Velious, wish to slay our kind and take the land for their own.  Their warriors wear helms of the finest steel, should you slay these warriors, return their helms and your worth to the Kin shall grow.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(114566) and eq.get_entity_list():GetMobByNpcTypeID(114566):GetX() == -686 and eq.get_entity_list():GetMobByNpcTypeID(114566):GetY() == 50) then
			eq.get_entity_list():GetMobByNpcTypeID(114566):Say("I must speak with the Herald, Kcor please see to the gate until I return.");
			eq.get_entity_list():GetMobByNpcTypeID(114566):CastToNPC():AssignWaypoints(1);
			e.self:Say("Very well, Enots, but do not be long. Lord Yelinak would have your hide should invaders arrive while you are not at your post.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local helmet = item_lib.count_handed_item(e.self, e.trade, {29062});
	local storm_toe = item_lib.count_handed_item(e.self, e.trade, {29124});
	local assignment = item_lib.count_handed_item(e.self, e.trade, {29624});
	local frost_toe = item_lib.count_handed_item(e.self, e.trade, {29125});
	
	if(helmet > 0) then	
	-- Confirmed Live Experience reward from Lieutenant Miliven
		repeat
			e.self:Say("Very good, you are on your way to proving yourself.");
			e.other:Faction(e.self,430,15);  	--CoV
			e.other:Faction(e.self,436,3);  	-- Yelinak
			e.other:Faction(e.self,448,-7); 	-- Kromzek
			e.other:QuestReward(e.self,0,0,0,0,0,10000);
			helmet = helmet - 1;
		until helmet == 0;
	elseif(storm_toe > 0) then	
	-- Confirmed Live Experience reward from Lieutenant Miliven
		repeat
			e.self:Say("Ahh these will go nicely with the rest of my collection.  Here is a small reward for your trouble.");
			e.other:Faction(e.self,430,10);  	--CoV
			e.other:Faction(e.self,436,2);  	-- Yelinak
			e.other:Faction(e.self,448,-5); 	-- Kromzek
			e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(10),0,10000);
			storm_toe = storm_toe - 1;
		until storm_toe == 0;
	elseif(assignment > 0) then	
		repeat
			e.self:Say("Ahhh yes! Well done " .. e.other:Race() .. ". Here is your reward. Your status with our people grows with each interloper you eradicate.");
			e.other:Faction(e.self,430,5);  	--CoV
			e.other:Faction(e.self,436,1);  	-- Yelinak
			e.other:Faction(e.self,448,-2); 	-- Kromzek
			e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(5),0,5000);
			assignment = assignment - 1;
		until assignment == 0;
	elseif(frost_toe > 0) then	
		repeat
			e.self:Say("Ahh these will go nicely with the rest of my collection.  Here is a small reward for your trouble.");
			e.other:Faction(e.self,430,5);  	--CoV
			e.other:Faction(e.self,436,1);  	-- Yelinak
			e.other:Faction(e.self,448,-2); 	-- Kromzek
			e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(5),0,5000);
			frost_toe = frost_toe - 1;
		until frost_toe == 0;
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
