function event_signal(e)
	if ( e.signal == 1 ) then
		e.self:Shout("The Sleeper has been awakened!  Shun the Skyshrine if you value your lives, for he shall be here soon!");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I hope for your sake that you are no friend of the Kromrif or Kromzek and no enemy of the Tunarean Court.");
	end
end