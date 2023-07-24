-- beginning of the arch lich rhag`zadune cycle

function event_death_complete(e)
	eq.set_global("Rhag","1",7,"F");
	eq.unique_spawn(162192, 0, 0, 644, -280, 152, 196); -- rhag`mozdezh
	eq.unique_spawn(162194, 0, 0, 660, -310, 149.5, 218); -- Rhag`Hilath
	eq.unique_spawn(162196, 0, 0, 561, -324, 142, 0); -- Rhag`Rithal
	eq.unique_spawn(162193, 0, 0, 561, -236, 142, 130); -- Rhag`Vithil
	eq.unique_spawn(162195, 0, 0, 660, -247, 149.5, 165); -- Rhag`Zerath
end
