function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Uh, hi. Hey, that was great work and all. I couldn't believe that. Knowing that bear, I was sure my time was up. I'm heading back to Ak'Anon. I've had enough of pirates, mountains, snow, and bears ten times my size. If you want a map to get back you can have it.");
	elseif(e.message:findi("map")) then
		e.other:QuestReward(e.self,0,0,0,0,30045,1000);
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end