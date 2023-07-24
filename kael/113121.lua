function event_spawn(e)
	eq.set_timer("kael",1000);
end

function event_timer(e)
	local qglobals = eq.get_qglobals();

	if(e.timer == "kael") then
	
		if ( qglobals["Idol"] and qglobals["Idol"] == "1" ) then
			eq.unique_spawn(113341,0,0,1289,1300,-90,259); -- NPC: #The_Idol_of_Rallos_Zek
		end
		
		if ( qglobals["Avatar"] and qglobals["Avatar"] == "1" ) then
			eq.unique_spawn(113244,0,0,1292,1058,-95,259); -- NPC: The_Avatar_of_War
		end
		
		eq.stop_timer("kael");
	end
	
end
