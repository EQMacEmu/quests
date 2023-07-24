function event_say(e)
	if(e.message:findi("hail")) then
		e.self:CastSpell(907,e.other:GetID()); -- Spell: DryBoneFireBurst
		e.self:Say("QUIET!!! People are trying to study around here! Keep your yap shut!");
	end
end
