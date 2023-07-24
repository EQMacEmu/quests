function event_say(e)

	if ( e.message:findi("hail") ) then
		e.self:Say("Well look what the wrulon dragged in? My, aren't you a sad "..e.other:Race().."? Well is there something you want, or are you going to just stand there and look stupid? This tent is for [disciplinary] cases.");
		
	elseif ( e.message:findi("disciplinary") ) then
		e.self:Say("Yes you thick skulled buffoon.  Disciplinary cases, we have rules, when those rules are broken the soldier or soldiers responsible see me, and none of these soldiers want to see me.  Isn't that right soldiers?");
		eq.signal(208036, 1); -- Genii_Rolfs
		eq.signal(208037, 1); -- Aken_Feldmin
		eq.signal(208035, 1); -- Barry_Karmme
	end
end
