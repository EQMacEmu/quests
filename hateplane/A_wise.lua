function event_spawn(event)
	local xloc = event.self:GetX();
	local yloc = event.self:GetY();
	local zloc = event.self:GetZ();
	eq.set_proximity(xloc - 25, xloc + 25, yloc - 25, yloc + 25, zloc - 25, zloc + 25);
end

function event_enter(event)
	event.self:Emote("man would not find himself invading the realm of Innoruuk.");
	eq.depop_with_timer();
end
