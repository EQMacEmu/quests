-- Sonsa Fromp //33088// ##Drogerin##

function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("picks up something from the ground.");
		end
	end	
end

function event_say(e)
    if (e.message:findi("hail")) then
		e.self:Say("Hello, traveler. It is so good to meet you. I am Sonsa Fromp, tailor surpreme. I have been known to make the finest leather armor this side of the wall. Feel free to inspect my merchandise. Buy plenty. This is how I put food on the table.");
	elseif(e.message:findi("kevlin")) then
		e.self:Say("Oooh! Do not speak that name in this burrow! He used to be my husband. Now he has left me for that trollop, Lashinda Hoggletop!"); 
	elseif(e.message:findi("lashinda")) then
		e.self:Say("Never mention that name in this burrow!"); 
	end
end
