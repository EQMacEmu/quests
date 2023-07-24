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
		e.self:Say("Hello. I am afraid I cannot tell you much about my merchandise. I was hired by Ton to look after the shop at night. I can tell you that you would find a better deal during the daytime hours. Ton instructs me to charge more for nighttime service.");		
	end
end
