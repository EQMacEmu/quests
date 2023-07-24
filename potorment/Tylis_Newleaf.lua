local KEY_ITEM_ID = 22954; -- Screaming Sphere

function RaidHasKey(client)
	local group = client:GetGroup();
	local raid = client:GetRaid();

	if ( raid and raid.valid ) then
		local member;
		for i = 0, 71 do
			member = raid:GetMember(i);
			
			if ( member and member.valid ) then
				if ( member:KeyRingCheck(KEY_ITEM_ID) or member:HasItem(KEY_ITEM_ID) ) then
					return true;
				end
			end
		end
		
	elseif ( group and group:GroupCount() > 0 ) then
		for i = 0, 5 do
			local member = group:GetMember(i):CastToClient();

			if ( member.valid ) then
				if ( member:KeyRingCheck(KEY_ITEM_ID) or member:HasItem(KEY_ITEM_ID) ) then
					return true;
				end
			end
		end
	else
		if ( client:KeyRingCheck(KEY_ITEM_ID) or client:HasItem(KEY_ITEM_ID) ) then
			return true;
		end
	end

	return false;
end

function event_say(e)

	if ( e.message:findi("hail") ) then 

		e.self:Emote("doesn't move, but struggles to whisper, '...help ...end this torment ...will you come?  I can show you the pain... it moves in the shadows of my mind... will you assist me?'");

	else
	
		local qglobals = eq.get_qglobals(e.other);
		local noflag = false;
		
		if ( e.message:findi("will assist you") ) then
		
			if ( qglobals.tylis and RaidHasKey(e.other) ) then
				e.self:Say("Please tell me when you are ready.  I do not know if I have enough energy to channel all of you, but I can try.  When you are ready, I will channel you into my pain.");
			else
				noflag = true;
			end
		
		elseif ( e.message:findi("we are ready") ) then
		
			if ( qglobals.tylis and RaidHasKey(e.other) ) then
				e.self:CastSpell(1134, e.other:GetID()); -- Insanity of Tylis
			else
				noflag = true;
			end
		end
			
		if ( noflag ) then
			e.other:Message(0, "Tylis Newleaf tells you, 'I sense the desire in you to help, but I don't know if you possess the kind of power needed to release me from my anguish.  Please seek out my companion Fahlia and see if she can offer you a way to better yourself before undertaking this task.'");
		end
	end
end
