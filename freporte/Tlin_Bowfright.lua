function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("Nice to meet you! Sit down! Have some food and grog. Just learn not to annoy anyone in here. This place attracts a pretty rough crowd at times. It is not uncommon to have a brawl break out");
	end
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		e.self:Say("Let's all live together in peace. That is, everyone except the ogres, trolls and dark elves!");
		turn = true;
	elseif ( e.signal == 2 ) then
		e.self:Say("Yes. Those ogres sure are dumb and smelly.");
		turn = true;
	elseif ( e.signal == 4 ) then
		e.self:Say("I wish the Qeynos Guards would come and conquer Freeport. The Freeport Militia are nothing more than mercenaries and criminals.");
		turn = true;
	elseif ( e.signal == 6 ) then
		e.self:Say("I shall take care of you, milady.");
		turn = true;
	elseif ( e.signal == 7 ) then
		e.self:Say("Hey!! Keep it down! The Freeport Militia might hear that song and arrest us all.");
		turn = true;
	elseif ( e.signal == 10 ) then
		e.self:Say("The only blithering fool in here is you, Talym Shoontar.");
		eq.signal(10182, 10); -- Talym_Shoontar
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
