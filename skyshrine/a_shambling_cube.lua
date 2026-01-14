function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("emits a low hum.");
	end
end

function find_spawn_point_leftright(self, x, y, z, dx, dy, max_dist, left)
    for d = max_dist, 0, -1 do
        local sx = x;
        local sy = y;
        if left == 0 then
            sx = sx - dy * d;
            sy = sy + dx * d;
        else
            sx = sx + dy * d;
            sy = sy - dx * d;
        end

        if self:CheckLoSToLoc(sx, sy, z) then
            return sx, sy
        end
    end

    return x, y
end

function event_death_complete(e)
        local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ();
        local heading = e.self:GetHeading() * (2.0 * math.pi / 256.0);
        local dx = math.sin(heading);
        local dy = math.cos(heading);
        local x1, y1 = find_spawn_point_leftright(e.self, x, y, z, dx, dy, 5, 0);
        local x2, y2 = find_spawn_point_leftright(e.self, x, y, z, dx, dy, 5, 1);

        if(e.self:GetLevel() < 43) then
                eq.spawn2(114001,0,0,x1,y1,z,e.self:GetHeading());
                eq.spawn2(114001,0,0,x2,y2,z,e.self:GetHeading());
        else
                eq.spawn2(114000,0,0,x1,y1,z,e.self:GetHeading());
                eq.spawn2(114000,0,0,x2,y2,z,e.self:GetHeading());
        end
end
