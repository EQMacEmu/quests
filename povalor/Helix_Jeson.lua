local clientIDs = {};

function event_say(e)

	if ( e.message:findi("hail") ) then
		
		if ( clientIDs[e.other:GetID()] ) then
			e.self:Say("You heard the Sergeant. Leave before we are forced to escort you out of the compound.");
		else
			e.self:Say("I have no time to talk "..e.other:GetName()..". We are extremely busy at the moment.");
		end
	end
end

-- don't want to make a qglobal for this; signal sent is entity ID of client who hails the Sergeant
function event_signal(e)
	clientIDs[e.signal] = true;
end
