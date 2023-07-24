local lecture = 0;

function HorrorSpawn(e)
	eq.set_timer("Horror",math.random(9000000,12600000));
end

function HorrorSpawnTimer(e)
	if(e.timer == "Horror") then
		eq.spawn2(153004,0,0,1107,-450,130,64);
		eq.set_timer("Horror",math.random(9000000,12600000));
	end
end

function ThoughtHorrorSpawn(e)
	eq.set_timer("move",10000);
end

function ThoughtHorrorSpawnTimer(e)
	if(e.timer == "move") then
		eq.stop_timer("move");
		eq.set_timer("lecture",16000);
		eq.move_to(1196,-485,134,157,true);
	elseif(e.timer == "lecture") then
		lecture = lecture + 1;
		if(lecture == 1) then
			e.self:Emote("stares at you as you feel a slight tingling in your head. You feel a flash of pain from deep within your eye sockets as a booming voice fills your mind seeming to come from the inside of your ears rather than out.'Are these the pathetic worms that destroyed my playthings? Fools, it took weeks for me to reach the mind of that witless slave, and even longer for me to fill his mind with visions of escape and freedom into the deep.'");
		elseif(lecture == 2) then
			e.self:Emote("'s tendrils flair about and you feel the strange sensation that a small worm is digging through your brain. 'Ah, I sense you seek to know the fate of these former scaled wretches. Once I lured the slaves into our realm it was much easier to plant the visions of their escape into that taskmaster's sight. He followed of course, how could he not and risk failing his precious emperor. All of their deaths were swift and sweet but, you see, that is where the fun just began");
		elseif(lecture == 3) then
			e.self:Emote("'s eyes gleam as a horrible pounding pulses through your mind which you quickly identify, much to your horror,  as laughter. The sudden image of a white temple with marble sculptures and ancient runes covering the walls flashes before your eyes. A serpent's tail flickers to the left, a whip cracks to your right. An Iksar is kneeling before you begging for forgiveness when suddenly, as quickly as they began, the images fade.");
		elseif(lecture == 4) then
			e.self:Emote("'s mouth twists into a cruel version of what can only be a smile.'Reanimating them was an easy thing as well, the real trick came in wiping their most recent memories and convincing them that they were still alive. Yesss, now you understand. What you saw was the decomposing remains of their bodies mindlessly set about useless tasks. But what they saw was themselves still within their temple, reliving the same trials over and over. Beautiful, yes?'");
		elseif(lecture == 5) then
			e.self:Emote("'s grip within your mind begins to slip as your will strengthens and your resolve to expel this being from your mind grows stronger.'Interesting, I sense your resistance growing. Perhaps it is time to end this game then. Whether you are the ones that destroyed my playthings or not matters little. I need replacements, and you will do just fine. Come to me fleshlings, come to Xilniov!'");
			eq.stop_timer("lecture");
			eq.spawn2(153002,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			lecture = 0;
			eq.depop();
		end
	end
end

function XilniovSpawn(e)
	eq.set_timer("depop",720000);
end

function XilniovTimer(e)
	eq.depop();
end

function XilniovCombat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("thoughthorror", Event.spawn, 153181, HorrorSpawn);
	eq.register_npc_event("thoughthorror", Event.timer, 153181, HorrorSpawnTimer);
	eq.register_npc_event("thoughthorror", Event.spawn, 153004, ThoughtHorrorSpawn);
	eq.register_npc_event("thoughthorror", Event.timer, 153004, ThoughtHorrorSpawnTimer);
	eq.register_npc_event("thoughthorror", Event.spawn, 153002, XilniovSpawn);
	eq.register_npc_event("thoughthorror", Event.timer, 153002, XilniovTimer);
	eq.register_npc_event("thoughthorror", Event.combat, 153002, XilniovCombat);
end