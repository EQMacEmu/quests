function KnightSpawn(e)
	RandomKnight();
end

function RandomKnight()
	knight = eq.ChooseRandom(126180,126379);
	eq.spawn2(knight,0,0,-237,116,74,0);
end

function KnightSignal(e)
	eq.set_timer("spawn",780000);
end

function KnightTimer(e)
	RandomKnight();
	eq.stop_timer("spawn");
end

function WhiteDeath(e)
	eq.signal(126022,1); -- NPC: knightspawner
end

function BlackDeath(e)
	eq.signal(126022,1); -- NPC: knightspawner
end

function WhiteSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! It is good to see another face within these depths. I have been traveling these mazes for many months now. Judging by the look of you, I do not expect that you will locate the exit. Especially since I have not yet been able to.  My only wish is to find a squire to complete my knighthood. Say you wouldn't happen to... never mind.  I do not expect that you can even comprehend the full extent of my attempt to communicate with you. Shove off commoner.");
	end
end

function BlackSay(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend.  Perhaps an intelligent " .. e.other:Race() .. " such as you can assist me in a friendly game of find the exit. I really like being with friends rather than being alo... No!  NONONO!  Make the fluffy goodness stop! You must help me! Squire!!!  Squire!  Curse him where is he when I need him. Find my squire you pathetic fool!");
		eq.spawn2(126180,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
end

function WhiteTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24565}, 0)) then
		e.self:Say("You have found it!!  Thank Tunare! I apologize for my rude behaviour.  These tunnels twist and bend my very thoughts. Perhaps this will assist you in your escape from this cruel joke Fizzlethorpe has been playing with our minds. I thank you friend.");
		e.other:QuestReward(e.self,{items = {13073,13073,13073,13073},exp = 10000}); -- Item: Bone Chips 4x
		eq.spawn2(126379,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function BlackTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24553}, 0)) then
		e.self:Say("You have found it!!  Thank Tunare! I apologize for my rude behaviour.  These tunnels twist and bend my very thoughts. Perhaps this will assist you in your escape from this cruel joke Fizzlethorpe has been playing with our minds. I thank you friend.");
		e.other:QuestReward(e.self,{items = {10028,10028,10028,10028},exp = 10000}); -- Item: Peridot 4x
		eq.spawn2(126180,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


function event_encounter_load(e)
	eq.register_npc_event("knight", Event.spawn, 126022, KnightSpawn);
	eq.register_npc_event("knight", Event.signal, 126022, KnightSignal);
	eq.register_npc_event("knight", Event.timer, 126022, KnightTimer);
	eq.register_npc_event("knight", Event.death_complete, 126180, WhiteDeath);
	eq.register_npc_event("knight", Event.death_complete, 126379, BlackDeath);
	eq.register_npc_event("knight", Event.say, 126180, WhiteSay);
	eq.register_npc_event("knight", Event.say, 126379, BlackSay);
	eq.register_npc_event("knight", Event.trade, 126180, WhiteTrade);
	eq.register_npc_event("knight", Event.trade, 126379, BlackTrade);
end
