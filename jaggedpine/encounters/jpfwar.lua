local	gnoll00 = nil;
local	gnoll01 = nil;
local	gnoll02 = nil;
local	gnoll03 = nil;
local	gnoll04 = nil;
local	gnoll05 = nil;
local	gnoll06 = nil;
local	gnoll07 = nil;
local	gnoll08 = nil;
local	gnoll09 = nil;
local	gnoll10 = nil;
local	gnoll11 = nil;
local	gnoll12 = nil;
local	gnoll13 = nil;
local	gnoll14 = nil;
local	gnoll15 = nil;
local	gnoll16 = nil;
local	gnoll17 = nil;
local	gnoll18 = nil;
local	gnoll19 = nil;
local	gnoll20 = nil;
local	gnoll21 = nil;
local	gnoll22 = nil;
local	gnoll23 = nil;
local	gnoll24 = nil;
local	gnoll25 = nil;
local	gnoll26 = nil;
local	gnoll27 = nil;
local	gnoll28 = nil;
local	gnoll29 = nil;
local	gnoll30 = nil;
local	gnoll31 = nil;
local	gnoll32 = nil;
local	gnoll33 = nil;
local	gnoll34 = nil;
local	gnoll35 = nil;
local	gnoll36 = nil;
local	gnoll37 = nil;
local	gnoll38 = nil;
local	gnoll39 = nil;
local	gnoll40 = nil;
local	gnoll41 = nil;
local	gnoll42 = nil;
local	gnoll43 = nil;
local	gnoll44 = nil;
local	assassin1 = nil;
local	assassin2 = nil;
local	assassin3 = nil;
local	assassin4 = nil;
local	jardor = nil;

local	gnoll = 0;
local 	gnollcount = 0;
local	villagedeathcount = 0;


local VILLAGE_WAR_SPAWN = {
	181019, -- ##Shayna_Thunderhand
	181020, -- ##Kaithys_Galestrider
	181021, -- ##Annous_Pineshadow
	181023, -- ##Lady_Deira	
	181024,  -- ##Nolan_Greenwood
	181025, -- ##Cheyloh_Greenwood
	181026, -- ##Guard_Finewine
	181027, -- ##Guard_Bossamir
	181029,  -- ##Jeremy_Leafrunner
	181031, -- ##Derick_Goodroot
	181033, -- ##Cathleen_Goodroot
	181034, -- ##Selia_Wetstone
	181035, -- ##Morgan_Wetstone
	181036, -- ##Tallien_Brightflash
	181038, -- ##Nerdala_Darkcloud
	181040, -- ##Pergan_Darkcloud
	181041, -- ##Banker_Mardalson
	181042, -- ##Ralleford_Twothorns
	181045, -- ##Donna_Twothorns
	181046, -- ##Diedra_Twothorns
};

function BarducksDeath(e)
	eq.signal(181192,1);
end

function ResetSpawn(e)
	gnollcount = 0;
	villagedeathcount = 0;
end

function WarSignal(e)
	if(e.signal == 1) then
		eq.set_timer("timertostart",300000);
	elseif(e.signal == 2) then
		eq.stop_timer("gnollspawn");
		eq.set_timer("WarEnd",600000);
	elseif(e.signal == 3) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181041)) then
			eq.get_entity_list():GetMobByNpcTypeID(181041):Say("Another one down, someone help! Quickly!");
		elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181026)) then
			eq.get_entity_list():GetMobByNpcTypeID(181026):Say("I'm next, I just know it!");
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181028)) then
			eq.get_entity_list():GetMobByNpcTypeID(181028):Say("The gnolls have broken through! Regroup and try harder or we're doomed!");
		end
	elseif(e.signal == 4) then
		eq.spawn2(181028,0,0,1988,1084,-11,196); -- ##Sergeant_Caelin
		gnoll = 0;
		villagedeathcount = 0;
		eq.set_timer("gnollspawn",3000);
	end
end

