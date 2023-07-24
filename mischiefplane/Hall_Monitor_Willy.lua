function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut!");
		eq.attack(e.other:GetName());
	end
end
