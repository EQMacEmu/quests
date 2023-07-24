function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to the Temple of Life! The healing of the world shall begin within. Let me know if you have seen a [new disciple of life]. I have a task which needs to be attended to.");
	elseif(e.message:findi("disciple of life")) then
		e.self:Say("It is good to meet a new follower of the Prime Healer. Remember that we must defend all life. Disease and poison are the enemies. Within Qeynos we work hand in hand with other guilds. I seek an acolyte to [deliver a flask].");
	elseif(e.message:findi("deliver a flask")) then -- no faction requirements, tested
		e.self:Say("Our allies, the Knights of Thunder, have requested that we aid their followers in the Plains of Karana. We have a few young acolytes working there now. Take this blessed oil to Brother Estle. Follow the path to the plains. He shall be waiting for you by a tree alongside the path.");
		e.other:SummonCursorItem(13910); -- Item: Blessed Oil Flask
	elseif(e.message:findi("bertoxxulous") or e.message:findi("plaguebringer")) then
		e.self:Say("He is the wicked one.  The breath of disease which blows across the land.  We are sworn to stop any who call him lord.");
	elseif(e.message:findi("trintle")) then
		e.self:Say("What is all this about Brother Trintle?!  I was not the one to recruit him.  Speak with Suuspa Clanim.");	
	elseif(e.message:findi("prime healer")) then
		e.self:Say("He is the reason we are standing here talking.  He is the lord of all life giving energy.  This is His temple and we are His servants.");
	elseif(e.message:findi("heal")) then
		e.self:Say("I cannot help you with your request.   You must speak with Brother Tonmerk Plorsin.");
	end
end
