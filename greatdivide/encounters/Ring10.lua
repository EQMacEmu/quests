local nextconv = 0;
local prepare = 0;
local wave = 0;
local switch = 0;
local switchA = 0;
local switchB = 0;
local ChurnSurvive = 0;
local CorbinSurvive = 0;
local DobbinSurvive = 0;
local GaradainSurvive = 0;
local KarginSurvive = 0;

function WarSpawn(e)
	eq.set_timer("Sentry", 10000);
	eq.set_timer("Reset", 7200000);
	switch = eq.ChooseRandom(1,2,3);
	switchA = eq.ChooseRandom(1,2,3);
	switchB = eq.ChooseRandom(1,2,3);
end

function WarTimer(e)
	if(e.timer == "Sentry") then
		eq.stop_timer("Sentry");
		eq.unique_spawn(118021,58,0,141,-1085,21,258); -- NPC: Sentry_Badain_
	elseif(e.timer == "StartWave") then
		wave = wave + 1;
		if(wave >= 1 and wave < 7) then
			eq.set_timer("StartWave",190000);
		elseif(wave == 7) then
			eq.set_timer("StartWave",10000);
		elseif(wave == 8) then
			eq.set_timer("StartWave",520000);
		elseif(wave >= 9 and wave < 13) then
			eq.set_timer("StartWave",285000);
		elseif(wave == 13) then
			eq.set_timer("StartWave",255000);
		elseif(wave == 14) then
			eq.set_timer("StartWave",685000);
		elseif(wave >= 15 and wave < 20) then
			eq.set_timer("StartWave",320000);
		end

		if(wave == 1) then
			KromrifGroup3(e);
		elseif(wave == 2) then
			if(switch == 1) then
				KromrifGroup2(e);
			elseif(switch == 2) then
				KromrifGroup4(e);
			else
				KromrifGroup1(e);
			end
		elseif(wave == 3) then
			if(switch == 1) then
				KromrifGroup3(e);
			elseif(switch == 2) then
				KromrifGroup5(e);
			else
				KromrifGroup2(e);
			end
		elseif(wave == 4) then
			if(switch == 1) then
				KromrifGroup1(e);
			else
				KromrifGroup3(e)
			end
		elseif(wave == 5) then
			if(switch == 1) then
				KromrifGroup3(e);
			elseif(switch == 2) then
				KromrifGroup4(e);
			else
				KromrifGroup2(e);
			end
		elseif(wave == 6) then
			if(switch == 1) then
				KromrifGroup1(e);
			elseif(switch == 2) then
				KromrifGroup5(e);
			else
				KromrifGroup4(e);
			end
		elseif(wave == 7) then
			if(switch == 2) then
				KromrifGroup1(e);
			else
				KromrifGroup5(e);
			end
		elseif(wave == 8) then
			if(switch == 1) then
				KromrifGroup4(e);
			elseif(switch == 2) then
				KromrifGroup2(e);
			else
				KromrifGroup1(e);
			end
		elseif(wave == 9) then
			KromrifGroup3A(e);
		elseif(wave == 10) then
			if(switchA == 1) then
				KromrifGroup2A(e);
			elseif(switchA == 2) then
				KromrifGroup4A(e);
			else
				KromrifGroup1A(e);
			end
		elseif(wave == 11) then
			if(switchA == 1) then
				KromrifGroup1A(e);
			elseif(switchA == 2) then
				KromrifGroup5A(e);
			else
				KromrifGroup2A(e);
			end
		elseif(wave == 12) then
			if(switchA == 1) then
				KromrifGroup5A(e);
			elseif(switchA == 2) then
				KromrifGroup2A(e);
			else
				KromrifGroup1A(e);
			end
		elseif(wave == 13) then
			if(switchA == 2) then
				KromrifGroup1A(e);
			else
				KromrifGroup5A(e);
			end
		elseif(wave == 14) then
			if(switchA == 1) then
				KromrifGroup4A(e);
			elseif(switchA == 2) then
				KromrifGroup3A(e);
			else
				KromrifGroup5A(e);
			end
		elseif(wave == 15) then
				KromrifGroup3B(e);
		elseif(wave == 16) then
			if(switchB == 1) then
				KromrifGroup5B(e);
			elseif(switchB == 2) then
				KromrifGroup1B(e);
			else
				KromrifGroup4B(e);
			end
		elseif(wave == 17) then
			if(switchB == 1) then
				KromrifGroup1B(e);
			else
				KromrifGroup5B(e);
			end
		elseif(wave == 18) then
			if(switchB == 3) then
				KromrifGroup1B(e);
			else
				KromrifGroup4B(e);
			end
		elseif(wave == 19) then
			if(switchB == 1) then
				KromrifGroup2B(e);
			elseif(switchB == 2) then
				KromrifGroup1B(e);
			else
				KromrifGroup3B(e);
			end
		elseif(wave == 20) then
			eq.unique_spawn(118083,104,0,240,-2545,-85,0); -- NPC: Narandi_the_Wretched
			NarandiSpawnDepop(e);
			eq.stop_timer("StartWave");
		end
	elseif(e.timer == "WarEnd") then
		eq.stop_timer("WarEnd");
		eq.repop_zone();
		eq.depop();
	elseif(e.timer == "Reset") then
		eq.stop_timer("Reset");
		eq.repop_zone();
		eq.depop();	
	end
end

