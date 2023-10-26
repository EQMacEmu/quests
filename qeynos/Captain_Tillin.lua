function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! Spend your time wisely in the city of Qeynos. Do not let your mind wander to thoughts of bravado or crime. My guards can easily put to rest any outbreaks. Good day to you, citizen!");
	elseif(e.message:findi("executioner")) then
		e.self:Say("The executioner is quite an exceptional person.  [Field Marshall Ralem] happened upon her while on a secret operation in Everfrost Peaks.  They fought side by side against some creature the locals named Iceberg.  The creature escaped.  Ralem was grateful and eventually recruited her when she decided to separate from the guards of Halas.");
	elseif(e.message:findi("field marshall ralem")) then
		e.self:Say("Field Marshall Ralem Christof is in charge of a brigade of roving rangers, druids and warriors.  He hails from the Jaggedpine.  He is quite an exceptional ranger.  No one is ever really sure where he is.  His brigade is constantly on the move.");
	elseif(e.message:findi("antonius")) then
		e.self:Say("Antonius Bayle is the governor of this great city.  He may well be the most powerful man in all of Norrath.  You just might bump into him on the streets of Qeynos.  He likes to walk among the citizens from time to time.");
	elseif(e.message:findi("kane")) then
		e.self:Say("Commander Kane Bayle is the highest ranking officer in the Qeynos Guard.  He reports only to Antonius Bayle, his older brother.  You may find Commander Kane in the guardhouse by the city gates, but do not disturb him.  He is a very busy man.");
	elseif(e.message:findi("linariu")) then
		e.self:Say("Captain Linarius Graffe is in charge of all the Tower Guards of Qeynos.  Every guard tower from the hills of Qeynos to the plains of Karana is under his control.  He commands his guards from a great bridge keep in northern Karana.");		
	elseif(e.message:findi("corrupt.* guard")) then
		e.self:Say("Corruption among my guards!  Are you mad?  Begone with your wild accusations!");
	end
end

function event_signal(e)
	e.self:Say("Ah.  Good.  You have arrived.  [Executioner], could you please visit McNeal Jocub at Fish's Tavern.  He has violated our laws and the sentence is death.");
	eq.signal(1202);
end

function event_trade(e)
	local fang = 0;
	
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 13915, item3 = 13915, item4 = 13915}, 0)) then -- Gnoll Fang
		fang = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 13915, item3 = 13915}, 0)) then	
		fang = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915, item2 = 13915}, 0)) then
		fang = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13915}, 0)) then
		fang = 1;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18815}, 0)) then
		e.self:Say("I heard you were on your way. I have called for the state [executioner]. She should be on her way now. She will deal with our friend, McNeal Jocub. Thank you for your help, citizen.");
		e.other:Faction(e.self,262,40,0); -- Guards of Qeynos
		e.other:Faction(e.self,219,6,0); -- Antonius Bayle
		e.other:Faction(e.self,230,-6,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,223,-10,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,4,0); -- Merchants of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(9),math.random(13),1,13305,500);
		eq.unique_spawn(1202,62,0,-412,75,-24,0); -- NPC: Executioner
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 18912}, 0)) then
		e.self:Say("So, an assassin has been sent to Qeynos! I shall have my guards keep an eye out for any suspicious looking visitors. As for you... you should speak with the Surefall Glade ambassador. Ambassador Gash is staying at the Lion's Mane Inn here in South Qeynos. Inform him that [an assassin has been sent to kill] him. Do not let the assassin near him!");
		-- confirmed live factions
		e.other:Faction(e.self,262,5,0); -- Guards of Qeynos
		e.other:Faction(e.self,219,1,0); -- Antonius Bayle
		e.other:Faction(e.self,230,-1,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,223,-1,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,1,0); -- Merchants of Qeynos
		e.other:QuestReward(e.self,math.random(10),math.random(9),math.random(5),0,0,500);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8280}, 0)) then
		e.self:Emote("scans the report with a furrowed brow. 'So the threat is worse then we had anticipated. The intelligence we have gathere is true. We have little time, return to Sergeant Caelin and give him these orders. Time is of the essence. Hurry now, these people are in grave danger and something must be done to stop this!");
		e.other:QuestReward(e.self,0,0,0,0,8287);
	end
	
	if(fang > 0) then
		repeat
			e.self:Say("Very good! One less gnoll the people of Qeynos need to fear. Here is your bounty as promised.");
			-- confirmed live factions
			e.other:Faction(e.self,262,3); -- Guards of Qeynos
			e.other:Faction(e.self,219,1); -- Antonius Bayle
			e.other:Faction(e.self,230,-1); -- Corrupt Qeynos Guards
			e.other:Faction(e.self,223,-1); -- Circle of Unseen Hands
			e.other:Faction(e.self,291,1); -- Merchants of Qeynos
			e.other:QuestReward(e.self,0,0,0,0,10070,4500);
			fang = fang - 1;
		until fang == 0
	end		
	
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1077 -- Captain_Tillin
