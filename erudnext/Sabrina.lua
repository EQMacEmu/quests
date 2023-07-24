function event_signal(e) 		
	if(e.signal == 1) then 		
 		eq.start(21); 		
 	elseif(e.signal == 2) then 		
 		eq.stop();
 	end
 end

function event_spawn(e)
	eq.spawn_condition("erudnext",1,0);
	eq.spawn_condition("erudnext",2,0);
end