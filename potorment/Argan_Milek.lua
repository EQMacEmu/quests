function event_spawn(e)
	eq.set_timer("depop", 1800000);
end

function event_timer(e)
	eq.depop();
end

function event_say(e)
	
	if ( e.message:findi("hail") ) then
		e.self:Say("Friends, you have returned my vision!  I wish that I could find the means to thank you enough!  Friends, should Druzzil Ro choose to have us meet again on this chaotic canvas of time, I will make this up to you!  I am afraid that I must leave at this time.  I feel my body waking and I am quite ready to forget the image of this place.  I have some information that may help you, and when you are ready, I will return your sight to you.");
		
	elseif ( e.message:findi("information") ) then
		e.self:Say("While I was blind, Druzzil Ro came to me in a vision.  In this vision, she walked me to the door of Saryrn's Citadel.  When I set my gaze upon the door, I began to make out some sort of picture.  The inscription on the door seemed to shift and change, as if it were fluid.  At one point, I was able to make out several distinct shapes.  These shapes depicted one of those things with the four mouths spitting out four other similar creatures.  I think that the things with four mouths are the key to the door.  It was then that I asked Druzzil Ro about Saryrn.");
		
	elseif ( e.message:findi("saryrn") ) then
		e.self:Say("Druzzil Ro told me that Saryrn formed this place from her own tortured will.  Saryrn was insane as a mortal and found some means of transforming that insanity into something more.  Many of the entities that you will find in this place are voices that came to her during the inception of her madness.  They will be the key to dissolving her power.  Seek out the Avatars of this realm to move into her tower.  Now, I must leave.  Are you ready to return?");
		
	elseif ( e.message:findi("ready") ) then
		local client = e.other;
		client:MovePC(207, -257, 1711, -481, 0);
		if ( client:GetPet().valid and not client:GetPet():Charmed() ) then
			client:GetPet():GMMove(207, -257, 1711, -481, 0);
		end
	end
end