function WarTimer(e)
	if(e.timer == "timertostart") then
		eq.stop_timer("timertostart");
		eq.zone_emote(0,"The sound of war drums echo through the forest and a rough inhuman voice calls out a war cry. 'Brothers, now is the time of our revenge! Destroy the human settlement and claim it as our own! For Barducks and clan Darkpaw!'");
		eq.set_timer("gnollspawn",3000);
	elseif(e.timer == "WarEnd") then
		eq.stop_timer("WarEnd");
		gnollcount = 0;
		villagedeathcount = 0;
		eq.depop_all(181016);
		eq.depop_all(181047);
		for _, id in ipairs(VILLAGE_WAR_SPAWN) do
			eq.depop(id);
		end
	elseif(e.timer == "gnollspawn") then
		gnollcount = gnollcount + 1;
		gnoll = 181016;
		if(gnollcount == 1) then
			VillageWarSpawn(e);
			StaticVillageDepop(e);
		elseif(gnollcount == 2) then
			gnoll00 = GnollSpawnLocation(spn);		
		elseif(gnollcount == 3) then
			gnoll01 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll00:GetID())) then
				gnoll00:CastToNPC():MoveTo(1878,1086,-10,0,true);
			end			
		elseif(gnollcount == 4) then
			gnoll02 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll01:GetID())) then
				gnoll01:CastToNPC():MoveTo(1840,1078,-10,0,true);
			end			
		elseif(gnollcount == 5) then
			gnoll03 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll02:GetID())) then
				gnoll02:CastToNPC():MoveTo(1892,1053,-10,0,true);
			end			
		elseif(gnollcount == 6) then
			gnoll04 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll03:GetID())) then
				gnoll03:CastToNPC():MoveTo(2059,1055,-11,0,true);
			end			
		elseif(gnollcount == 7) then
			gnoll05 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll04:GetID())) then
				gnoll04:CastToNPC():MoveTo(2096,1072,-11,0,true);
			end			
		elseif(gnollcount == 8) then
			gnoll06 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll05:GetID())) then
				gnoll05:CastToNPC():MoveTo(2096,1079,-11,0,true);
			end			
		elseif(gnollcount == 9) then
			gnoll07 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll06:GetID())) then
				gnoll06:CastToNPC():MoveTo(2013,1090,-11,0,true);
			end			
		elseif(gnollcount == 10) then
			gnoll08 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll07:GetID())) then
				gnoll07:CastToNPC():MoveTo(2016,1108,-11,0,true);
			end			
		elseif(gnollcount == 11) then
			gnoll09 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll08:GetID())) then
				gnoll08:CastToNPC():MoveTo(2049,1123,-11,0,true);
			end			
		elseif(gnollcount == 12) then
			gnoll10 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll09:GetID())) then
				gnoll09:CastToNPC():MoveTo(1919,1259,-11,0,true);
			end			
		elseif(gnollcount == 13) then
			gnoll11 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll10:GetID())) then
				gnoll10:CastToNPC():MoveTo(1953,1329,-11,0,true);
			end			
		elseif(gnollcount == 14) then
			gnoll12 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll11:GetID())) then
				gnoll11:CastToNPC():MoveTo(2048,1211,-12,0,true);
			end			
		elseif(gnollcount == 15) then
			gnoll13 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll12:GetID())) then
				gnoll12:CastToNPC():MoveTo(1981,957,-12,0,true);
			end			
		elseif(gnollcount == 16) then
			gnoll14 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll13:GetID())) then
				gnoll13:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
		elseif(gnollcount == 17) then
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll14:GetID())) then
				gnoll14:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
			eq.set_timer("gnollspawn",245000);
		elseif(gnollcount == 18) then
			gnoll15 = GnollSpawnLocation(spn);
		elseif(gnollcount == 19) then
			gnoll16 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll15:GetID())) then
				gnoll15:CastToNPC():MoveTo(1878,1086,-10,0,true);
			end
		elseif(gnollcount == 20) then
			gnoll17 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll16:GetID())) then
				gnoll16:CastToNPC():MoveTo(1840,1078,-10,0,true);
			end			
		elseif(gnollcount == 21) then
			gnoll18 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll17:GetID())) then
				gnoll17:CastToNPC():MoveTo(1892,1053,-10,0,true);
			end			
		elseif(gnollcount == 22) then
			gnoll19 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll18:GetID())) then
				gnoll18:CastToNPC():MoveTo(2059,1055,-11,0,true);
			end			
		elseif(gnollcount == 23) then
			gnoll20 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll19:GetID())) then
				gnoll19:CastToNPC():MoveTo(2096,1072,-11,0,true);
			end			
		elseif(gnollcount == 24) then
			gnoll21 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll20:GetID())) then
				gnoll20:CastToNPC():MoveTo(2096,1079,-11,0,true);
			end			
		elseif(gnollcount == 25) then
			gnoll22 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll21:GetID())) then
				gnoll21:CastToNPC():MoveTo(2013,1090,-11,0,true);
			end			
		elseif(gnollcount == 26) then
			gnoll23 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll22:GetID())) then
				gnoll22:CastToNPC():MoveTo(2016,1108,-11,0,true);
			end			
		elseif(gnollcount == 27) then
			gnoll24 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll23:GetID())) then
				gnoll23:CastToNPC():MoveTo(2049,1123,-11,0,true);
			end			
		elseif(gnollcount == 28) then
			gnoll25 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll24:GetID())) then
				gnoll24:CastToNPC():MoveTo(1919,1259,-11,0,true);
			end			
		elseif(gnollcount == 29) then
			gnoll26 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll25:GetID())) then
				gnoll25:CastToNPC():MoveTo(1953,1329,-11,0,true);
			end			
		elseif(gnollcount == 30) then
			gnoll27 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll26:GetID())) then
				gnoll26:CastToNPC():MoveTo(2048,1211,-12,0,true);
			end			
		elseif(gnollcount == 31) then
			gnoll28 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll27:GetID())) then
				gnoll27:CastToNPC():MoveTo(1981,957,-12,0,true);
			end			
		elseif(gnollcount == 32) then
			gnoll29 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll28:GetID())) then
				gnoll28:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
		elseif(gnollcount == 33) then
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll29:GetID())) then
				gnoll29:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
			eq.set_timer("gnollspawn",245000);
		elseif(gnollcount == 34) then
			gnoll30 = GnollSpawnLocation(spn);	
		elseif(gnollcount == 35) then
			gnoll31 = GnollSpawnLocation(spn);
			assassin1 =	eq.spawn2(181047,0,0,2027,1140,-12,0);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll30:GetID())) then
				gnoll30:CastToNPC():MoveTo(1878,1086,-10,0,true);
			end			
		elseif(gnollcount == 36) then
			gnoll32 = GnollSpawnLocation(spn);
			assassin2 = eq.spawn2(181047,0,0,1852,1269,-12,0);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll31:GetID())) then
				gnoll31:CastToNPC():MoveTo(1840,1078,-10,0,true);
			end
			if(eq.get_entity_list():IsMobSpawnedByEntityID(assassin1:GetID())) then
				assassin1:CastToNPC():MoveTo(2013,1090,-11,0,true);
			end			
		elseif(gnollcount == 37) then
			gnoll33 = GnollSpawnLocation(spn);
			assassin3 = eq.spawn2(181047,0,0,1794,1042,-12,0);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll32:GetID())) then
				gnoll32:CastToNPC():MoveTo(1892,1053,-10,0,true);
			end
			if(eq.get_entity_list():IsMobSpawnedByEntityID(assassin2:GetID())) then
				assassin2:CastToNPC():MoveTo(1953,1329,-11,0,true);
			end			
		elseif(gnollcount == 38) then
			gnoll34 = GnollSpawnLocation(spn);
			assassin4 =	eq.spawn2(181047,0,0,2031,1148,-12,0);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll33:GetID())) then
				gnoll33:CastToNPC():MoveTo(2059,1055,-11,0,true);
			end		
			if(eq.get_entity_list():IsMobSpawnedByEntityID(assassin3:GetID())) then
				assassin3:CastToNPC():MoveTo(1892,-829,-10,0,true);
			end	
		elseif(gnollcount == 39) then
			gnoll35 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll34:GetID())) then
				gnoll34:CastToNPC():MoveTo(2096,1072,-11,0,true);
			end		
			if(eq.get_entity_list():IsMobSpawnedByEntityID(assassin4:GetID())) then
				assassin4:CastToNPC():MoveTo(2096,1072,-11,0,true);
			end			
		elseif(gnollcount == 40) then
			gnoll36 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll35:GetID())) then
				gnoll35:CastToNPC():MoveTo(2096,1079,-11,0,true);
			end			
		elseif(gnollcount == 41) then
			gnoll37 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll36:GetID())) then
				gnoll36:CastToNPC():MoveTo(2013,1090,-11,0,true);
			end			
		elseif(gnollcount == 42) then
			gnoll38 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll37:GetID())) then
				gnoll37:CastToNPC():MoveTo(2016,1108,-11,0,true);
			end			
		elseif(gnollcount == 43) then
			gnoll39 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll38:GetID())) then
				gnoll38:CastToNPC():MoveTo(2049,1123,-11,0,true);
			end			
		elseif(gnollcount == 44) then
			gnoll40 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll39:GetID())) then
				gnoll39:CastToNPC():MoveTo(1919,1259,-11,0,true);
			end			
		elseif(gnollcount == 45) then
			gnoll41 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll40:GetID())) then
				gnoll40:CastToNPC():MoveTo(1953,1329,-11,0,true);
			end			
		elseif(gnollcount == 46) then
			gnoll42 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll41:GetID())) then
				gnoll41:CastToNPC():MoveTo(2048,1211,-12,0,true);
			end			
		elseif(gnollcount == 47) then
			gnoll43 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll42:GetID())) then
				gnoll42:CastToNPC():MoveTo(1981,957,-12,0,true);
			end			
		elseif(gnollcount == 48) then
			gnoll44 = GnollSpawnLocation(spn);
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll43:GetID())) then
				gnoll43:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
		elseif(gnollcount == 49) then
			if(eq.get_entity_list():IsMobSpawnedByEntityID(gnoll44:GetID())) then
				gnoll44:CastToNPC():MoveTo(1994,1084,-11,0,true);
			end
			eq.set_timer("gnollspawn",245000);
		elseif(gnollcount == 50) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181028) and villagedeathcount == 0) then
				gnoll = 181049;
				eq.stop_timer("gnollspawn");
				eq.zone_emote(0,"an inhuman voice screams from the distance, 'You may have defeated some of my brothers but clan Darkpaw is far from broken!  Prepare yourselves, for you shall soon know my wrath!'");
				jardor = GnollSpawnLocation(spn);
				eq.depop(181028);
				jardor:CastToNPC():AssignWaypoints(42);
			end
		elseif(gnollcount == 51) then
			eq.stop_timer("gnollspawn");
			eq.set_timer("FinalWarEnd",900000);
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181028)) then
				if(villagedeathcount >= 5) then
					eq.get_entity_list():GetMobByNpcTypeID(181028):Shout("It appears the gnolls have been routed but at what a cost? Many of the innocents I have sworn to protect have perished this day. Karana forgive my dreadful failure. If you can show me that you assisted in defense of the fort, you shall be compensated.");
				elseif(villagedeathcount > 0) then
					eq.get_entity_list():GetMobByNpcTypeID(181028):Shout("It appears the gnolls have been routed. Alas some of the residents of Fort Jaggedpine have perished. Those who can present proof they have helped in defending the fort this day shall be rewarded.");
				elseif(villagedeathcount == 0) then
					eq.get_entity_list():GetMobByNpcTypeID(181028):Shout("It appears the gnolls have been routed with nary a casualty to report! My thanks to everyone, all that can prove they have assisted with this spectacular victory shall be richly rewarded!");
				end
				eq.depop_all(181016);
				eq.depop_all(181047);
				eq.unique_spawn(181048,0,0,1988,1084,-11,196);
				eq.depop(181028);
			end
		end
	elseif(e.timer == "FinalWarEnd") then
		eq.stop_timer("FinalWarEnd");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(181048)) then
			eq.get_entity_list():GetMobByNpcTypeID(181048):Say("What a day. I'm going to rest now. Thank you everyone.");
		end
		gnollcount = 0;
		villagedeathcount = 0;
		eq.depop(181048);
		for _, id in ipairs(VILLAGE_WAR_SPAWN) do
			eq.depop(id);
		end
	end
