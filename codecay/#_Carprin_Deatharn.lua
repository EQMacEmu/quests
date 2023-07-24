function event_combat(e)
	if ( e.joined ) then
		local mob1 = eq.unique_spawn(200229, 0, 0, 382, -127, -62, 192); -- #Breddan_Rutyl
		local mob2 = eq.unique_spawn(200230, 0, 0, 364, -108, -62, 192); -- #Fran_Prisoal
		local mob3 = eq.unique_spawn(200222, 0, 0, 384, -94, -62, 192); -- #Abroan_Drian
		eq.set_timer("drophate", 1000);
		if ( math.abs(e.self:GetX() - e.self:GetSpawnPointX()) < 1 and math.abs(e.self:GetY() - e.self:GetSpawnPointY()) < 1 ) then
			eq.get_entity_list():MessageClose(e.self, true, 200, 0, "The dark knight looks at the foolish mortals who have come into his domain and begins to chant a dark spell, 'Doremai Peyunai Rezgra Yru Zainweedi QUANDOZI QUANDOZI QUANDOZI!'  Suddenly, three howls of pain and agony are heard as the foul knight channels energy from the tortured souls surrounding him.  He grins evilly as a shimmering field of dark force surrounds him powered by the stolen energy and says, 'I shall enslave your souls for all eternity and you will learn what it means to defy my lord, Bertoxxulous.'");
			if ( mob1.valid ) then mob1:AddToHateList(e.other, 1); end
			if ( mob2.valid ) then mob2:AddToHateList(e.other, 1); end
			if ( mob3.valid ) then mob3:AddToHateList(e.other, 1); end
		end		
	else
		eq.stop_timer("drophate");
		
		-- this is to mimic certain behavior Sony's servers had/has.  NPCs aggroed a long time sometimes warp home or
		-- some distance away in the direction of home and heal somewhat when they hate list wipe.  The exact logic to this
		-- behavior is unknown.  Bosses with the tank hate list drop mechanic need this in order to not trivialize the
		-- encounter using mem blur.  This is a crude solution that works well enough
		local ratio = e.self:GetHPRatio();
		if ( ratio < 50 or math.random(100) > ratio ) then
			e.self:GMMove(e.self:GetGuardPointX(), e.self:GetGuardPointY(), e.self:GetGuardPointZ(), e.self:GetSpawnPointH());
			e.self:SetHP(e.self:GetHP() + math.floor(e.self:GetMaxHP() * 0.3));
		end
	end
end

function event_timer(e)

	if ( e.timer == "drophate") then
	
		if ( math.random() < 0.01666 ) then -- averages to once per minute
			local target = e.self:GetTarget();
			if ( target and target.valid ) then
				e.self:RemoveFromHateList(target);
			end
			eq.debug(e.self:GetName().." dropped target from hate list ("..target:GetName()..")", 2);
		end
	end
end