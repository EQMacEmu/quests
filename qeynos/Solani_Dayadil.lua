function event_spawn(e)
	eq.set_timer("pick_up", 2000);
	e.self:SetRunning(true);
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
		eq.start(59);	
		e.self:MerchantOpenShop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you are a fellow merchant. I must warn you of the inevitable tax increase. Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
	elseif(e.message:findi("deal")) then
		e.self:Say("Bayle is soon to sign a law which will raise the taxes on all bear hides. This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Did you not hear about the [deal] with Surefall Glade?! I will have little money to EAT, let alone donate to another person's cause!");		
	end
end
