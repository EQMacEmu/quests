function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Good day to you, " .. e.other:GetCleanName() .. "! Learn to mind your own business in this place. If a fight breaks out, do not get in the way.");
	end
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		e.self:Say("Yes! Send more high elf ladies to Freeport.");
		turn = true;
	elseif ( e.signal == 4 ) then
		e.self:Say("Qeynos is a great city. Their troops have aided Rivervale many times.");
		turn = true;
	elseif ( e.signal == 5 ) then
		e.self:Say("Those Erudites are no fun at all.");
		turn = true;
	elseif ( e.signal == 6 ) then
		e.self:Say("That voice must have scared him away.");
		turn = true;
	elseif ( e.signal == 7 ) then
		e.self:Say("Biggle Limbokker for ruler of Qeynos!! A vote for Biggle is a vote for grub, grog and song.");
		turn = true;
	end
	
	if ( turn ) then
		bard = eq.get_entity_list():GetMobByNpcTypeID(10141);			-- NPC: Trolon_Lightleer
		if ( not bard.valid ) then
			bard = eq.get_entity_list():GetMobByNpcTypeID(10158);		-- NPC: Branis_Noolright
		end
		if ( not bard.valid ) then 
			bard = eq.get_entity_list():GetMobByNpcTypeID(10165);		-- NPC: Palana_Willin
		end
		if ( bard.valid ) then
			e.self:FaceTarget(bard);
		end
	end
end
