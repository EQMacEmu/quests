function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, friend?  It is a good day to be alive in Antonica!  If you should happen to visit Surefall Glade, say hello to Hager Sureshot for me.");
	elseif(e.message:findi("hager")) then
		e.self:Say("Hager Sureshot is that know-nothing ranger in charge of the Protectors of the Pine. He thinks he can protect all of Surefall Glade. He is wrong.");
	end
end

