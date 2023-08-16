function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How dare you speak to me, you impudent sack of nauseating refuse! For this outrage of insubordination I call forth the vengeance of House Mistmoore! You now have little time left to live.  Enjoy it.");
		eq.attack(e.other:GetName());
	end
end

function event_death_complete(e)
	eq.unique_spawn(59129,0,0,-165,90,-221,56); -- spawn Black Dire
end