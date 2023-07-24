function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Among the denizens of the woods there has been babble regarding the crypt of Dalnir.  Dalnir was an old Haggle Baron.  I am sure there will be many crypt raiders searching for its entrance.");
	end
end