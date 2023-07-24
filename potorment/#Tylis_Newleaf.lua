local FLAG_LIMIT = 72;

function event_spawn(e)
	flags = 0;
	eq.set_timer("depop", 600000);
end

function event_timer(e)
	if ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if ( e.message:findi("hail") ) then 
	
		if ( qglobals.tylis ) then
		
			e.other:Message(0, "Tylis Newleaf tells you, 'I must thank you for your kind efforts friends.  This place has laid claim to me for far too long.  Please take care and offer the dark wench my best.  I am off... and I suggest you not stray to far from that route yourselves.  Please tell me when you are ready to return and may your blades strike true!'");
			
			if ( qglobals.tylis == "1" and flags <= FLAG_LIMIT ) then
				eq.set_global("tylis", "2", 5, "F");
				e.other:Message(15, "You have received a character flag!");
				flags = flags + 1;
			end
			
			if ( qglobals.cl_keeper ) then
				eq.delete_global("cl_keeper");
			end
				
		elseif ( not qglobals.cl_keeper ) then
		
			if ( flags <= FLAG_LIMIT ) then
				e.other:Message(0, "Tylis Newleaf tells you, 'I don't recognize you, stranger. Thank you so much for your kind efforts.  This place has claimed me for far too long.  I will leave now that I have been freed of my torment. However, before I go, please tell me when you're [ready to return] and I will send you out first.'");
				eq.set_global("cl_keeper", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
				flags = flags + 1;
			end
		end
		
	elseif ( e.message:findi("ready to return") ) then
		e.self:CastSpell(1136, e.other:GetID()); -- Torment's Beckon
	end
end
