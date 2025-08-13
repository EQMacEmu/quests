function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	elseif(e.message:findi("challenge eejag")) then
		eq.unique_spawn(27119,0,0,298,1037,-60,0); -- NPC: Eejag
		eq.depop_with_timer();
	end
end