function WarSignal(e)
	if(e.signal == 1) then
		eq.set_timer("StartWave",125000);
		wave = 0;
		ChurnSurvive = 0;
		CorbinSurvive = 0;
		DobbinSurvive = 0;
		GaradainSurvive = 0;
		KarginSurvive = 0;
	elseif(e.signal == 2) then
		eq.stop_timer("StartWave");
		eq.set_timer("WarEnd",7200000);
	elseif(e.signal == 3) then
		eq.set_timer("WarEnd",120000);
	elseif(e.signal == 4) then
		eq.set_timer("Reset", 7200000);
	end
end

function ZrelikSpawn(e)
	eq.set_timer("sit",1000);
end

function ZrelikTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function ChurnSpawn(e)
	eq.set_timer("sit",1000);
end

function ChurnTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function CorbinSpawn(e)
	eq.set_timer("sit",1000);
end

function CorbinTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function DobbinSpawn(e)
	eq.set_timer("sit",1000);
end

function DobbinTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function GaradainSpawn(e)
	eq.set_timer("sit",1000);
end

function GaradainTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function KarginSpawn(e)
	eq.set_timer("sit",1000);
end

function KarginTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	end
end

function SenschalSpawn(e)
	eq.set_timer("sit",1000);
	eq.signal(118137,4);
end

function SenschalTimer(e)
	if(e.timer == "sit") then
		eq.stop_timer("sit");
		e.self:SetAppearance(1);
	elseif(e.timer == "conversation") then
		eq.stop_timer("conversation");
		e.self:Say("We knew the day might come when the Kromrif would discover the location of our beloved city. It was only prudent for there to be a plan for such a circumstance. In light of recent developments, however, our plans have been adjusted. Outlander, the Dain has appointed you to lead our armies in defense of Thurgadin.");
		eq.set_timer("continue",7000);
		nextconv = 0;
	elseif(e.timer == "continue") then
		nextconv = nextconv + 1;
		if(nextconv == 1) then
			e.self:Say("I will stand here with a handful of men as a final line of defense. Should I fall, all will be lost. You will have these men and their soldiers to command. Use them wisely, you will be richly rewarded if your forces are able to keep them alive.");
		elseif(nextconv == 2) then
			e.self:Say("Garadain will post his men in the gorge to the east. Churn and his men will await your command in the caves to the west. Dobbin will have his forces at the ready in the clearing directly south of here near the towers. If any Kromrif make it to his vicinity he and his men will attack with or without your command.");
		elseif(nextconv == 3) then
			e.self:Say("Lastly, Corbin will hide his men in the worm caves to the south, call on him for a surprise attack. Remember where these men are stationed, outlander. Should they call out for help you may wish to send some of your people to aid them.");
		elseif(nextconv == 4) then
			e.self:Say("The leader of this invasion is a powerful Kromrif named Narandi. Rumor has it that he is more powerful than any ten of his peers. He must fall. When he is slain you must show his head and the ninth ring to me.");
		elseif(nextconv == 5) then
			e.self:Say("Scout Zrelik here will follow you and serve as your herald. He will relay your orders to the troops. Show me your ninth ring now to verify your identity and I will give you the orders to memorize.");
			eq.stop_timer("continue");
		end
	end
end

function SentryWaypoint(e)
	if(e.wp == 1) then
		eq.zone_emote(0,"Sentry Badain says 'Excellent! All of your commanders have reported to the Dain, and none too soon mind you. We are getting reports of Kromrif troop movement in the area and final preparations must be made. Follow me and the Seneschal will brief you.'");
		eq.unique_spawn(118022,0,0,-142,-520,78,128); -- Zrelik
	elseif(e.wp == 2) then
		ColdainLeader(e);
	elseif(e.wp == 5) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118031)) then 
			eq.get_entity_list():GetMobByNpcTypeID(118031):Say("With all due respect, Seneschal, I feel my men are best suited for the eastern post. If the outlander has rounded up enough soldiers to hold 'em off from the south then they'll definitely test us in the gorge. We'll be needin' a solid defense there.");
		end
	elseif(e.wp == 6) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118029)) then
			eq.get_entity_list():GetMobByNpcTypeID(118029):Say("Very well, Garadain. The eastern post is yours. I'll place Kargin and his bowmen on the hill to the west, and Churn, you'll station your troops up near the caves just past them.");
			eq.set_timer("ChurnSay",5000);
		end
	elseif(e.wp == 7) then
		eq.zone_emote(0,"Sentry Badain says 'Excuse me, Seneschal Aldikar, you instructed me to report to you when the outlander returned. I have brought him.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118029)) then
			eq.get_entity_list():GetMobByNpcTypeID(118029):Say("Perfect timing, outlander. Please be seated and listen carefully. Badain, yer dismissed.");
			eq.signal(118029,1); -- NPC: Seneschal_Aldikar
		elseif(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118054)) then
			eq.get_entity_list():GetMobByNpcTypeID(118054):Say("Perfect timing, outlander. Please be seated and listen carefully. Badain, yer dismissed.");
		end
	elseif(e.wp == 8) then
		e.self:Say("Sir, yessir!");
	end
end


function SentrySpawn(e)
	eq.signal(118137,4);
end

function SentryTimer(e)
	eq.stop_timer("ChurnSay");
	eq.get_entity_list():GetMobByNpcTypeID(118024):Say("Understood sir.");
end

function SenschalSignal(e)
	if(e.signal == 1) then
		eq.set_timer("conversation",14000);
	end
