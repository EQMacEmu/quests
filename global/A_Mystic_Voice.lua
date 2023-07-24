function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
	end
	if(e.signal == 2) then
		e.self:Say("As a reminder, the portal will become active in three minutes.");
	end
	if(e.signal == 3) then
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
	end
	if(e.signal == 4) then
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
	end
	if(e.signal == 5) then
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
	end
end