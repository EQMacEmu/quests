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
		eq.start(58);
		e.self:MerchantOpenShop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Go to the taverns if you're looking for talk.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("There shall be no donation from me. I have to look after myself first!");					
	end
end
