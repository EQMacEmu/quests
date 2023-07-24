function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing in here?  Get out, no one invited you here, leave me be!  Come back again and I'll call the guards.  Go!");
	elseif(e.message:findi("exodus")) then
		e.self:Say("I have books, I have lots of books, books about the Exodus and all kinds of things but they're mine, you hear me?   Mine!  You'll get that book over my dead body, now get out!  Out, I say!");
	end
end
