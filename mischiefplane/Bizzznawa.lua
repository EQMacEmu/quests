function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	if(e.timer == "follow") then
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(126235);
		
		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob,0);
			eq.stop_timer("follow");
		end
	end
end
