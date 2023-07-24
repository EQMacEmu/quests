function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey, " .. e.other:GetCleanName() .. "!  I am Cory Bumbleye, expert [lycanthrope] tracker.  You had better be careful out here.  There are [werewolves] in these hills.  Heck, if it weren't for us [Fangbreakers], this whole area would be overrun with the flea-bitten beasts.");
	elseif(e.message:findi("fangbreaker")) then
		e.self:Say("I am a Fangbreaker.  We hunt werewolves.  We are the best in all of Antonica.");
	elseif(e.message:findi("werewolves") or e.message:findi("lycanthrope") or e.message:findi("werewolf")) then
		e.self:Say("Peh!  Werewolves are just overgrown dogs that need to be put down.  And let me tell you this, if a friend of yours ever survives a werewolf attack, I would watch him VERY closely.  If he is infected, you will have no choice but to slay him before he eats you.");
	elseif(e.message:findi("rivervale")) then
		e.self:Say("Rivervale?  I am from Rivervale.  I joined up with the Fangbreakers when they tracked a [werewolf] into the Misty Thicket.");	
	end
end
