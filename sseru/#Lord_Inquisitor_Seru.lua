local SpawnX = 0;
local SpawnY = 0;
local SpawnZ = 0;
local SpawnH = 0;

function event_spawn(e)
	SpawnX = e.self:GetX();
	SpawnY = e.self:GetY();
	SpawnZ = e.self:GetZ();
	SpawnH = e.self:GetHeading();
	
	e.self:SetSkill(11, 250);		-- block
end

function event_combat(e)
	if(e.joined) then
		eq.set_timer("goback",1000); --a 1 second leash timer.
	else
		eq.stop_timer("goback");
		e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
	end
end

function event_timer(e)
	if(e.timer == "goback") then
		if(e.self:GetX() < -364 or e.self:GetX() > -100 or e.self:GetY() < -564 or e.self:GetY() > -300) then
			e.self:Shout("No! I must not leave the time chamber! If I do, I'll age and die!");
			e.self:GMMove(SpawnX,SpawnY,SpawnZ,SpawnH);
			e.self:BuffFadeAll();
			e.self:WipeHateList();
			e.self:Heal();
		end
	end
end
