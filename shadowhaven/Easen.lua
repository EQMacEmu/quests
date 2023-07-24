function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ye sure don't look like me wife " .. e.other:GetCleanName() .. ", now git outta here in case she comes back and gets da wrong idea!");
	end
end
