function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	
	if ( qglobals.zebuxoruk == "2" and e.other:HasItem(29165) ) then -- Quintessence of Elements
	
		if ( e.message:findi("hail") ) then
			e.self:Emote("fidgets about with excitement, 'So here you are, this is quite impressive.  I cannot wait to see the results of this impressive machine!  I have coordinated with the clockworks here that have not gone mad.  We have set the machine to tear a point of time open that should be equal to that based on the cipher and history that we have [researched].'");
			
		elseif ( e.message:findi("researched") ) then
			e.self:Say("Based on the findings from the information that you brought back to me I have determined the exact time to open.  I believe the machine will work.  Please step up and activate the machine!  Once you have formed a bond with the Plane of Time you will be able to access the Plane again through the Plane of Tranquility.  They have built a portal there, but no one was able to become attuned to that plane, until you that is.  Good luck!");
		end
	end
end

function event_spawn(e)
	eq.set_timer("depop", 900000);
end

function event_timer(e)
	eq.depop();
end
