function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No, I don't have anything for sale and no I don't want any of your filthy money. Can't you see I have important work to do? Why don't you go talk to that banker and give it to him? There's been nothing but trouble since you all arrived. I'm sick and tired of you people traipsing through here like you own the place. Before you know it, this place will be a smelly den of inequity like Qeynos. I'd like to take that Banker Mardalson and all the rest and feed them to the [river]!");
	elseif(e.message:findi("river")) then
		e.self:Say("Yeah, go have yourself a nice walk and visit the river. Say hello to the [potameids] while you're there. They'll be as happy as I am to see you.");
	elseif(e.message:findi("potameid")) then
		e.self:Say("Yes, Potameids. Water Nymphs. They guard the river. Legend has it that long ago the Unkempt asked their queen to prevent intruders from crossing the river and entering the Unkempt Woods. The Queen agreed and now to this day everyone that gets close to the river is seldom heard from again. Why don't you go take a look already and leave me alone!");
	end
end