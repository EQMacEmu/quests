function event_spawn(e)
	eq.set_timer("loot",1000);
end

function event_timer(e)
	eq.stop_timer("loot");
	if(math.random(100) < 6) then
		setdrop = math.random(100);
		if(setdrop < 15) then
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
		elseif(setdrop < 60) then
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
		else
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
			e.self:AddItem(1829,1);
		end
	end
end