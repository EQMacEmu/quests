function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Nice to see you, traveler! If it is a refreshing drink you are looking for then I got some stuff that will surely knock ya on your behind! Tis why they call me Mr. Fantalicus!");
		e.self:DoAnim(58);
	end
end
