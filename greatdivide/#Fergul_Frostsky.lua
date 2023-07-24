function event_waypoint_arrive(e)
	-- if reached the end of his path(waypoint 6 from gridid 55), send signal to shardwurm to depop with timer and Gralk to depop.
	if(e.wp == 6) then
		eq.depop(118012); -- #Gralk_Dwarfkiller
		eq.depop_with_timer(118040); -- shardwurm_broodmother
	end
end

function event_death_complete(e)
	-- upon death, send signal to shardwurm to depop with timer and Gralk to depop.
	eq.depop(118012); -- #Gralk_Dwarfkiller
	eq.depop_with_timer(118040); -- shardwurm_broodmother
end
