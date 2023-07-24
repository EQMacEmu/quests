function event_signal(e)

	if (e.signal == 1) then
	
		local kyenka = eq.get_entity_list():GetMobByNpcTypeID(113133);
		
		eq.follow(kyenka:GetID());
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("silenty watches you.");
	end
end
