function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I carry spell scrolls for younger Shamans. Should you know anyone in need of my teachings please send them to see me.");
	end
end