end

function SenschalTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30369}, 0)) then
		e.self:Say("Commit these orders to memory, " .. e.other:GetCleanName() .. ", have them ready to speak at a moment's notice. When you are finished memorizing, repeat them to me. Tell your soldiers to prepare themselves. When the orders are handed to Zrelik we will take up our positions.");
		e.other:QuestReward(e.self,{items = {30369,18511}}); -- Item: Coldain Hero's Insignia Ring
		eq.stop_all_timers();
		eq.depop(118022);
		eq.unique_spawn(118052,0,0,-142,-520,78,128); -- Zrelik(v2)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Zrelik2Spawn(e)
	eq.signal(118137,4);
end

function Zrelik2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18511}, 0)) then
		e.self:Say("At yer service, " .. e.other:GetCleanName() .. ". Remember now, before issuing me an order ya must disengage from any combat and be sure yer speakin to me. I advise you to avoid combat at all costs. Your leadership is crucial.");
		eq.follow(e.other:GetID());
		e.other:SendSound(141);
		eq.depop(118029);
		eq.spawn2(118054,0,0,-140,-545,78,64); -- Senschal(v2)
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Zrelik2Say(e)
	if(e.message:findi("for the dain, attack")) then
		e.self:Shout("All able Coldain, come to me at once!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118058)) then
			GaradainHelp(e);
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118057)) then
			DobbinHelp(e);
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118055)) then
			ChurnHelp(e);
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118048)) then
			CorbinHelp(e);
		end
	elseif(e.message:findi("garadain to my side")) then
		e.self:Shout("Garadain! " .. e.other:GetCleanName() .. " needs help.");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118058)) then
			GaradainHelp(e);
		end
	elseif(e.message:findi("dobbin assist me")) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118057)) then
			DobbinHelp(e);
		end
	elseif(e.message:findi("churn protect me")) then
		e.self:Shout("Churn, get yer men and c'mere on the double! " .. e.other:GetCleanName() .. " needs ye!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118055)) then
			ChurnHelp(e);
		end
	elseif(e.message:findi("corbin attack")) then
		e.self:Shout("" .. e.other:GetCleanName() .. " is in need of yer help Corbin. Bring yer men!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118048)) then
			CorbinHelp(e);
		end
	end
end

function GaradainHelp(e)
	local Coldain_List = Set {118058,118039,118041}; -- Garadain, Cleric, and Guard
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (Coldain_List[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,false);
				end
			end
		end
	end
end

function DobbinHelp(e)
	local Coldain_List = Set {118057,118043}; -- Dobbin and Soldiers
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (Coldain_List[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,false);
				end
			end
		end
	end
end

function ChurnHelp(e)
	local Coldain_List = Set {118055,118038}; -- Churn and Axemen
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (Coldain_List[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,false);
				end
			end
		end
	end
end

function CorbinHelp(e)
	local Coldain_List = Set {118048,118097,118099}; -- Corbin, Cleric, and Guard
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (Coldain_List[npc:GetNPCTypeID()] ~= nil) then
				-- npc.valid will be true if the NPC is actually spawned
				if (npc.valid) then
					npc:CastToNPC():MoveTo(e.self:GetX(),e.self:GetY(),e.self:GetZ(),0,false);
				end
			end
		end
	end
end

-- Set function example from Programming In Lua
-- http://www.lua.org/pil/11.5.html
function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end


function Senschal2Spawn(e)
	eq.set_timer("prepare",12000);
	prepare = 0;
end

function Senschal2Timer(e)
	if(e.timer == "prepare") then
		prepare = prepare + 1;
		if(prepare == 1) then
			e.self:Shout("Good citizens of Thurgadin, hear me! Our city, our people, our very lives are in danger this day. The Kromrif are at this very moment marching towards us in an offensive they hope will bring about our demise...");
			eq.signal(118137,1);
			ArcherSpawns(e);
		elseif(prepare == 2) then
			e.self:Shout("I hereby command, by authority of Dain Frostreaver the Fourth, that all able bodied Coldain fight to the death in defense of our land. Children, disabled citzens, and unseasoned travelers are advised to evacuate immediately!");
			AxemanSpawn(e);
		elseif(prepare == 3) then
			e.self:Shout("My fellow soldiers, take heart! For we are not alone in this endeavor. One among us, an outlander, has earned the title Hero of the Dain for valiant service to our people. This newcomer has brought with him allies that will fight alongside you to help bring about our victory.");
			EastSpawn(e);
		elseif(prepare == 4) then
			e.self:Shout("My friends... Brell did not place us here so many centuries ago to be slaughtered by these heathens. Nor did our forefather, Colin Dain, sacrifice himself simply to have us fail here now. Through these events we were brought to this day to test our strength and our faith.");
			SouthSpawn(e);
		elseif(prepare == 5) then
			e.self:Shout("Will we be shackled together to slave away in Kromrif mines or will we stand united and feed these beasts Coldain blades? By Brell, I promise you, it is better to die on our feet than to live on our knees!");
			SoldierSpawn(e);
		elseif(prepare == 6) then
			e.self:Shout("TROOPS, TAKE YOUR POSITIONS!");
			DepopLeader(e);
			ColdainLeader2(e)
			eq.move_to(-112,30,102,128,true);
			eq.set_timer("leader",1000);
		elseif(prepare == 7) then
			SpearmanSpawn(e);
			eq.stop_timer("prepare");
		end
	elseif(e.timer == "leader") then
		LeaderMove(e);
		eq.stop_timer("leader");
	end
end

function ColdainLeader(e)
	eq.unique_spawn(118024,0,0,-130,-525,78,144); -- Churn
	eq.unique_spawn(118033,0,0,-120,-550,77,200); -- Corbin
	eq.unique_spawn(118028,0,0,-125,-565,78,227); -- Dobbin
	eq.unique_spawn(118031,0,0,-140,-570,78,0); -- Garadain
	eq.unique_spawn(118025,0,0,-120,-535,78,170); -- Kargin
	eq.unique_spawn(118029,0,0,-140,-545,78,64); -- Senschal
end

function DepopLeader(e)
	eq.depop(118024);
	eq.depop(118033);
	eq.depop(118028);
	eq.depop(118031);
	eq.depop(118025);
end

function ColdainLeader2(e)
	eq.unique_spawn(118055,0,0,-130,-525,78,144); -- Churn
	eq.unique_spawn(118048,0,0,-120,-550,77,200); -- Corbin
	eq.unique_spawn(118057,0,0,-125,-565,78,227); -- Dobbin
	eq.unique_spawn(118058,0,0,-140,-570,78,0); -- Garadain
	eq.unique_spawn(118056,0,0,-120,-535,78,170); -- Kargin
end

function LeaderMove(e)
	eq.get_entity_list():GetNPCByNPCTypeID(118055):CastToNPC():MoveTo(1544,-1070,322,0,true); -- Churn
	eq.get_entity_list():GetNPCByNPCTypeID(118048):CastToNPC():MoveTo(100,-2880,-144,0,true); -- Corbin
	eq.get_entity_list():GetNPCByNPCTypeID(118057):CastToNPC():MoveTo(0,-1090,26,128,true); -- Dobbin
	eq.get_entity_list():GetNPCByNPCTypeID(118058):CastToNPC():MoveTo(-1840,-570,75,128,true); -- Garadain
	eq.get_entity_list():GetNPCByNPCTypeID(118056):CastToNPC():MoveTo(870,-1095,26,52,true); -- Kargin
end


function ArcherSpawns(e)
	eq.spawn2(118037,0,0,-160,-1085,68,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-50,-145,110,192); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-50,-125,110,192); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-50,-105,110,192); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-168,-145,115,64); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-168,-125,115,64); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,122,-1103,55,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-145,-1090,53,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1875,-518,101,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-168,-105,115,64); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1780,-510,99,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1050,64,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1860,-515,96,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1840,-510,99,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1820,-510,99,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-1800,-510,99,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1150,56,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1130,57,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1110,59,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1090,61,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,875,-1070,62,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,155,-1092,66,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,134,-1093,68,128); -- NPC: Royal_Archer
	eq.spawn2(118037,0,0,-180,-1090,71,128); -- NPC: Royal_Archer
