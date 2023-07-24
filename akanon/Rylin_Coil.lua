function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yikes!  Don't startle a fellow like that!");
	end
end
