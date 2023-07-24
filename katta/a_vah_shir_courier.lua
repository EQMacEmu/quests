function event_spawn(e)
	eq.set_timer("run",1000);
end

function event_timer(e)
	if(e.timer == "run") then
		e.self:SetRunning(true);
	end
end

function event_waypoint_arrive(e)
	rosh = eq.get_entity_list():GetMobByNpcTypeID(160126);
	if(e.wp == 4) then
		e.self:SetRunning(false);
	elseif(e.wp == 8) then
		if(rosh.valid) then
			e.self:Say("Sorry for the delay mistress, I ran into a spot of trouble on the way here. I am prepared to deliver your crate to the spiritists back home.");
			rosh:Say("I hope your journey back to Shar Vahl is less eventful. Please make haste, the spiritists must receive this crate as soon as possible.");
			e.self:Emote("tucks the crate of skulls under his arm and nods to Roshawna. Suddenly the courier begins to shake, his fur stands on end, and his eyes glaze over expressionlessly. The courier runs for the gates of Katta Castellum with an otherworldly howl echoing in his wake.");
			e.self:AddItem(17079,1);
			rosh:Say("Stop him! Stop the courier! An evil spirit has possessed him! He must not escape with those skulls! Catch him and bring back that crate of skulls!");
			e.self:SetRunning(true);
		end
	end
end
			
function event_death_complete(e)
	if(e.self:GetWaypointID() > 8 and e.self:GetWaypointID() <= 14) then
		eq.spawn2(160172,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() + 3,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() - 3,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() - 5,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() + 5,e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() + 3,e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() - 3,e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() - 5,e.self:GetZ(),0);
	elseif(e.self:GetWaypointID() > 14) then
		eq.spawn2(160172,0,0,e.self:GetX() + 5,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() + 3,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() - 3,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX() - 5,e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() + 5,e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() + 3,e.self:GetZ(),0);
		eq.spawn2(160172,0,0,e.self:GetX(),e.self:GetY() - 3,e.self:GetZ(),0);
	end
end		
