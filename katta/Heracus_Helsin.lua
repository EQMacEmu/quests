function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, adventurer, to the Katta Castellum Reserve! I assure you your coin and belongings will be safe within our fine establishment.");
	end
end
