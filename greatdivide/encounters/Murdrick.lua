local ThreadManager = require("thread_manager");
local Murdrick = nil;

function DavinConversation()
	Murdrick:Say("Good day my friends, it is good to see you all are alive and well.");
	ThreadManager:Wait(0.65);

	local davin = eq.get_entity_list():GetMobByNpcTypeID(118077);
	if(davin.null) then
		return
	end
	
	davin:Say("Well, we are alive, but I'd hardly say we're well... We have heard of the death of Rodrick, and the Dain is calling on all citizens of Thurgadin to flush out any opposition to the throne. If we're tied to your dealings with the Kromrif we'll be sent to the bottom of the well for sure.");
	ThreadManager:Wait(0.65);
	
	Murdrick:Say("The Dain knows nothing, and I have a plan to keep it that way. I have given the matter much thought, and I have gathered you all here to ask for your help.'");
	ThreadManager:Wait(0.65);

	local gerton = eq.get_entity_list():GetMobByNpcTypeID(118076);
	if(gerton.null) then
		return
	end

	gerton:Say("We all saw what happened when Rodrick agreed to help you. I, for one, am none too eager to take on these new friends of the Dain.");
	ThreadManager:Wait(0.65);

	Murdrick:Say("Rodrick knew what he was getting into, and so did you. It's a bit too late for second thoughts. I don't recall seeing any hesitation when the loot was being passed around.");
	ThreadManager:Wait(0.65);

	local lapker = eq.get_entity_list():GetMobByNpcTypeID(118075);
	if(lapker.null) then
		return;
	end
	
	lapker:Say("Go ahead Murdrick, what's this plan of yours?");
	ThreadManager:Wait(0.65);
	
	local lapker = eq.get_entity_list():GetMobByNpcTypeID(118075);
	if(lapker.null) then
		return;
	end

	Murdrick:Say("As I said I've thought long and hard of our situation and I feel  we are indeed in danger. My cousin Berradin is a captain in the Dain's army. I've always been uneasy about him, but now more than ever. He could easily betray many of us and take credit for destroying the rebellion.");
	ThreadManager:Wait(0.65);
	
	Murdrick:Say("My plan is to poison him and plant a suicide note on the body, a note in which he would take full responsibility for the actions of the rebels. This would both ensure that he could never betray us and would give the Dain closure. We will be free to continue working with our Kromrif friends without fear of discovery.");
	ThreadManager:Wait(0.65);

	local davin = eq.get_entity_list():GetMobByNpcTypeID(118077);
	if(davin.valid) then
		davin:Say("Sounds good boss, but how do you plan on poisoning him?");
	end

	Murdrick:Say("Berradin has a weakness for drink, one drink in particular... Avalanche Ale. I have had the recipe altered slightly to include a deadly poison. I have much to do, I need one of you to brew the drink and bring it to me. I'll handle the rest.");

	local gerton = eq.get_entity_list():GetMobByNpcTypeID(118076);
	if(gerton.null) then
		return;
	end
	
	gerton:Emote("Chuckles, 'Once again, Murdrick, you've put us at ease in the middle of a treacherous predicament. I will volunteer to brew the drink.'");
	ThreadManager:Wait(0.65);
	
	Murdrick:Emote("smiles, 'Very well, take this recipe and follow it exactly. It won't be easy, but you'll be richly rewarded for your efforts I assure you. Send word to meet me back here when you are finished.'");
	ThreadManager:Wait(0.65);
	
	local gerton = eq.get_entity_list():GetMobByNpcTypeID(118076);
	if(gerton.null) then
		return;
	end
	
	gerton:Say("Consider it done. Be sure to watch yourself Murd, the Dain's gotta be suspicious of ya, being Rodrick's brother and all. And those outlander friends of his are dangerous, chopped down the Ry`Gorr chief like he was nothin!");
end

function MurdrickTimer(e)
	Murdrick = e.self;
	if(e.timer == "start") then
		eq.spawn2(118121,0,0,3690,-5919,130,65); -- NPC: Dialogueman
		ThreadManager:Create("DavinConversation",DavinConversation)
	elseif(e.timer == "murdrick") then
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("DavinConversation");
	end
end

function MurdrickCombat(e)
	if(e.joined) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(118121)) then
			eq.depop_with_timer();
			eq.depop(118121);
			eq.stop_timer("start");
			eq.stop_timer("murdrick");
		else
			eq.depop(118121);
			eq.stop_timer("start");
			eq.stop_timer("murdrick");
		end
	else
		eq.set_timer("start",267000);
		eq.set_timer("murdrick", 10000);		
	end
end

function ConvoSpawn(e)
	eq.set_timer("depop",100000);
end

function ConvoTimer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function MurdrickSpawn(e)
	eq.set_timer("start",267000);
	eq.set_timer("murdrick", 10000);
end

function event_encounter_load(e)
	eq.register_npc_event("Murdrick", Event.timer, 118061, MurdrickTimer);
	eq.register_npc_event("Murdrick", Event.spawn, 118061, MurdrickSpawn);
	eq.register_npc_event("Murdrick", Event.combat, 118061, MurdrickCombat);

	eq.register_npc_event("Murdrick", Event.spawn, 118121, ConvoSpawn);
	eq.register_npc_event("Murdrick", Event.timer, 118121, ConvoTimer);
end