end

function GnollSpawn(e)
	e.self:SetRunning(true);
end

function SergeantDeath(e)
	eq.signal(181192,2);
end

function SergeantSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". If you're not good with a weapon, fast with a spell or strong at heart I suggest you run with all haste away from this place. If you are however, we could really use some help to protect these people and I may be able to compensate you for your efforts. That is... If we survive the battle of course.");
	end
end

function DeathCount(e)
	villagedeathcount = villagedeathcount + 1;
	eq.signal(181192,3);
end

function SergeantTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8368})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8389,8392),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8384,8389),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8384,8376),15000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8369})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8390,8393),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8385,8390),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8385,8377),15000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8370})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9187,8394),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9174,9187),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9174,8378),15000); 
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8371})) then -- mnk / bst
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8391,8395),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8386,8391),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8386,8391),15000); -- need tier 1 item
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8372})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9189,8396),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8388,9189),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8388,8380),15000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8373})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9190,8397),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8387,9190),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8387,8381),15000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8374})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9191,8398),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9191,9186),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(8382,9186),15000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8375})) then
		if(villagedeathcount >= 5) then
			ThirdTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9188,8399),5000);
		elseif(villagedeathcount > 0) then
			SecondTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9185,9188),10000);
		elseif(villagedeathcount == 0) then
			FirstTier(e);
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(9185,8383),15000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function JardorSpawn(e)
	e.self:SetRunning(true);
