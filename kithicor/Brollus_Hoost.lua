function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend.");
	elseif(e.message:findi("staff")) then
		e.self:Say("I was hired to steal a High Guard battle staff from the High Guard of Erudin. It is a gift for Carson McCabe. I guess he collects weapons.");
	elseif(e.message:findi("tallus")) then
		e.self:Say("Tallus Holton was my partner on my last mission. He is actually a wizard, but instead of yearning for knowledge, he yearns for money. He like to hang around the karana bandits. They like him:; he can ignite a campire in a snap.");
	end
end