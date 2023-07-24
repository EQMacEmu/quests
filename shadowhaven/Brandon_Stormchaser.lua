function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ", it's nice to see some new faces in the Haven. I am Brandon Stormchaser and I keep watch over the guildmaster hall we have here. It was a pleasure meeting you, but I must get back to my post now.");
	end
end
