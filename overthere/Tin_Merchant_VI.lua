function event_spawn(e)
	eq.set_timer("pick_up", 2000);
end

function event_timer(e)
	if ( e.timer == "pick_up" ) then		
		while ( e.self:CheckGround() ) do
			e.self:Emote("opens its chestplate and a large hose emerges.  The hose quickly sucks up an item. 'Klick...  Danak Law 9055, Littering.  Item shall be destroyed.  The violator will report to the guards at once for termination.  Welcome to Danak Shipyards.");
		end
	end	
end