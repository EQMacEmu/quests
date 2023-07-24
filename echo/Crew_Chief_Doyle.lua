function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Arggh!  Can ye believe me luck?  Just when we were starting to get ahead of schedule this goes and happens.");
	elseif(e.message:findi("happen")) then
		e.self:Say("Durin a routine fissure break in main shaft one down the lift over there we broke into a colony of the little beasts. Nasty rock burrowers they are, took out three of our crew before we had a chance to evacuate the rest. Now if'n ye'll excuse me, the loss of that shaft has got us workin twenty four seven ta ensure that we make our gold delivery date.");
	end
end
