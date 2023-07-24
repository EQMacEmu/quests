function event_spawn(e)
	eq.set_proximity(-61, -20, -797, -761, -15, 0);
end

function event_enter(e)
	if ( e.other:GetGM() ) then
		return
	end

	eq.set_timer("cast", 2000);
end

function event_leave(e)
	eq.stop_timer("cast");
end

function event_timer(e)

	if ( e.timer == "cast" ) then
		
		local clientList = eq.get_entity_list():GetClientList();
		local clients;

		if ( clientList ) then
			for client in clientList.entries do
			
				if ( not client:GetGM() and client:GetZ() > -15 and client:GetZ() < 0
					and client:GetY() > -797 and client:GetY() < -761
					and client:GetX() > -61 and client:GetX() < -20
				) then					
					clients = true;
					e.self:CastSpell(2858, client:GetID(), 0, 1); -- Acrylia KB
				end
			end
		end

		if ( not clients) then
			eq.stop_timer("cast");
		end
	end
end
