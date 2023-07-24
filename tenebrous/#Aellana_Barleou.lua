function event_spawn(e)
	eq.set_timer("sit",1000);
end

function event_timer(e)
	e.self:SetAppearance(1);
	eq.stop_timer("sit");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The Coterie of the Eternal Night is holding us captive! We can not leave until all the vampyres that reside in this village have been destroyed! If any of them are missing I assure you they will return! My brother Johanius is an experienced vampyre slayer and will coming for us soon!");
	end
end
