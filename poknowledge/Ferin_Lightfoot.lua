function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:DoAnim(29);
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. ". I am Ferin Lightfoot. resident of New Tanaan and scholar in my prime. Now. in my retirement from the excitement of my former life as an adventurer. I am here to offer what knowledge I can in order to help those akin to my former life. In addition to basic supplies which you may need on your adventures I also carry some books which may help liven up any dull. boring spells during your travels.");
	end
end
