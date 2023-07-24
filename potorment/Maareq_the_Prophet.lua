local power = 0;
local state = 0;

function event_spawn(e)
	power = 0;
	state = 0;
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("minion", 5000);
		eq.stop_timer("revert");
	else
		eq.stop_timer("minion");
		eq.stop_timer("upgrade");
		if ( state > 0 ) then
			eq.set_timer("revert", 480000);
		end
	end
end

function event_timer(e)

	if ( e.timer == "minion" ) then
	
		local mob = eq.spawn2(207297, 0, 0, -25, 0, 451, 128); -- a_minion_of_Maareq		
		mob:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, true);
		
		--[[
		-- permarooted in AK's time, so don't need this
		if ( e.self:GetZ() < 440 or e.self:GetZ() > 475 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
		]]
	
	elseif ( e.timer == "upgrade" ) then
		eq.stop_timer(e.timer);
		
		if ( state == 0 ) then
			e.self:Emote("raises his arms towards the sky and screams! His exposed skin bulges and writhes, as the creatures that clung to him move beneath its surface.");
			e.self:Emote("shouts 'My prophecy was fulfilled for Saryrn.  Your fate shall come to fruition as well!  I have a special vision for you.  Now, step forward like the obedient cattle you are.  Let us begin this harvest of pain!'");

			e.self:ModifyNPCStat("special_abilities", "5,1,25"); -- flurry 25%
			e.self:ChangeSize(12);
			
		elseif ( state == 1 ) then
			e.self:Say("Your assault only prolongs the inevitable!  I can feel the fear dripping for you.  Give into it.  Give up while you still have enough energy to suffer properly!");
			eq.get_entity_list():MessageClose(e.self, true, 200, 0, "A horrific roar reverberates throughout the zone!  Every surface shakes violently for a moment as the sound rolls past you!");

			e.self:SetTexture(0);
			e.self:SetRace(281);
			e.self:SetGender(2);
			e.self:ChangeSize(12);
			e.self:ModifyNPCStat("special_abilities", "5,0,0"); -- disable flurry
			e.self:ModifyNPCStat("special_abilities", "4,1,10"); -- wild/aoe rampage 10%
		
		elseif ( state == 2 ) then
			e.self:Emote("radiates with rage!  The ferocity of it's attacks increases dramatically as it's skin begins to bubble and burst in places!");
			e.self:ChangeSize(17);
			e.self:ModifyNPCStat("attack_delay", "8");
		end
		state = state + 1;
		
	elseif ( e.timer == "revert" ) then
		eq.stop_timer(e.timer);
		
		e.self:SetTexture(16);
		e.self:SetRace(1);
		e.self:SetGender(0);
		e.self:ChangeSize(7);
		e.self:ModifyNPCStat("special_abilities", "5,0,0"); -- disable flurry
		e.self:ModifyNPCStat("special_abilities", "4,0,0"); -- disable wild/aoe rampage
		e.self:ModifyNPCStat("attack_delay", "12");
		power = 0;
		state = 0;
	end
end

function event_signal(e)
	if ( e.signal == 1 ) then
		power = power + 1;

		if ( (state < 3 and power >= 40) or (state < 2 and power >=20) or (state == 0 and power >= 10) ) then
			eq.set_timer("upgrade", 3000);
		end
	end
end

function event_death_complete(e)
	eq.depop_all(207297); -- a_minion_of_Maareq
	
	local tylis = eq.get_entity_list():GetMobByNpcTypeID(207014); -- Tylis_Newleaf
	if ( tylis and tylis.valid ) then
		tylis:SetBodyType(1, false);	-- make targetable
	end
end