end

function AxemanSpawn(e)
	eq.spawn2(118038,0,0,1555,-1075,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1565,-1080,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1535,-1065,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1525,-1060,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1585,-1080,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1575,-1075,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1565,-1070,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1555,-1065,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1545,-1060,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1535,-1055,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1525,-1050,320,128); -- NPC: Royal_Axeman
	eq.spawn2(118038,0,0,1515,-1045,320,128); -- NPC: Royal_Axeman
end

function EastSpawn(e)
	eq.spawn2(118039,0,0,-1875,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118039,0,0,-1860,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118039,0,0,-1845,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118039,0,0,-1830,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118039,0,0,-1815,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118039,0,0,-1800,-545,70,128); -- NPC: Royal_Cleric
	eq.spawn2(118041,0,0,-1875,-560,70,128); -- NPC: Royal_Guard
	eq.spawn2(118041,0,0,-1860,-560,70,128); -- NPC: Royal_Guard
	eq.spawn2(118041,0,0,-1845,-560,70,128); -- NPC: Royal_Guard
	eq.spawn2(118041,0,0,-1830,-560,70,128); -- NPC: Royal_Guard
	eq.spawn2(118041,0,0,-1815,-560,70,128); -- NPC: Royal_Guard
	eq.spawn2(118041,0,0,-1800,-560,70,128); -- NPC: Royal_Guard
end

function SouthSpawn(e)
	eq.spawn2(118097,0,0,140,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118097,0,0,125,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118097,0,0,110,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118097,0,0,95,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118097,0,0,80,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118097,0,0,65,-2860,-142,0); -- NPC: Royal_Cleric
	eq.spawn2(118099,0,0,140,-2845,-142,0); -- NPC: Royal_Guard
	eq.spawn2(118099,0,0,125,-2845,-142,0); -- NPC: Royal_Guard
	eq.spawn2(118099,0,0,110,-2845,-142,0); -- NPC: Royal_Guard
	eq.spawn2(118099,0,0,95,-2845,-142,0); -- NPC: Royal_Guard
	eq.spawn2(118099,0,0,80,-2845,-142,0); -- NPC: Royal_Guard
	eq.spawn2(118099,0,0,65,-2845,-142,0); -- NPC: Royal_Guard
end

function SoldierSpawn(e)
	eq.spawn2(118043,0,0,69,-1100,21,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,56,-1100,21,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,43,-1100,21,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,30,-1100,21,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,17,-1100,21,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,4,-1100,22,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-9,-1100,23,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-22,-1100,23,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-35,-1100,23,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-48,-1100,24,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-61,-1100,24,128); -- NPC: Royal_Soldier
	eq.spawn2(118043,0,0,-74,-1100,24,128); -- NPC: Royal_Soldier
