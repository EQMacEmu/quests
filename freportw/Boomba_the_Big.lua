function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Say("Me finds sumting.  Goody!");
		end
	end	
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hullo!  Me is Boomba.  Me make da bestest pickles in da Norrath.  Me gots da dwarfies, da halflings, da humies - me even gots da pixie pickles!  Of course, all of dem were baddies from da dunjuns.  Da guards say it gud ta pickle da baddies.");
	end
end