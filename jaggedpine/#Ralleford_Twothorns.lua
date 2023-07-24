function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Twothorn's residence. My name is Ralleford and this is my wife Diedra and daughter Donna. Things have been a bit [tense] around here lately.");
	elseif(e.message:findi("tense")) then
		e.self:Say("We've lived here in relative peace for a long time enjoying the tranquility of the forest living off the blessing provided us by Karana. However, some time ago the gnolls managed to tunnel their way through their burrow and have found an entryway into the forest. A group of them have moved out of Blackburrow and have set up residence in a cave to the north. Many of us are very [worried].");
	elseif(e.message:findi("worried")) then
		e.self:Say("We have good reason to be worried. The gnolls have always been a threat to the city of Qeynos from what I gather,  but they are a well-defended city with a standing army. We are but a small and simple community and we think that the gnolls may attack us very soon. I fear for the [safety of my daughter] the most.");
	elseif(e.message:findi("daughter")) then
		e.self:Say("Well, she's getting to that age now. As much as I'd like to keep her here at home she's pretty much grown and she's taken to the habit of sneaking out when she thinks we aren't looking and from what I hear, she's been visiting Qeynos. And with that dreamy and wistful look in her eye, something tells me she's found herself a boyfriend. If you happen to catch her wandering off, could you keep an eye on her just to make sure she's ok?");
	elseif(e.message:findi("fort") or e.message:findi("throne")) then
		e.self:Say("I don't really mind the name change I guess. I'm a little nostalgic and kind of liked the old name but honestly, times change. My wife is a bit more opinionated then I am though. I'm just happy to have the guards here to protect my family and I from the threat of those accursed gnolls.");
	end
end