-- this will make them randomly move a very short distance from spawn point and 'burrow' (i.e. disappear) occasionally
-- making them go under the world doesn't work so we move them outside the map.  looks weird on showeq but otherwise works

local x, y, z;
local spawnLocs = {};

function event_spawn(e)
	eq.set_timer("move", 24000 + math.random(1000, 5000));
	spawnLocs[e.self:GetID()] = { x = e.self:GetX(), y = e.self:GetY(), z = e.self:GetZ() }
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("move");
		eq.pause_timer("burrow");
	else
		eq.resume_timer("move");
		eq.resume_timer("burrow");
	end
end

function event_death(e)
	spawnLocs[e.self:GetID()] = nil;
end

function event_timer(e)
	if ( e.self:Charmed() ) then
		return;
	end
	
	local l = spawnLocs[e.self:GetID()];
	
	if ( e.timer == "move" ) then
		if ( l.b == 1 ) then
			e.self:MoveTo(l.bx + math.random(-1, 1), l.by + math.random(-1, 1), e.self:GetZ(), -1, false); -- move in place briefly so as to appear to 'burrow'
		elseif ( math.random(1, 5) == 1 ) then
			eq.stop_timer(e.timer);
			eq.set_timer("move", 150);
			eq.set_timer("burrow", 7000);
			l.bx = e.self:GetX();
			l.by = e.self:GetY();
			e.self:MoveTo(l.bx + math.random(-1, 1), l.by + math.random(-1, 1), e.self:GetZ(), -1, false); -- move in place briefly so as to appear to 'burrow'
			l.b = 1;
		else
			e.self:MoveTo(l.x + math.random(-20, 20), l.y + math.random(-20, 20), l.z, -1, true);
		end
		
	elseif ( e.timer == "burrow" ) then
		if ( l.b == 1 ) then
			eq.stop_timer(e.timer);
			eq.stop_timer("move");
			eq.set_timer("burrow", 40000);
			e.self:GMMove(3000, 3000, 0, 0, true, true); -- park mob outside map
			l.b = 2;
		elseif ( l.b == 2 ) then
			eq.stop_timer(e.timer);
			e.self:GMMove(l.x, l.y, l.z, math.random(0, 255), true, true); -- return to spawn
			eq.set_timer("move", 24000 + math.random(1000, 5000));
			l.b = nil;
		end
	end
end