end

function SpearmanSpawn(e)
	 eq.spawn2(118044,0,0,600,-2420,-83,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,625,-2360,-80,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,650,-2300,-81,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,675,-2240,-79,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,700,-2180,-70,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,725,-2120,-63,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,750,-2060,-57,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,775,-2000,-53,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,800,-1940,-48,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,825,-1880,-42,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,850,-1820,-35,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,875,-1760,-30,228); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-765,-2275,-72,94); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-742,-2232,-70,94); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-719,-2189,-63,94); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-696,-2146,-57,94); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-673,-2103,-53,94); -- NPC: Kromrif_Spearman
	 eq.spawn2(118044,0,0,-650,-2060,-49,94); -- NPC: Kromrif_Spearman
end

function KromrifGroup1(e)
	 eq.spawn2(118046,70,0,930,-2060,-55,0); -- NPC: Kromrif_Captain
	 eq.spawn2(118045,75,0,960,-2120,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,74,0,960,-2090,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,73,0,960,-2060,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,72,0,960,-2030,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,71,0,960,-2000,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,80,0,1000,-2120,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,79,0,1000,-2090,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,78,0,1000,-2060,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,77,0,1000,-2030,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,76,0,1000,-2000,-55,0); -- NPC: Kromrif_Recruit
end

function KromrifGroup1A(e)
	 eq.spawn2(118062,70,0,930,-2060,-55,0); -- NPC: Kromrif_General
	 eq.spawn2(118059,75,0,960,-2120,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,74,0,960,-2090,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,73,0,960,-2060,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,72,0,960,-2030,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,71,0,960,-2000,-55,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,80,0,1000,-2120,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,79,0,1000,-2090,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,78,0,1000,-2060,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,77,0,1000,-2030,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,76,0,1000,-2000,-55,0); -- NPC: Priest_of_Zek
end

function KromrifGroup1B(e)
	 eq.spawn2(118064,70,0,930,-2060,-55,0); -- NPC: Kromrif_Warlord
	 eq.spawn2(118071,75,0,960,-2120,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,74,0,960,-2090,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,73,0,960,-2060,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,72,0,960,-2030,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,71,0,960,-2000,-55,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,80,0,1000,-2120,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,79,0,1000,-2090,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,78,0,1000,-2060,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,77,0,1000,-2030,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,76,0,1000,-2000,-55,0); -- NPC: High_Priest_of_Zek
end

function KromrifGroup2(e)
	 eq.spawn2(118046,81,0,900,-2140,-55,0); -- NPC: Kromrif_Captain
	 eq.spawn2(118045,82,0,870,-2080,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,83,0,870,-2110,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,84,0,870,-2140,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,85,0,870,-2170,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,86,0,870,-2200,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,87,0,830,-2080,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,88,0,830,-2110,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,89,0,830,-2140,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,90,0,830,-2170,-55,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,91,0,830,-2200,-55,0); -- NPC: Kromrif_Recruit
end

function KromrifGroup2A(e)
	 eq.spawn2(118062,81,0,900,-2140,-55,0); -- NPC: Kromrif_General
	 eq.spawn2(118059,82,0,870,-2080,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,83,0,870,-2110,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,84,0,870,-2140,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,85,0,870,-2170,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,86,0,870,-2200,-55,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,87,0,830,-2080,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,88,0,830,-2110,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,89,0,830,-2140,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,90,0,830,-2170,-55,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,91,0,830,-2200,-55,0); -- NPC: Priest_of_Zek
end

function KromrifGroup2B(e)
	 eq.spawn2(118064,81,0,900,-2140,-55,0); -- NPC: Kromrif_Warlord
	 eq.spawn2(118071,82,0,870,-2080,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,83,0,870,-2110,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,84,0,870,-2140,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,85,0,870,-2170,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,86,0,870,-2200,-55,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,87,0,830,-2080,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,88,0,830,-2110,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,89,0,830,-2140,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,90,0,830,-2170,-55,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,91,0,830,-2200,-55,0); -- NPC: High_Priest_of_Zek
end

function KromrifGroup3(e)
	 eq.spawn2(118046,69,0,240,-2545,-85,0); -- NPC: Kromrif_Captain
	 eq.spawn2(118045,68,0,527,-2330,-70,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,67,0,458,-2354,-80,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,66,0,392,-2378,-85,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,65,0,324,-2402,-90,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,64,0,257,-2426,-95,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,63,0,190,-2450,-100,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,62,0,122,-2474,-100,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,61,0,55,-2498,-100,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,60,0,-13,-2522,-100,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,59,0,-80,-2545,-96,0); -- NPC: Kromrif_Recruit
end

function KromrifGroup3A(e)
	 eq.spawn2(118062,69,0,240,-2545,-85,0); -- NPC: Kromrif_General
	 eq.spawn2(118059,68,0,527,-2330,-70,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,67,0,458,-2354,-80,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,66,0,392,-2378,-85,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,65,0,324,-2402,-90,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,64,0,257,-2426,-95,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,63,0,190,-2450,-100,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,62,0,122,-2474,-100,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,61,0,55,-2498,-100,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,60,0,-13,-2522,-100,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,59,0,-80,-2545,-96,0); -- NPC: Priest_of_Zek
