function event_death_complete(e)
	eq.csr_notice(string.format("TempleVeeshan Lepethida slain by %s's group <%s>", e.killer:GetName(), e.killer:CastToClient():GetGuildName()));
end
