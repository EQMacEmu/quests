function event_spawn(e)
	eq.set_timer("ssra",1000);
end

function event_timer(e)
	local qglobals = eq.get_qglobals();

	if(e.timer == "ssra") then
	
		if ( qglobals["Rhag"] and qglobals["Rhag"] == "1" ) then
			eq.unique_spawn(162192, 0, 0, 644, -280, 152, 196); -- rhag`mozdezh
			eq.unique_spawn(162194, 0, 0, 660, -310, 149.5, 218); -- Rhag`Hilath
			eq.unique_spawn(162196, 0, 0, 561, -324, 142, 0); -- Rhag`Rithal
			eq.unique_spawn(162193, 0, 0, 561, -236, 142, 130); -- Rhag`Vithil
			eq.unique_spawn(162195, 0, 0, 660, -247, 149.5, 165); -- Rhag`Zerath
		end
		
		if ( qglobals["Lich"] and qglobals["Lich"] == "1" ) then
			eq.unique_spawn(162030, 0, 0, 420, -144, 270.1, 0); -- Arch_Lich_Rhag`Zadune
			eq.unique_spawn(162498, 0, 0, 449, -163, 268, 224); -- Rhag`Reshkazh
			eq.unique_spawn(162495, 0, 0, 377, -71, 261, 64); -- Rath`Zihold
			eq.unique_spawn(162496, 0, 0, 465, -71, 261, 192); -- Rath`Giloth
			eq.unique_spawn(162497, 0, 0, 389, -163, 268, 32); -- Rhag`Vezozh
		end
	
	end
	eq.stop_timer("ssra");
	
end
