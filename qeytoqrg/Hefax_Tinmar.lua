function event_signal(e)
	e.self:Say("Oh, great. I feel safe already.");
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, traveler! You can rest here in the tower. We shall protect you. I apologize for the scarcity of [patrols].");
	elseif(e.message:findi("patrol")) then
		e.self:Say("[Antonius Bayle's] beliefs are not the beliefs of all Qeynos citizens. We need to concentrate on protecting our own. Let the other nations fill their own graves.");
	elseif(e.message:findi("antonius")) then
		e.self:Say("Antonius Bayle is our illustrious Qeynos governor. He has lost all touch with the regular Qeynos citizen. Soon he will begin to use the title of king and forget all about us peasants. Hail, Antonius Bayle... Really! <snort!>");
	elseif(e.message:findi("kane")) then
		e.self:Say("Kane Bayle is the commander of all the Qeynos militia. The outer and inside group [captains] report to him as well as to the field marshall. Only in times of war does Antonius Bayle assume command of the Qeynos militia, as well as the [Jaggedpine] and [guild house] complements of troops. Stealing glory from the great Kane Bayle!");
	elseif(e.message:findi("captain")) then
		e.self:Say("The militia is split into three brigades. The outer brigade, which is divided among towers like this one, is commanded by Captain Linarius Grafe. The city guard is commanded by Captain Tillin Brightheart. There is a roving platoon of dragoons which are led by Field Marshall Ralem Christoff. No one really ever knows where they are. I doubt even they know.");
	elseif(e.message:findi("jaggedpine")) then
		e.self:Say("The Jaggedpine is home to rangers and druids . They conduct business in their own community, but when things get a little tight there, they come running back to Qeynos for help. Their forest abounds with bears which would provide many bearskins and meat for all if only those blasted treehuggers would allow us to hunt there. Kane would have taken the territory if Antonius had let him.");
	elseif(e.message:findi("guild.* house")) then
		e.self:Say("There are six guild houses in Qeynos city which aid the militia in times of war. They are the Temple of Thunder, the Hall of Sorcery, the Temple of Life, the Silent Fist Clan and the Hall of Steel which is home to the Steel Warriors from which most Qeynos militia are descended. Oh yeah, then there is the Wind Spirit's Song. SOMEbody has to be in the marching band.");
	elseif(e.message:findi("blackburrow") or e.message:findi("gnoll")) then
		e.self:Say("Blast those dogs!  The Sabertooths is what they call themselves around here.  They have a nest, or whatever you call it, up there east of Surefall Glade.  We can always use help here, keeping those dirty gnolls away from our fine city.  Talk to Captain Tillin in South Qeynos and tell him you want to join the fight.");
	end
end