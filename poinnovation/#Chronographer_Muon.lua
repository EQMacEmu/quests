local MAELIN_TYPE = 206209;

function HasItemInvOnly(client, itemid)

	--main inventory and cursor
	for i = 0, 30, 1 do
		local thisitem = client:GetItemIDAt(i);
		if(thisitem == itemid) then
			return true;
		end
	end

	--main/cursor containers
	for i = 250, 339, 1 do
		local thisitem = client:GetItemIDAt(i);
		if(thisitem == itemid) then
			return true;
		end
	end
end

function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	
	if ( qglobals.zebuxoruk == "2" and HasItemInvOnly(e.other, 29165) ) then -- Quintessence of Elements
	
		if ( e.message:findi("hail") ) then
			e.other:Message(0, "Chronographer Muon tells you, 'Acquisition of power completed.  Would you like to be transported to the time-projection chamber?'");
			
		elseif ( e.message:findi("yes") ) then
			e.other:Message(0, "Chronographer Muon tells you, 'Compliance.'");
			e.other:MovePC(206, 291, -860, -1850, 64*2);
			eq.unique_spawn(MAELIN_TYPE, 0, 0, 763, -837, -1887.122, 184);
		end
	else
	
		if ( e.message:findi("hail") ) then
			e.other:Message(0, "Chronographer Muon tells you, 'Greeting acknowledged.  I have no use for you at this time.  Good bye.'");
		end
	end
end
