function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! You look like a healthy " .. e.other:Race() .. ". We should play a game of coppers some time! You wouldn't be afraid to drink against a woman would ya?"); 
	end
end
