function event_say(e)
	if(e.message:findi("hail")) then
		eq.attack(e.other:GetName());
	end
end

function event_death_complete(e)
	eq.unique_spawn(59129,0,0,-165,90,-221,56); -- spawn Black Dire
end