end

function KromrifGroup3B(e)
	 eq.spawn2(118064,69,0,240,-2545,-85,0); -- NPC: Kromrif_Warlord
	 eq.spawn2(118071,68,0,527,-2330,-70,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,67,0,458,-2354,-80,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,66,0,392,-2378,-85,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,65,0,324,-2402,-90,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,64,0,257,-2426,-95,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,63,0,190,-2450,-100,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,62,0,122,-2474,-100,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,61,0,55,-2498,-100,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,60,0,-13,-2522,-100,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,59,0,-80,-2545,-96,0); -- NPC: High_Priest_of_Zek
end

function KromrifGroup4(e)
	 eq.spawn2(118045,97,0,-1100,-2120,-50,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,94,0,-1100,-2080,-50,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,96,0,-1080,-2120,-50,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,93,0,-1080,-2080,-50,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,95,0,-1060,-2120,-50,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,92,0,-1060,-2080,-50,0); -- NPC: Kromrif_Recruit
end

function KromrifGroup4A(e)
	 eq.spawn2(118060,97,0,-1100,-2120,-50,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118060,94,0,-1100,-2080,-50,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,96,0,-1080,-2120,-50,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,93,0,-1080,-2080,-50,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,95,0,-1060,-2120,-50,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,92,0,-1060,-2080,-50,0); -- NPC: Kromrif_Warrior
end

function KromrifGroup4B(e)
	 eq.spawn2(118067,97,0,-1100,-2120,-50,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118067,94,0,-1100,-2080,-50,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,96,0,-1080,-2120,-50,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,93,0,-1080,-2080,-50,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,95,0,-1060,-2120,-50,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,92,0,-1060,-2080,-50,0); -- NPC: Kromrif_Veteran
end

function KromrifGroup5(e)
	 eq.spawn2(118045,103,0,-2730,-1890,-30,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,102,0,-2730,-1870,-30,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,101,0,-2730,-1850,-30,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,100,0,-2690,-1890,-30,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,99,0,-2690,-1870,-30,0); -- NPC: Kromrif_Recruit
	 eq.spawn2(118045,98,0,-2690,-1850,-30,0); -- NPC: Kromrif_Recruit
end

function KromrifGroup5A(e)
	 eq.spawn2(118060,103,0,-2730,-1890,-30,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,102,0,-2730,-1870,-30,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,101,0,-2730,-1850,-30,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118060,100,0,-2690,-1890,-30,0); -- NPC: Priest_of_Zek
	 eq.spawn2(118059,99,0,-2690,-1870,-30,0); -- NPC: Kromrif_Warrior
	 eq.spawn2(118059,98,0,-2690,-1850,-30,0); -- NPC: Kromrif_Warrior
end

function KromrifGroup5B(e)
	 eq.spawn2(118067,103,0,-2730,-1890,-30,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,102,0,-2730,-1870,-30,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,101,0,-2730,-1850,-30,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118067,100,0,-2690,-1890,-30,0); -- NPC: High_Priest_of_Zek
	 eq.spawn2(118071,99,0,-2690,-1870,-30,0); -- NPC: Kromrif_Veteran
	 eq.spawn2(118071,98,0,-2690,-1850,-30,0); -- NPC: Kromrif_Veteran
end

function KromrifEliteGuard(e)
	 eq.spawn2(118047,0,0,-150,-75,107,64); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-150,-115,107,64); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-150,-155,107,64); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-150,-195,107,64); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-65,-195,107,192); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-65,-155,107,192); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-65,-115,107,192); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-65,-75,107,192); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-130,5,110,64); -- NPC: Kromrif_Elite_Guard
	 eq.spawn2(118047,0,0,-90,5,110,192); -- NPC: Kromrif_Elite_Guard
end

function WarLose(e)
	eq.spawn_condition("thurgadina",1,0);
	eq.spawn_condition("thurgadina",1,1);
	eq.spawn_condition("thurgadina",2,1);
	eq.spawn_condition("thurgadinb",4,0);
	eq.spawn_condition("thurgadinb",4,1);
	eq.spawn_condition("thurgadinb",5,1);
	eq.signal(118137,2);
	eq.depop_all(118043); -- Royal_Soldier
	eq.depop_all(118041); -- Royal_Guard
	eq.depop_all(118039); -- Royal_Cleric
	eq.depop_all(118097); -- Royal_Guard
	eq.depop_all(118099); -- Royal_Cleric
	eq.depop_all(118038); -- Royal_Axeman
	eq.depop_all(118037); -- Royal_Archer
	eq.depop(118055); -- Churn
	eq.depop(118048); -- Corbin
	eq.depop(118057); -- Dobbin
	eq.depop(118058); -- Garadain
	eq.depop(118056); -- Kargin
	eq.depop(118054); -- Senschal
	eq.depop(118052); -- Zrelik
	eq.depop_all(118046); -- Kromrif_Captain
	eq.depop_all(118045); -- Kromrif_Recruit
	eq.depop_all(118062); -- Kromrif_General
	eq.depop_all(118059); -- Kromrif_Warrior
	eq.depop_all(118060); -- Priest_of_Zek
	eq.depop_all(118064); -- Kromrif_Warlord
	eq.depop_all(118067); -- High_Priest_of_Zek
	eq.depop_all(118071); -- Kromrif_Veteran
	eq.depop(118083); -- Narandi
	eq.depop();
