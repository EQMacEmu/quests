function event_combat(e)
	if (e.joined == true) then
		e.self:Emote("lunges at you from the shadows!");
		eq.spawn2(eq.ChooseRandom(112098,112076,112098,112077), 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- a_large_crystal_shard (112045) a_crystalline_shard (112047) a_crystal_shard (112046)
		eq.depop_with_timer();
	end
end
