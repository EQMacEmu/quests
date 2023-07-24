function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, stranger. My little pub here is I guess what most would call a little hole in the wall. I'll tell ya what though, you did good coming to visit today 'cause I got some of the finest haven-brewed ales right on tap.");
	end
end
