function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings adventurer! I am sorry but I can not engage in conversation while I am on duty. you never know when an enemy will show itself.");
	end
end
