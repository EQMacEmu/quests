local MOB_TYPES = {
	204475, -- an_abhorrent_hatchling
	204469, -- a_rapacious_hatchling
	204474, -- a_voracious_hatchling
};

function event_combat(e)
	if ( e.joined ) then
		local r = math.random(2, 4);
		for i = 1, r do
			eq.spawn2(MOB_TYPES[math.random(1,3)], 0, 0, e.self:GetX() + math.random(-10, 10), e.self:GetY() + math.random(-10, 10), e.self:GetZ() + 3, 0);
		end
		eq.depop_with_timer();
	end
end
