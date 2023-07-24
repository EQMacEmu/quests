function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("There's nothin' more satisfyin' then loadin' a good haul after a long days work.");
	end
end
