function event_say(e)
	if(e.message:findi("hail")) then
		e.self:CastSpell(906,e.other:GetID(),0,5); -- Spell: SkunkSpray
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut!");
	end
end
