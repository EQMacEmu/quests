function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
		eq.move_to(-639,-85,-24,16,true);
	elseif(e.signal == 2) then
		eq.start(35);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Join us in celebrating my promotion to the rank of Dragoon!  I shall still respect all of you scum.");
		e.self:DoAnim(67); --salute
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 6) then
		eq.get_entity_list():GetDoorsByDoorID(1):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(2):ForceOpen(e.self);
		eq.get_entity_list():GetDoorsByDoorID(49):ForceOpen(e.self);
	end
end