function event_signal(e)
	e.self:Say("Yeah, Yeah. I hope you fall in, you little creep.");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Welcome to Fish's Ale.  Have fun but watch your step.  We get a rough crowd in here and I would hate to have to bust your head in if you started trouble.");
	elseif(e.message:findi("trumpy")) then
		e.self:Say("Trumpy?  That little chunk of troll dung is around here most of the time.  Try looking under the tables.");
	elseif(e.message:findi("kane")) then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");	
	end
end
