function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	eq.set_proximity(xloc - 55, xloc + 55, yloc - 55, yloc + 55);
end
 
function event_enter(e)
	e.self:Emote("phases in!");
	eq.spawn2(123022,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.depop_with_timer();
end