function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Nectar of Unity Tavern! My family has been running this establishment since the very birth of Katta Castellum. Please stay and sample our fine selection of imported and house brews! I am sure you will find the company here in the tavern quite pleasant as well.");
	end
end
