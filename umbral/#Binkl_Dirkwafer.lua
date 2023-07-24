function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ey! What're you doin' here! This is my home. Shoo. Look at you. What's wrong with you. Here in the middle of giant rotting flesh beasts, abnormal trees, fanged giant death horselike things and youre worried about pleasantries? GO AWAY! You are insane.");
	elseif(e.message:findi("pleasantries")) then
		e.self:Emote("blinks and stares at you for a moment. 'Are you daft?'");
	elseif(e.message:findi("home")) then
		e.self:Say("Fleh! Don't make fun of my home. It's my home. Go Away.");
	end
end