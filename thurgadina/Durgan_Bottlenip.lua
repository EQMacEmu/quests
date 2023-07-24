function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ye need a swig of some fine dwarven ale!");
	end
end
