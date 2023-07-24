function event_say(e)
	
	if ( e.message:findi("hail") ) then
	
		local questState = tonumber(eq.get_qglobals(e.other).pov_orb_quest or 0);

		if ( questState == 0 ) then
			e.self:Say("State your business or leave our [compound].");
			if ( questState == 0 ) then
				eq.set_global("pov_orb_quest", "1", 1, "H6");
			end
		else
			e.self:Say("Leave now before there is bloodshed.");
			if ( questState == 1 ) then
				eq.set_global("pov_orb_quest", "2", 1, "H6");
			end
		end
		
	elseif ( e.message:findi("compound") ) then
		e.self:Say("This is the primary command center for Che Virtuson. We fall under the leadership and guidance of Captain Ryglot. I must now ask you to leave.");
	end
end
