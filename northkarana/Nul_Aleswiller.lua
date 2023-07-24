function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  What brings you out this way?  I am the leader of the [Fangbreakers].  We are employed by the [people of the Plains of Karana] to keep their homeland free of [lycanthropes].  We are on the trail of several particularly nasty [werewolves].");
	elseif(e.message:findi("fangbreaker")) then
		e.self:Say("The Fangbreakers are the greatest [lycanthrope] hunters in all of Norrath!  I am the leader and a warrior of great prowess.  Fixxin is the spellslinger in our little band.  Cory is our tracker and scout.  My tall friend Bunu keeps us all healthy as well as lending some added muscle to the group.");
	elseif(e.message:findi("werewolves") or e.message:findi("lycanthrope") or e.message:findi("werewolf")) then
		e.self:Say("Lycanthropes or werewolves, as the peasants call them, are humans, barbarians or Erudites who are cursed with a dread disease which, under the light of the moon, transforms them into ravenous beasts of great strength and even greater hunger for living flesh.  They prowl these hills, so beware!");
	elseif(e.message:findi("karana")) then
		e.self:Say("The Plains of Karana are home to many different people of many races, but most of them are humans.  They are mainly farmers by trade.");
	elseif(e.message:findi("kaladim")) then
		e.self:Say("Kaladim, the dwarven stronghold on Faydwer, is where I was born but I have made the [Plains of Karana] my home for many years now.");	
	end
end
