local counting;

function event_spawn(e)
	eq.set_timer("combat",20000);
	counting = 0;
end

function event_timer(e)
	if (e.timer == "combat") then
		counting = counting + 1;
	end
	if(counting == 2) then
		eq.attack_npc_type(105004);
	elseif(counting == 3) then
		eq.unique_spawn(105182,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.unique_spawn(105022,0,0,-13,-658,8,100); -- #an Arisen Disciple
		eq.unique_spawn(105023,0,0,13,-658,8,160); -- #an Arisen Priest
		eq.unique_spawn(105024,0,0,13,-690,8,228); -- #an Arisen Necromancer
		eq.unique_spawn(105025,0,0,-13,-690,8,34); -- #an Arisen Acolyte
		eq.depop(105004);
		eq.depop(105186);
		eq.depop(105183);
		eq.depop(105184);
		eq.depop(105185);
		eq.depop();
	end
end
