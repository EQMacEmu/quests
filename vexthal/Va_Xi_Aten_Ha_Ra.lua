-- This will punish raids that pull the boss under the floor

local Z_LEVEL = 100; -- if boss is below this Z, cazic touch players

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("cheat_check", 120000);
	else
		eq.stop_timer("cheat_check");
		eq.stop_timer("kill_player");
	end
end

function event_timer(e)
	if ( e.timer == "cheat_check" ) then
	
		if ( e.self:GetZ() < Z_LEVEL ) then
			eq.stop_timer(e.timer);
			eq.set_timer("kill_player", 500);
			e.self:CastSpell(1948, e.self:GetID(), 0, 1); -- Destroy
		end
		
	elseif ( e.timer == "kill_player" ) then
	
		local hl = e.self:GetHateList();
		for ent in hl.entries do
			if ( ent.ent:IsClient() ) then
				eq.signal(158480, ent.ent:GetID()); -- Stop_Cheating; tell it to Cazic Touch
				return;
			end
		end		
	end
end
