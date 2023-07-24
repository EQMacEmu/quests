function event_spawn(e)
	eq.zone_emote(7, "You hear squealing voices of Centi echo through the dark hallways.  Something must have them frightened.  You find yourself wondering what could possibly scare the servants of the Akheva.  Do you really want to know?");
	eq.set_timer("depop",2940000);
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop_with_timer();
	end
end

function event_combat(e)
	if(e.joined) then
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_slay(e)
	-- A_mind_worm
	eq.spawn2(179003,0,0,e.self:GetX() - 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179003,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179003,0,0,e.self:GetX(),e.self:GetY() - 5,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179003,0,0,e.self:GetX(),e.self:GetY() + 5,e.self:GetZ(),e.self:GetHeading());
	eq.spawn2(179003,0,0,e.self:GetX(),e.self:GetY() + 10,e.self:GetZ(),e.self:GetHeading());
end
