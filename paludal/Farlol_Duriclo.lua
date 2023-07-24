function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Allo dere " .. e.other:GetCleanName() .. ". A mining I am indeed Aye. Daesorak is a gud and fair boss to us. he keeps us on schedule well. Well enough about me I hope ya find what ya seek in these caves.");
	end
end
