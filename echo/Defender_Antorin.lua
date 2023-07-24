function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("grins, 'Excellent, fresh blood.  I hope you brought plenty of cash, I'm on a winning streak tonight.");
	end
end
