local ThreadManager = require("thread_manager");
local fronden = nil;

function frondenConversation()
	local saramor = eq.get_entity_list():GetMobByNpcTypeID(115010);
	if(saramor.valid) then
		saramor:Say("So good to see you, Rumagur. I hope you're feelin better today.");
	end
	ThreadManager:Wait(0.65);
	
	local rumagur = eq.get_entity_list():GetMobByNpcTypeID(115187);
	if(rumagur.valid) then
		rumagur:Say("Aye Sara, much better indeed. With the help of good Fronden here I think I've finally figured out what was causing the alarming condition under me left arm. I must admit it was givin me quite a scare for a while, not to mention the pain was drivin me to drink.");
	end
	ThreadManager:Wait(0.65);
	
	if(saramor.valid) then
		saramor:Say("Well, don't ya just keep us in suspense now. What in the world was it?");
	end
	ThreadManager:Wait(0.65);

	if(rumagur.valid) then
		rumagur:Say("Every day I come here to wet me whistle and I stand in the same spot, facin' the same way. As yer good wares take effect on me I lean more and more upon the bar here. The constant pressure was causin' me to develop... well... barsores. So I'll just have to face the other way from now on.");
	end
	local jorumin = eq.get_entity_list():GetMobByNpcTypeID(115188);
	if(jorumin.valid) then
		jorumin:CastToNPC():DoAnim(63);
	end	
	ThreadManager:Wait(0.65);

	if(jorumin.valid) then
		jorumin:CastToNPC():DoAnim(63);
	end	
	fronden:Say("Seramor, please remind me to water down the spirits a bit.");
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);
	
	fronden:Say("So I was polishing up the bar the other day when in hops this piece of rope and says, 'I'll take a bottle of Frostreaver's Frozen Vodka.' I look at him and I says, 'We don't serve no ropes here, now beat it!' Hehe. . .");
	ThreadManager:Wait(0.65);
	
	fronden:Say("Not ten minutes later a piece of rope comes hoppin' in and says the same thing, only this one's tied up in the middle and one end is all messed up. So I says, 'Hey, ain't you the same piece o' rope I just kicked outta here?'");
	ThreadManager:Wait(0.65);
	
	fronden:Say("He looks me dead in the eyes and says, 'Nope, I'm afraid not.' <grin>");
	if(rumagur.valid) then
		rumagur:CastToNPC():DoAnim(65);
	end
	if(jorumin.valid) then
		jorumin:CastToNPC():DoAnim(65);
	end	
	ThreadManager:Wait(0.65);
	
	if(rumagur.valid) then
		rumagur:Say("Say, Fronden, ya got anything stronger lyin' around back there?");
	end
	ThreadManager:Wait(0.65);	

	fronden:Say("Hmm, let's see here, aah yes. This is a special bottle handed down to me by my father, and it's been in my family for ages. Not really sure what it's made of, but yer welcome to give it a try.");
	ThreadManager:Wait(0.65);
	
	if(rumagur.valid) then
		rumagur:Say("I'd be honored to try your family recipe. Thank ye.");
	end
	ThreadManager:Wait(0.65);	

	fronden:Emote("watches as Rumagur pours the contents of the bottle into his mouth.");
	ThreadManager:Wait(0.65);

	if(rumagur.valid) then
		rumagur:Emote("looks at Fronden through crossed eyes and whispers hoarsely, 'Smooth'.");
	end
	ThreadManager:Wait(0.65);
	ThreadManager:Wait(0.65);
	
	if(rumagur.valid) then
		rumagur:CastToNPC():DoAnim(15);
	end	
end

function SaramorWaypoint(e)
	if(e.wp == 4) then
		e.self:SetRunning(false);
	elseif(e.wp == 9) then
		eq.stop();
		eq.signal(115014,1); -- NPC: Loremaster_Fronden
	end
end

function frondenHeartbeat(e)
	if(e.timer == "fromden_hb") then
		fronden = e.self;
		ThreadManager:GarbageCollect();
		ThreadManager:Resume("frondenConversation");
	end
end

function frondenSignal(e)
	ThreadManager:Create("frondenConversation", frondenConversation);
end

function frondenSpawn(e)
	eq.set_timer("fromden_hb", 20000);
end

function event_encounter_load(e)
	eq.register_npc_event("fronden", Event.waypoint_arrive, 115010, SaramorWaypoint);
	eq.register_npc_event("fronden", Event.timer, 115014, frondenHeartbeat);
	eq.register_npc_event("fronden", Event.spawn, 115014, frondenSpawn);
	eq.register_npc_event("fronden", Event.signal, 115014, frondenSignal);
end
