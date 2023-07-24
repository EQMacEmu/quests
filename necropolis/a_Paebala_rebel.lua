function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Chita ve ni ne, ni ne Neb!");
	end
end