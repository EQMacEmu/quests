function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Did Duke Norfin send you?  Good I really need to teach these two better control of their blades.  Stand over there next to one of the target dummies and if you are hit with a missed throw then you can do what you wish to them.  Perhaps that will properly motivate them.");
		else
			e.self:Say("You have a lot of nerve wandering in here.  We'll be watching you carefully.  Try anything and it will be the last thing you ever try.");
		end
	end
end