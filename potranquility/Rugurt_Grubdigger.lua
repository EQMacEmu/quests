function event_spawn(e)
	e.self:CastToNPC():SetNoQuestPause(true);
	eq.set_timer("inifish",math.random(32000));
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh. what you want? Don' scare off da fishes. less you want me to toss you in with dem.");
	end
end

function event_timer(e)
	if(e.timer == "inifish") then
		eq.stop_timer("inifish");
		eq.set_timer("fish",32000);
		e.self:DoAnim(5);
	elseif(e.timer == "fish") then
		e.self:DoAnim(5);
	end
end