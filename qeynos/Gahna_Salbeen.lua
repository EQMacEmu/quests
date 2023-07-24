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

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		e.self:MerchantCloseShop();
	elseif(e.signal == 2) then
		eq.start(57);
		e.self:MerchantOpenShop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. This is a grand city. I plan to make much profit here.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Qeynos is the place where I will make a fortune. In order to do that, I must hoard all my coins and not donate to ancient religions.");			
	end
end
