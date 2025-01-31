function event_spawn(e)
	eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has spawned");
end

function event_combat(e)
	eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has engaged");
end

function event_death_complete(e)
	eq.discord_send("TLP Spawn Notices", "".. e.self:GetCleanName() .." has been defeated");
end
