local MALEVELER_TYPE = 205157; -- An_Arachnae_Maleveler
local SERIOUN_TYPE = 205158; -- An_Arachnae_Serioun
local SPAWN_LOCS = {
	1763, 259,	-- seriouns
	1789, 226,
	1842, 199,
	1750, 214,
	1721, 247,	-- malevelers
	1746, 187,
	1783, 177,
	1889, 270,
};

function event_death_complete(e)

	local x, y, t;
	local z = 373;
	local r1 = math.random(1, 2);
	local r2 = math.random(7, 8);
	if ( r1 == 2 ) then
		r2 = 8;
	end

	-- there is some random component to spawns; I've seen either 3 or 4 of each spawn at time; 7 or 8 total
	-- exactly how Sony randomizes this is not quite known but this is a trivial concern
	for i = r1, r2 do

		if ( i < 5 ) then
			t = SERIOUN_TYPE;			
		else
			t = MALEVELER_TYPE;
		end
		
		x = SPAWN_LOCS[i*2-1];
		y = SPAWN_LOCS[i*2];
		
		eq.spawn2(t, 0, 0, x, y, z, 0);
	end
end
