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
		eq.start(60);
		e.self:MerchantOpenShop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!! Moran here. I just love this city. I traveled from Freeport to Qeynos to stay far from the [Freeport Militia].");
	elseif(e.message:findi("freeport militia")) then
		e.self:Say("The Freeport Militia are nothing more than thugs. I have seen them lay waste to more than a dozen adventurers at once. For no reason other than to flex their muscles!");
	elseif(e.message:findi("kane"))then
		e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");		
	elseif(e.message:findi("circle.* unseen hand"))then
		e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");	
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("I am sorry. I have no extra currency to donate.");				
	end
end
