-- a_storm_cloud (this is the trap; capital letter one is a portal add in Agnarr room)

local casting = {};

function event_spawn(e)
	eq.set_timer("depop", 5000);
end

function event_timer(e)
	casting[e.self:GetID()] = nil;
	eq.depop();
end

function event_signal(e)
	if ( casting[e.self:GetID()] ) then
		return;
	end
	e.self:CastSpell(e.signal, e.self:GetID());
	casting[e.self:GetID()] = true;
end
