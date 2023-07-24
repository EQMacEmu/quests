local reaction = 0;

function event_signal(e)
	if(e.signal == 1) then
		eq.follow(eq.get_entity_list():GetMobByNpcTypeID(181164):GetID(),15);
	elseif(e.signal == 2) then
		eq.stop_follow();
		eq.set_timer("react",3000);
	end
end

function event_timer(e)
	if(e.timer == "react") then
		reaction = reaction + 1;
		if(reaction == 1) then
			e.self:DoAnim(12);
		elseif(reaction == 2) then
			e.self:DoAnim(12);
		elseif(reaction == 3) then
			e.self:DoAnim(12);
		elseif(reaction == 4) then
			e.self:DoAnim(12);
			eq.stop_timer("react");
			eq.unique_spawn(181015,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
			eq.depop_with_timer();
		end
	end
end
