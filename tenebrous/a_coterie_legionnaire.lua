function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahhh, the sweet aroma of " .. e.other:Race() .. " blood! Join us mortal, or we shall drain your body of all traces of life and leave your carcass to the wolves.");
	end
end
