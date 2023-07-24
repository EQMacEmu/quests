function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs at you. 'Another furless one.  Strange looking you all are.  We've had to chase away some of your kind because they try to hurt us.  You seem ok though.'  It sniffs at you again.  'If you want to stay safe, keep away from the tower.");
	end
end