end

function JardorWaypoint(e)
	if(e.wp == 2) then
		eq.signal(181192,4);
	end
end

function JardorDeath(e)
	eq.signal(181192,4);
end

function JardorCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function ThirdTier(e)
	e.self:Say("You are brave and a valiant one, " .. e.other:GetCleanName() .. ". Alas, the people whom I have been sworn to protect have been mostly wiped out. Take this as a token of my gratitude for your assistance today.");
	e.other:Faction(e.self,1597,10);  -- Residents of Jaggedpine
	e.other:Faction(e.self,272,5);  -- Jaggedpine Treefolk
	e.other:Faction(e.self,302,5);  -- Protectors of Pine
	e.other:Faction(e.self,262,1);  -- Guards of Qeynos
end

function SecondTier(e)
	e.self:Say("Thank you for your help. Without you, things may have been much worse. Loss of life is a tragic thing indeed. Wear this in remembrance of this day.");
	e.other:Faction(e.self,1597,25);  -- Residents of Jaggedpine
	e.other:Faction(e.self,272,12);  -- Jaggedpine Treefolk
	e.other:Faction(e.self,302,12);  -- Protectors of Pine
	e.other:Faction(e.self,262,2);  -- Guards of Qeynos
end

function FirstTier(e)
	e.self:Say("That was excellent work on your part! Take this as your reward, we all owe you our lives!");
	e.other:Faction(e.self,1597,50);  -- Residents of Jaggedpine
	e.other:Faction(e.self,272,25);  -- Jaggedpine Treefolk
	e.other:Faction(e.self,302,25);  -- Protectors of Pine
	e.other:Faction(e.self,262,5);  -- Guards of Qeynos