end

function NarandiSpawnDepop(e)
	eq.depop_all(118043); -- Royal_Soldier
	eq.depop_all(118041); -- Royal_Guard
	eq.depop_all(118039); -- Royal_Cleric
	eq.depop_all(118038); -- Royal_Axeman
	eq.depop_all(118037); -- Royal_Archer
	eq.depop_all(118097); -- Royal_Guard
	eq.depop_all(118099); -- Royal_Cleric
end

function Churn2Spawn(e)
	e.self:SetRunning(true);
end

function Corbin2Spawn(e)
	e.self:SetRunning(true);
end

function Dobbin2Spawn(e)
	e.self:SetRunning(true);
end

function Garadain2Spawn(e)
	e.self:SetRunning(true);
end

function Kargin2Spawn(e)
	e.self:SetRunning(true);
end

function RClericSpawn(e)
	e.self:SetRunning(true);
end

function RGuardSpawn(e)
	e.self:SetRunning(true);
end

function RCleric2Spawn(e)
	e.self:SetRunning(true);
end

function RGuard2Spawn(e)
	e.self:SetRunning(true);
end

function RAxemanSpawn(e)
	e.self:SetRunning(true);
end

function RSoldierSpawn(e)
	e.self:SetRunning(true);
end

function RecruitWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function CaptainWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function WarriorWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function ZekWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function GeneralWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function VeteranWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function HighZekWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function WarlordWaypoint(e)
	if(e.wp == 3) then
		e.self:SetRunning(true);
	elseif(e.wp == 8) then
		KromrifEliteGuard(e);
		WarLose(e);
	end
end

function NarandiWaypoint(e)
	if(e.wp == 3) then
		e.self:Shout("Meddling fools, you are no match for the likes of me. Be warned... Engage me at your own peril!");
	elseif(e.wp == 8) then
		eq.signal(118137,3);
		DespawnKromrif(e);
		eq.depop(118055); -- Churn
		eq.depop(118048); -- Corbin
		eq.depop(118057); -- Dobbin
		eq.depop(118058); -- Garadain
		eq.depop(118056); -- Kargin
		eq.depop(118054); -- Senschal
		eq.depop(118052); -- Zrelik
	end
end

function NarandiCombat(e)
	if(e.joined) then
		CheckSurvivor(e);
		eq.depop(118052); -- Zrelik
	end
end

function NarandiDeath(e)
	DespawnKromrif(e);
	eq.signal(118137,2);
	eq.depop(118054);
	eq.spawn2(118085,0,0,-140,-545,78,64); -- Senschal(v3)
	SpawnSurvivors(e);
end

function DespawnKromrif(e)
	eq.depop_all(118044); -- Kromrif_Spearman
	eq.depop_all(118046); -- Kromrif_Captain
	eq.depop_all(118045); -- Kromrif_Recruit
	eq.depop_all(118062); -- Kromrif_General
	eq.depop_all(118059); -- Kromrif_Warrior
	eq.depop_all(118060); -- Priest_of_Zek
	eq.depop_all(118064); -- Kromrif_Warlord
	eq.depop_all(118067); -- High_Priest_of_Zek
	eq.depop_all(118071); -- Kromrif_Veteran
end

function CheckSurvivor(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118055)) then -- check Churn
		ChurnSurvive = 1;
		eq.depop(118055);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118048)) then -- check Corbin
		CorbinSurvive = 1;
		eq.depop(118048);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118057)) then -- check Dobbin
		DobbinSurvive = 1;
		eq.depop(118057);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118058)) then -- check Garadain
		GaradainSurvive = 1;
		eq.depop(118058);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118056)) then -- check Kargin
		KarginSurvive = 1;
		eq.depop(118056);
	end
end

function SpawnSurvivors(e)
	if(ChurnSurvive == 1) then -- check Churn
		eq.spawn2(118092,0,0,-130,-525,78,144); -- Churn
	end
	if(CorbinSurvive == 1) then -- check Corbin
		eq.spawn2(118093,0,0,-120,-550,77,200); -- Corbin
	end
	if(DobbinSurvive == 1) then -- check Dobbin
		eq.spawn2(118094,0,0,-125,-565,78,227); -- Dobbin
	end
	if(GaradainSurvive == 1) then -- check Garadain
		eq.spawn2(118095,0,0,-140,-570,78,0); -- Garadain
	end
	if(KarginSurvive == 1) then -- check Kargin
		eq.spawn2(118096,0,0,-120,-535,78,170); -- Kargin
	end
end

function Senschal3Spawn(e)
	eq.signal(118137,4);  -- 2 hours to reset if no trade.
end

