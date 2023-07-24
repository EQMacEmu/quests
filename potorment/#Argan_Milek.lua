function event_spawn(e)

	if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(207047) ) then -- A_Horrifying_Vision
		eq.depop_with_timer();
	end
end

function event_say(e)
	
	if ( e.message:findi("hail") ) then
		e.self:Emote("weakly extends his arms in an effort to ascertain your location, then clutches his eyes and screams, ''Who are you!  Back away... leave me alone!  Is my current suffering not enough?'");
		
	elseif ( e.message:findi("suffering") ) then
		e.self:Say("Who are you?  Are you here to aid me?");
		
	elseif ( e.message:findi("here to aid you") ) then
		e.self:Emote("sobs, 'I am so relieved to hear those words!  Please help me to escape this place.  She has taken my sight and replaced it with loathsome visions of some distant prison.  The Foul Mistress mocks the only thing I once felt a kinship to, my art.  I cannot scrub these visions from my eyes.  I fear that I will never be able to paint again.  Can you save what is left of my memories?  I can you restore my sight?'");
		
	elseif ( e.message:findi("save") and e.message:findi("memories") ) then
		e.self:CastSpell(1135, e.other:GetID()); -- Visions of Argan
	end
end