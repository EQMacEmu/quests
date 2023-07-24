function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("What do you want? I don't have any spare change.");
	end
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		e.self:Say("Yes. We shall live together. We shall be strong.");
		turn = true;
	elseif ( e.signal == 2 ) then
		e.self:Say("Ha!! Dumb ogres. Plnorrick can bash any of them.");
		turn = true;
	elseif ( e.signal == 3 ) then
		e.self:Say("<Clap>.. <Clap>.. <Glug, glug>.. Ahh. I love that song. <Hic!!>");
		turn = true;		
	elseif ( e.signal == 5 ) then
		e.self:Say("Smash Erudin!! They are weak. They should be destroyed!!");
		turn = true;
	elseif ( e.signal == 10 ) then
		-- This NPC text is not precise.  It was put together from these alla comments:
		-- http://everquest.allakhazam.com/db/npc.html?id=985#m107866514287264
		-- http://everquest.allakhazam.com/db/npc.html?id=896#m107866603072607
		-- I just really wanted this bar fight in, which does happen
		e.self:Say("My fist will unite with your face.");
		e.self:AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(10012),500); -- Imxil_Tbrow
		eq.signal(10012, 10);
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