end

function VillageWarSpawn(e)
	eq.spawn2(181019,0,0,2083,1120,-11,104); -- ##Shayna_Thunderhand
	eq.spawn2(181020,0,0,1895,1007,-11,127); -- ##Kaithys_Galestrider
	eq.spawn2(181021,0,0,2074,1206,-12,208); -- ##Annous_Pineshadow
	eq.spawn2(181023,0,0,1970,1233,-11,126); -- ##Lady_Deira	
	eq.spawn2(181024,0,0,1820,1064,-10,64);  -- ##Nolan_Greenwood
	eq.spawn2(181025,0,0,1967,1267,-11,126); -- ##Cheyloh_Greenwood
	eq.spawn2(181026,0,0,1931,1225,-11,131); -- ##Guard_Finewine
	eq.spawn2(181027,0,0,1856,1000,-10,130); -- ##Guard_Bossamir
	eq.spawn2(181028,0,0,1988,1084,-11,196); -- ##Sergeant_Caelin
	eq.spawn2(181029,0,0,1981,957,-13,227);  -- ##Jeremy_Leafrunner
	eq.spawn2(181031,0,0,1953,1329,-11,132); -- ##Derick_Goodroot
	eq.spawn2(181033,0,0,1919,1259,-11,3);   -- ##Cathleen_Goodroot
	eq.spawn2(181034,0,0,2049,1115,-11,137); -- ##Selia_Wetstone
	eq.spawn2(181035,0,0,2020,1108,-11,72);  -- ##Morgan_Wetstone
	eq.spawn2(181036,0,0,2020,1090,-11,72);  -- ##Tallien_Brightflash
	eq.spawn2(181038,0,0,2088,1079,-11,197); -- ##Nerdala_Darkcloud
	eq.spawn2(181040,0,0,2088,1072,-11,197); -- ##Pergan_Darkcloud
	eq.spawn2(181041,0,0,2059,1055,-11,6);   -- ##Banker_Mardalson
	eq.spawn2(181042,0,0,1892,1053,-10,194); -- ##Ralleford_Twothorns
	eq.spawn2(181045,0,0,1840,1078,-10,10);  -- ##Donna_Twothorns
	eq.spawn2(181046,0,0,1878,1086,-10,137); -- ##Diedra_Twothorns
