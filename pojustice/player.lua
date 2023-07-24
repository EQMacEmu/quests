local SEVENTH_HAMMER_TYPE = 201074;

function event_enter_zone(e)
	if ( (e.self:GetY() < -900 and e.self:GetX() > -300) or (e.self:GetY() < -600 and e.self:GetX() > 700) ) then
		-- move player out of trial areas if they log in from camping there
		e.self:MovePC(201, 473, 685, 10, 0); -- pojustice, blue portal tribunal room
	end
end

function event_timer(e)
	if ( e.timer == "seventh" ) then
		eq.stop_timer("seventh");
	
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(SEVENTH_HAMMER_TYPE) ) then
			if ( eq.get_entity_list():GetNPCByNPCTypeID(SEVENTH_HAMMER_TYPE):IsEngaged() ) then
				return;
			end
		end
		e.self:MovePC(201, 76, 1310, 10, 256); -- pojustice, seventh hammer room
	end
end

function event_click_door(e)
	local id = e.door:GetDoorID();

	if ( id >= 1 and id <= 6 and e.self:GetItemIDAt(0) == 31599 ) then		-- The Mark of Justice
		eq.set_timer("seventh", 1); -- need timer because script executes before normal door teleport
	end
end
