function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! Welcome to my little base of operations. It is not much, but my glory will soon march upon the land.");
		eq.signal(68217,1); -- NPC: Guard Gonin
	elseif(e.message:findi("gonin")) then
		e.self:Say("Gonin is my older brother. I promised our parents that I would look after him. He is a bit loony.");
	end
end

function event_signal(e)
	e.self:Say("Quiet, you!");
end