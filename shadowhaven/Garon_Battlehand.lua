function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. ". I am responsible for all of the newly recruited Defenders of the Haven. I make sure that our soldiers are trained well and ready for any conflict that may present itself. All of those that pass though my training exercises are sure to be the best of the best.");
	end
end
