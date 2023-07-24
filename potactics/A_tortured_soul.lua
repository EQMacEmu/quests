local SPAWN_LOCS = {
	{ 683, 941, -217 },
	{ 1326, 1928, -326 },
	{ 1205, 1973, -337 },
	{ -872, 1979, 215 },
	{ 732, -549, -9 },
	{ 1393, 195, -218 },
	{ -456, -1652, 162 },
	{ 586, -360, -17 },
	{ 795, 657, -302 },
	{ -180, -460, 78 },
	{ 280, 99, 7 },
	{ 679, 569, -9 },
	{ -513, 1716, 167 },
	{ -199, -404, 68 },
	{ -148, -370, 68 },
	{ 1245, 442, 122 },
	{ -180, -477, 78 },
	{ -150, 784, 79 },
	{ -248, 1139, 108 },
	{ 449, 119, -16 },
	{ 320, -180, 170 },
	{ 280, 260, 3 },
	{ 1196, -351, 122 },
	{ 1101, 868, -9 },
	{ 511, 220, -13 },
	{ -150, 359, 69 },
	{ 1218, 352, 122 },
	{ -282, 658, 122 },
	{ -484, -1643, 162 },
	{ -514, 1789, 197 },
	{ -231, 961, 78 },
	{ -434, -1621, 162 },
	{ -265, -644, 122 },
	{ -500, -1597, 164 },
	{ -798, -2107, 196 },
	{ -560, -1530, 162 },
	{ 700, -695, -9 },
	{ 680, 487, -16 },
	{ 700, -754, -9 },
	{ 654, -549, -11 },
	{ -298, 1190, 108 },
	{ -835, -2102, 196 },
	{ 1080, -294, 125 },
	{ -145, 550, 78 },
	{ 500, 10, 170 },
	{ 1260, -465, 125 },
	{ 1497, -845, -296 },
	{ -108, -599, 78 },
	{ 1212, 1393, -328 },
	{ 1666, 1095, -319 },
	{ 1124, -393, -294 },
	{ 1530, 2018, -328 },
	{ 1205, 1941, -337 },
	{ 1232, 1245, -325 },
	{ 1205, 2004, -337 },
	{ -459, -1582, 162 },
	{ -261, -1435, 114 },
	{ 1260, -430, 120 },
};

function event_spawn(e)
	if ( e.self:GetSpawnPointID() == 0 ) then -- not from a spawngroup; spawned from a pit corpse via script
		eq.set_timer("depop", 300000);
	else
		-- spawngroup ones are moved at spawn time so the spawn loc is effectively randomized
		local loc = SPAWN_LOCS[math.random(1, #SPAWN_LOCS)];
		e.self:GMMove(loc[1], loc[2], loc[3], 0, true, true);
		eq.set_timer("depop", 600000);
		eq.set_timer("check", 50000);
		e.self:MoveTo(math.random(440, 935), math.random(-380, 405), -291, -1, true);
	end
end

function event_timer(e)

	if ( e.timer == "check" ) then
		if ( e.self:GetZ() < -270 and e.self:GetX() > 440 and e.self:GetY() < 410 ) then
			e.self:AssignWaypoints(29);
			eq.stop_timer(e.timer);
		end
		
	elseif ( e.timer == "depop" and not e.self:Charmed() and not e.self:IsEngaged() ) then
		eq.depop_with_timer();
	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end