end

function StaticVillageDepop(e)
	eq.depop_with_timer(181175);
	eq.depop_with_timer(181205);
	eq.depop_with_timer(181166);
	eq.depop_with_timer(181103);
	eq.depop_with_timer(181085);
	eq.depop_with_timer(181086);
	eq.depop_with_timer(181173);
	eq.depop_with_timer(181195);
	eq.depop_with_timer(181206);
	eq.depop_with_timer(181090);
	eq.depop_with_timer(181160);
	eq.depop_with_timer(181180);
	eq.depop_with_timer(181182);
	eq.depop_with_timer(181203);
	eq.depop_with_timer(181210);
	eq.depop_with_timer(181165);
	eq.depop_with_timer(181179);
	eq.depop_with_timer(181099);
	eq.depop_with_timer(181183);
	eq.depop_with_timer(181163);
	eq.depop_with_timer(181161);
end

function GnollSpawnLocation(spn)
	gnollspawn = math.random(80);
	if(gnollspawn < 2) then
		spn = eq.spawn2(gnoll,0,0,732,1382,-29,0);
	elseif(gnollspawn < 4) then
		spn = eq.spawn2(gnoll,0,0,354,-951,-28,0);
	elseif(gnollspawn < 6) then
		spn = eq.spawn2(gnoll,0,0,913,688,-19,0);
	elseif(gnollspawn < 8) then
		spn = eq.spawn2(gnoll,0,0,1562,1481,11,0);
	elseif(gnollspawn < 10) then
		spn = eq.spawn2(gnoll,0,0,255,-823,-12,0);
	elseif(gnollspawn < 12) then
		spn = eq.spawn2(gnoll,0,0,434,998,-19,0);
	elseif(gnollspawn < 14) then
		spn = eq.spawn2(gnoll,0,0,419,1288,-13,0);
	elseif(gnollspawn < 16) then
		spn = eq.spawn2(gnoll,0,0,1171,-1292,14,0);
	elseif(gnollspawn < 18) then
		spn = eq.spawn2(gnoll,0,0,260,436,-22,0);
	elseif(gnollspawn < 20) then
		spn = eq.spawn2(gnoll,0,0,435,-1772,-12,0);
	elseif(gnollspawn < 22) then
		spn = eq.spawn2(gnoll,0,0,467,1841,-20,0);
	elseif(gnollspawn < 24) then
		spn = eq.spawn2(gnoll,0,0,1028,-1872,25,0);
	elseif(gnollspawn < 26) then
		spn = eq.spawn2(gnoll,0,0,684,950,-30,0);
	elseif(gnollspawn < 28) then
		spn = eq.spawn2(gnoll,0,0,643,347,-21,0);
	elseif(gnollspawn < 30) then
		spn = eq.spawn2(gnoll,0,0,1302,-1641,-13,0);
	elseif(gnollspawn < 32) then
		spn = eq.spawn2(gnoll,0,0,348,557,-18,0);
	elseif(gnollspawn < 34) then
		spn = eq.spawn2(gnoll,0,0,772,220,-15,0);
	elseif(gnollspawn < 36) then
		spn = eq.spawn2(gnoll,0,0,594,-391,29,0);
	elseif(gnollspawn < 38) then
		spn = eq.spawn2(gnoll,0,0,1277,-117,-19,0);
	elseif(gnollspawn < 40) then
		spn = eq.spawn2(gnoll,0,0,475,294,-18,0);
	elseif(gnollspawn < 42) then
		spn = eq.spawn2(gnoll,0,0,209,1522,-28,0);
	elseif(gnollspawn < 44) then
		spn = eq.spawn2(gnoll,0,0,1285,-1646,-13,0);
	elseif(gnollspawn < 46) then
		spn = eq.spawn2(gnoll,0,0,768,1113,-13,0);
	elseif(gnollspawn < 48) then
		spn = eq.spawn2(gnoll,0,0,219,-796,-9,0);
	elseif(gnollspawn < 50) then
		spn = eq.spawn2(gnoll,0,0,297,1660,-15,0);
	elseif(gnollspawn < 52) then
		spn = eq.spawn2(gnoll,0,0,630,-1867,40,0);
	elseif(gnollspawn < 54) then
		spn = eq.spawn2(gnoll,0,0,217,1541,-28,0);
	elseif(gnollspawn < 56) then
		spn = eq.spawn2(gnoll,0,0,1044,1595,-12,0);
	elseif(gnollspawn < 58) then
		spn = eq.spawn2(gnoll,0,0,984,-1004,80,0);
	elseif(gnollspawn < 60) then
		spn = eq.spawn2(gnoll,0,0,1652,1732,4,0);
	elseif(gnollspawn < 62) then
		spn = eq.spawn2(gnoll,0,0,398,445,-14,0);
	elseif(gnollspawn < 64) then
		spn = eq.spawn2(gnoll,0,0,915,977,8,0);
	elseif(gnollspawn < 66) then
		spn = eq.spawn2(gnoll,0,0,883,1150,-5,0);
	elseif(gnollspawn < 68) then
		spn = eq.spawn2(gnoll,0,0,295,-71,-9,0);
	elseif(gnollspawn < 70) then
		spn = eq.spawn2(gnoll,0,0,430,684,-26,0);
	elseif(gnollspawn < 72) then
		spn = eq.spawn2(gnoll,0,0,1697,-1335,7,0);
	elseif(gnollspawn < 74) then
		spn = eq.spawn2(gnoll,0,0,723,-898,-24,0);
	elseif(gnollspawn < 76) then
		spn = eq.spawn2(gnoll,0,0,678,-1725,21,0);
	elseif(gnollspawn < 78) then
		spn = eq.spawn2(gnoll,0,0,822,-1741,68,0);
	elseif(gnollspawn <= 80) then
		spn = eq.spawn2(gnoll,0,0,153,620,-13,0);
	end
	return spn;
