function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi " .. e.other:GetCleanName() .. ", can I interest you in some tinkering supplies?  Some of the most amazing things can be made if you just have the know-how.");
	end
end
