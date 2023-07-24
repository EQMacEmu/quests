function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("picks up a discarded item from the ground and says, 'Don't people have enough respect for our grand city to not throw things onto the streets?!");
		end
	end	
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my humble establishment!  I specialize in cloth, but lately I have begun to dabble in silk, the finest material I have ever used.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Hold on! Once I hear the word 'donate,' that is where the conversation ends.");									
	end
end
