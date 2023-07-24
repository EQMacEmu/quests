function event_say(e)

	local questState = tonumber(eq.get_qglobals(e.other).pov_orb_quest or 0);
	
	if ( questState == 3 or questState == 4 ) then
	
		if ( e.message:findi("hail") ) then
			e.self:Emote("stands at attention.");
			
		elseif ( e.message:findi("aid the cause") ) then
			e.self:Emote("looks you over and says in a deep voice 'What could you possibly do to aid our cause. Perhaps you think you can slay [Aerin`Dar] himself?' The Master Sergeant begins to laugh uncontrollably.' I suggest you go back to whoever filled your head with this nonsense and stop wasting my time.'");
			
		elseif ( e.message:findi("aerin") ) then
			e.self:Say("I don't have time to explain the glass dragon to you. Leave before I get angry.");
			if ( questState == 3 ) then
				eq.set_global("pov_orb_quest", "4", 1, "H6");
			end
		end
	
	elseif ( questState >= 5 ) then
	
		if ( e.message:findi("hail") ) then
			e.self:Say("I heard what you did for Paralin Notion. That's quite a noble feat indeed. Perhaps we can use your help. However, you'll need to talk to the Captain first. After all, I can't have you walking in the [glass lair] without permission.");
			
		elseif ( e.message:findi("glass lair") ) then
			e.self:Say("It's the prison that [Aerin`Dar] has been encased in for many generations.");
			
		elseif ( e.message:findi("aerin") ) then
			e.self:Say("Aerin`Dar is the crystalline dragon who once roamed the Plane of Valor. During a severe rainstorm it was struck down to the very core of its being. The mighty Aerin`Dar fell from the sky and landed in what is now known as the Glassy Wasteland. Planarian larvae began to infest its body eventually turning its pure heart to evil. Our [company] was dispatched to this region of Valor to eliminate the threat.");
		
		elseif ( e.message:findi("company") ) then
			e.self:Say("My squad of men are a part of Che Virtuson. However, we specifically are a part of Ducee Buled. We fall under the command of Captain Ryglot. Our [mission], for the time being, is simple. But we've run into some problems lately.");
			
		elseif ( e.message:findi("mission") ) then
			e.self:Say("Not so fast, "..e.other:GetName()..". You'll have to speak to the Captain about that. I'm not at liberty to divulge that information at this time. That information is classified. I can tell you, but then I'd have to kill you.' Aaramis laughs. 'Go to Captain Ryglot and he'll be able to fill you in with all the details.");
			if ( questState == 5 ) then
				eq.set_global("pov_orb_quest", "6", 1, "H24");
			end
		end
	else
		if ( e.message:findi("hail") ) then
			e.self:Emote("nods in your direction.");
		end
	end
end
