function event_spawn(e)
	eq.set_timer("sing",1040000);
end

function event_timer(e)
	local song;
	
	if (e.timer == "sing") then
	
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(10141)		-- NPC: Trolon_Lightleer;
			and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(10158)		-- NPC: Branis_Noolright
			and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(10165)		-- NPC: Palana_Willin
		) then		
			return;
		end

		song = math.random(1, 7);
		if (song == 1) then
			e.self:Say("Let's hear some music.");
		elseif (song == 2) then
			e.self:Say("Music!! Music!!");
		elseif (song == 3) then
			e.self:Say("Play us some music bard!!");
		elseif (song == 4) then
			e.self:Say("Let's liven this pub up!");
		elseif (song == 5) then
			e.self:Say("Try to cheer this place up, bard.");
		elseif (song == 6) then
			e.self:Say("Where is the music? I don't pay you bards to drink all the grog!!");
		elseif (song == 7) then
			e.self:Say("Sing us a melody.");			
		end
		
		eq.signal(10141,1); -- NPC: Trolon_Lightleer
		eq.signal(10158,1); -- NPC: Branis_Noolright
		eq.signal(10165,1); -- NPC: Palana_Willin
	end
end
