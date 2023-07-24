function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut!");
		e.other:Damage(e.self,20000,982,52);
	end
end
