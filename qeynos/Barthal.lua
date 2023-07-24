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
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "! We've got the best prices in town..  No need to shop around..  Heh, heh. I think I'll make that my new slogan!");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Please do not request donations or handouts. I have no extra money. If I did I would rent a shop.");							
	end
end

function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		e.self:MerchantCloseShop();
	elseif(e.signal == 2) then
		eq.start(61);
		e.self:MerchantOpenShop();
	elseif(e.signal == 3) then
		e.self:Say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	end
end
