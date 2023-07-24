function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". We have been sent to protect Fort Jaggedpine against the gnoll threat. Sergeant Caelin seems confident being a veteran of many battles against the gnolls of Blackburrow. I am a bit [concerned] myself due to some rumors I have been hearing.");
	elseif(e.message:findi("concerned")) then
		e.self:Say("I have heard some disturbing things about the nature of the gnolls that inhabit the caves to the north. Though we guards of Qeynos may be confident of our skills against the younger gnolls, their lesser scouts and spies and the lone fanatics that foolishly attempt to breach the walls of Qeynos we have little in the way of experience against the [upper echelon] of gnoll leadership.");
	elseif(e.message:findi("upper echelon")) then
		e.self:Say("I have heard that the gnolls that have moved from Blackburrow into these caves were all former Captains and Elite Guards. Gnolls of this caliber are not the usual curs that plague our citizens like roaches. No, these gnolls are among those that mastermind the raids and arrange dark deals in shadowy back alleys with the enemies of Qeynos. Even more disturbing is that a [powerful warrior] is said to lead them.");
	elseif(e.message:findi("powerful warrior")) then
		e.self:Say("According to those that have gone against him and lived, his skill in combat is said to rival the likes of Kane Bayle and even Ebon Strongbear if such a thing is even possible. No doubt if this is true, he has been training his underlings for the inevitable invasion. I fear what may happen if all this is true. But I may just be getting worked up over nothing. You know how rumors fly and inflate as they pass from the mouths of gossips into the ears of the gullible.");
	end
end