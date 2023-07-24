function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". I am Peighro of House Midst. I have dedicated my life to serving as a guard here to ensure that our quarter will continue to be a place where anyone is welcome to come and find the power that lies within whatever magics they practice.");
	end
end