function Senschal3Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1739,item2 = 30369})) then
		e.self:Emote("unsheathes a knife and shaves the beard from Narandi's face and returns the head to you, 'The Dain will require the beard for his trophy room, please accept this ring on his behalf. May its effect aid you as you have aided us. Be certain to present the ring to the Dain when you're in town. If you remain an ally he will be most gracious, but be warned, if you fall from his good graces he will keep the ring.'");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,30385},exp = 5000});
		e.self:Say("Show the head to the surviving heroes quickly, we must report to the Dain and tend to the wounded.");
		eq.signal(118137,3);
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Churn2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}, 0)) then
		e.self:Emote("pries a crown from the head of Narandi, 'The halls of Thurgadin will echo with praises to you for as long as we grace the face of this land. May this crown serve you well. Honor through battle!'");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,1746},exp = 5000}); -- Crown of Narandi
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Corbin2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}, 0)) then
		e.self:Emote("unhooks a glowing earring from Narandi's shorn head, 'Hmm, this looks like something special. Take it, " .. e.other:GetCleanName() .. ", you've earned it! Be well.' ");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,1744},exp = 5000}); -- Earring of the Frozen Skull
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Dobbin2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}, 0)) then
		e.self:Emote("gives a gentle, warm smile and slight nod of his head in warm welcoming, 'Good day to you, " .. e.other:GetCleanName() .. ", and welcome to the district of Selia. We are children of the light -- beings who valiantly uphold the ways of honor, valor, and merits of goodly faith and virtue. Rather, we are crusaders of these things, collectively comprising the beacon of these traits within the universe in our position in New Tanaan. We are quite pleased to have you approach us with such confidence -- perhaps the inner light has brought you to us, seeking a way to unlock the purity of these merits that you faintly mirror now. If you are seeking council in the ways of enchantments, then I would be more than pleased and honored to aid you where I can, my friend.'");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,1743},exp = 5000}); -- Faceguard of Bentos the Hero.
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Garadain2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}, 0)) then
		e.self:Emote("removes a choker from the severed head and returns both items to you, 'Congratulations on your victory, " .. e.other:GetCleanName() .. ". I couldn't have done a better job myself. May Brell protect and watch over you and your friends. Farewell.' ");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,1742},exp = 5000}); -- Choker of the Wretched
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function Kargin2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1741}, 0)) then
		e.self:Emote("picks up a stick and hits the back of the dismembered head with all his might, knocking one of its eyes out of the socket, 'Bastard killed my brother! Hope his ghost felt that one!'");
		e.other:Faction(e.self,406,100); -- coldain
		e.other:Faction(e.self,405,25); -- dain
		e.other:Faction(e.self,448,-10); -- kzek
		e.other:Faction(e.self,419,-50); -- krif
		e.other:QuestReward(e.self,{items = {1741,1745},exp = 5000}); -- Eye of Narandi
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_encounter_load(e)
	eq.register_npc_event("Ring10", Event.spawn, 118137, WarSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118137, WarTimer);
	eq.register_npc_event("Ring10", Event.signal, 118137, WarSignal);
	eq.register_npc_event("Ring10", Event.spawn, 118022, ZrelikSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118022, ZrelikTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118024, ChurnSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118024, ChurnTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118033, CorbinSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118033, CorbinTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118028, DobbinSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118028, DobbinTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118031, GaradainSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118031, GaradainTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118025, KarginSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118025, KarginTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118029, SenschalSpawn);
	eq.register_npc_event("Ring10", Event.timer, 118029, SenschalTimer);
	eq.register_npc_event("Ring10", Event.signal, 118029, SenschalSignal);
	eq.register_npc_event("Ring10", Event.trade, 118029, SenschalTrade);
	eq.register_npc_event("Ring10", Event.spawn, 118021, SentrySpawn);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118021, SentryWaypoint);
	eq.register_npc_event("Ring10", Event.timer, 118021, SentryTimer);
	eq.register_npc_event("Ring10", Event.spawn, 118052, Zrelik2Spawn);	
	eq.register_npc_event("Ring10", Event.trade, 118052, Zrelik2Trade);
	eq.register_npc_event("Ring10", Event.say, 118052, Zrelik2Say);
	eq.register_npc_event("Ring10", Event.spawn, 118054, Senschal2Spawn);
	eq.register_npc_event("Ring10", Event.timer, 118054, Senschal2Timer);
	eq.register_npc_event("Ring10", Event.spawn, 118055, Churn2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118048, Corbin2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118057, Dobbin2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118058, Garadain2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118056, Kargin2Spawn);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118045, RecruitWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118046, CaptainWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118059, WarriorWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118060, ZekWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118062, GeneralWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118071, VeteranWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118067, HighZekWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118064, WarlordWaypoint);
	eq.register_npc_event("Ring10", Event.waypoint_arrive, 118083, NarandiWaypoint);
	eq.register_npc_event("Ring10", Event.death_complete, 118083, NarandiDeath);
	eq.register_npc_event("Ring10", Event.combat, 118083, NarandiCombat);
	eq.register_npc_event("Ring10", Event.spawn, 118085, Senschal3Spawn);	
	eq.register_npc_event("Ring10", Event.trade, 118085, Senschal3Trade);
	eq.register_npc_event("Ring10", Event.trade, 118092, Churn2Trade);
	eq.register_npc_event("Ring10", Event.trade, 118093, Corbin2Trade);
	eq.register_npc_event("Ring10", Event.trade, 118094, Dobbin2Trade);
	eq.register_npc_event("Ring10", Event.trade, 118095, Garadain2Trade);
	eq.register_npc_event("Ring10", Event.trade, 118096, Kargin2Trade);
	eq.register_npc_event("Ring10", Event.spawn, 118039, RClericSpawn);
	eq.register_npc_event("Ring10", Event.spawn, 118041, RGuardSpawn);
	eq.register_npc_event("Ring10", Event.spawn, 118097, RCleric2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118099, RGuard2Spawn);
	eq.register_npc_event("Ring10", Event.spawn, 118038, RAxemanSpawn);
	eq.register_npc_event("Ring10", Event.spawn, 118043, RSoldierSpawn);
end
