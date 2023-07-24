function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("emits a low hum.");
	end
end

function event_death_complete(e)
	eq.spawn2(114001,0,0,e.self:GetX()+5,e.self:GetY(),e.self:GetZ(),0);
	eq.spawn2(114001,0,0,e.self:GetX()-5,e.self:GetY(),e.self:GetZ(),0);
end
