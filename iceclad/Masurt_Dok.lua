function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("That's me name, me job too.  'Masert ub da dok,' as a mate once called me.  Course I was the bosun at the time, and we weren't at a dock, but he was drunk.  Captain Nalot's Triple Strength will do that to ya.");
	elseif(e.message:findi("triple strength")) then
		e.self:Say("Aye.  A better rum I never had.  Warms the stomach and brings a tear to yer eye.  Our leader, Captain Nalot, used ta make it.  Can't find any ingredients in this ice clad hell, though.");
	elseif(e.message:findi("ingredient")) then
		e.self:Say("I'm no brewer, mate.  Best ask the Captain.");
	end
end