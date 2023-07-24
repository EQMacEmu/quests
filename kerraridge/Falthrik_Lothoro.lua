function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -500) then
		if(e.message:findi("hail")) then
			e.self:Say("Grrrreetings. traveler.  Falthrik tells his [stories] now.  Seat yourself near the fire if you wish to [listen].");
		elseif(e.message:findi("stories")) then
			e.self:Say("Once Falthrik was mighty saiar but no more. Years have weakened Falthrik's knees. made his back frail. dulled his once powerful claws.  Falthrik now earns his rank and keep in the pride by telling stories. amusing the people. teaching the young his knowledge with stories.");
		elseif(e.message:findi("listen")) then
			e.self:Say("Rrrrr.  Many stories Falthrik has to tell.  Most would not suit you. would not translate to common well but perhaps I tell you [history] of Kerrans. stories of their past and present.");
		elseif(e.message:findi("history")) then
			e.self:Say("So you wish to listen?  That is good.  Then sit. listen to the story of the pride.  Our stories all start the same.  In the beginning there was the mighty Kejaan.  No one remembers the lineage of Kejaan.  Many think he didn't have one.  It is said no god made him. that his spirit came from the winds and his body from the rocks.  Wherever he came from. his [legends] are many.");
		elseif(e.message:findi("legends")) then
			e.self:Say("Kejaan traveled the land of Odus far and wide.  He visited the splintered and fighting tribes of Kerrans and gathered together his companions. Kerrans of power and knowledge.  Together Kejaan and his companions tamed the wild lands of Odus.  They journeyed through jungle. desert. and beach killing monsters and evil.  They made the land safe for all Kerrans.  This is when the [golden time] started.");
		elseif(e.message:findi("golden time")) then
			e.self:Say("Rrrrr..  The golden time.  After Kejaan and his companions tamed the lands. he came back to the splintered tribes.  With his strength of claw and mind. he [united] all the Kerran people around him. made them into a mighty civilization. Made them strong and smart.");
		elseif(e.message:findi("united")) then
			e.self:Say("For many hundreds of years. Kerrans were mighty and wise.  Elves. dwarves. humans. all races knew the might of Kerra.  All things end though. and our empire fell eventually. our proud history and achievements torn apart and destroyed by the foul Erudites.  We could have shared land but the haughty Erudites would not share. so they [destroyed].");
		elseif(e.message:findi("destroyed")) then
			e.self:Say("Destroyed utterly.  Tried to remove all trace of great Kerran works.  Cities. statues. writings.  All gone.  Kerrans fled to this tiny island. forced to leave by Erudites.  Many Kerrans. many of our finest. died on journey here.  Poets. warriors. shamans. children.  Kerrans settled here. made this little island of dirt home. continued [old customs and traditions].");
		elseif(e.message:findi("old customs and tradition")) then
			e.self:Say("Yes.  How we live.  Way we organize.  In Kerran peoples. magic runs greatest in females.  They grow larger and stronger.  It is females who are most worshipped and revered as mothers and protectors.  That is why all adult female Kerrans live in inner village and all [males] live on beach.");
		elseif(e.message:findi("males")) then
			e.self:Say("Male Kerran smaller and quicker than female.  Male Kerran make good guards.  Females watch after Kerran souls and guide Kerrans. males guard Kerran safety.  All Kerrans understand their [place] in life.");
		elseif(e.message:findi("place")) then
			e.self:Say("Many places.  Young live on beach and learn how to be shamans. guards. or tradespeople.  Old live their last days on beach teaching young.  Males guard all of Kerra.  Females guard inner village. leaders. and talk to spirits.  It is right way of things.  Rrrrr..  I have talked for so long.  Must eat and rest now.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end
--END of FILE Zone:kerraridge  ID:74019 -- Falthrik_Lothoro


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
