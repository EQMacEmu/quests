function event_combat(e)
	e.self:Emote("and metallic drops from the mist!");
	eq.spawn2(eq.ChooseRandom(207302, 207301), 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0); -- A_parylyx_painweaver, A_parylyx_limb_binder
	eq.depop_with_timer();
end
