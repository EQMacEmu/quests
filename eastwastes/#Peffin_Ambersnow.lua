function event_spawn(e)
	eq.set_timer("depop",265000);
end

function event_combat(e)
	if(e.joined) then
		e.self:Shout("Take me if you can outlander! Your hunt ends here...I hope you enjoy the taste of Kromrif steel!");
		if(not eq.is_paused_timer("depop")) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_timer(e)	
	e.self:Say("The cowards seem to have fled friends, thank you for your protection.");
	eq.depop_all(116040);
	eq.depop();
end
