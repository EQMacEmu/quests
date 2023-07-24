function event_spawn(e)
	eq.set_timer("nosell",1000);
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if(e.timer == "nosell") then
		eq.stop_timer("nosell");
		e.self:MerchantCloseShop();
	elseif( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("picks an item up from the ground and says, 'Hey! Look what I found! Another piece of rubbish for my trailer... Must be my lucky day.");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, my fellow traveler. I am Gornolin Zot, traveling merchant of fine wares. Please. Take a look at what I have to offer.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 6) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 7) then
		e.self:SetRunning(false);
	end
end