end

function event_encounter_load(e)
	eq.register_npc_event("jpfwar", Event.death, 181070, BarducksDeath);
	eq.register_npc_event("jpfwar", Event.spawn, 181192, ResetSpawn);
	eq.register_npc_event("jpfwar", Event.signal, 181192, WarSignal);
	eq.register_npc_event("jpfwar", Event.timer, 181192, WarTimer);
	eq.register_npc_event("jpfwar", Event.spawn, 181016, GnollSpawn);
	eq.register_npc_event("jpfwar", Event.death, 181028, SergeantDeath);
	eq.register_npc_event("jpfwar", Event.say, 181028, SergeantSay);
	eq.register_npc_event("jpfwar", Event.trade, 181048, SergeantTrade);
	eq.register_npc_event("jpfwar", Event.spawn, 181049, JardorSpawn);
	eq.register_npc_event("jpfwar", Event.waypoint_arrive, 181049, JardorWaypoint);
	eq.register_npc_event("jpfwar", Event.death, 181049, JardorDeath);
	eq.register_npc_event("jpfwar", Event.combat, 181049, JardorCombat);
	
	for _, id in ipairs(VILLAGE_WAR_SPAWN) do
		eq.register_npc_event("jpfwar", Event.death, id, DeathCount);
	end
end
