local FLAG_LIMIT = 72;

local flags = 0;
local rid, gid, cid;

function ClientCanFlag(mob)
	if ( mob:IsClient() ) then
		local client = mob:CastToClient();
		
		local raid = client:GetRaid();
		local group = client:GetGroup();
		
		if ( rid and raid.valid and raid:GetID() == rid ) then
			return true;
		elseif ( gid and group.valid and group:GetID() == gid ) then
			return true;
		elseif ( cid and client:GetID() == cid ) then
			return true;
		end
	end
	return false;
end

function event_signal(e)
	rid, gid, cid = nil, nil, nil;
	local client = eq.get_entity_list():GetClientByID(e.signal);	-- the signal # is the entity ID of a client with kill credit
	
	if ( client.valid ) then
	
		local raid = client:GetRaid();
		local group = client:GetGroup();
		
		if ( raid.valid ) then
			rid = raid:GetID();
		elseif ( group.valid ) then
			gid = group:GetID();
		else
			cid = client:GetID();
		end
		eq.debug("Flagger NPC will acknowledge "..client:GetName().."'s raid/group; Raid ID == "..(rid or "(nil)")..";  Group ID == "..(gid or "(nil)"), 1);
	end
end

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
	
	if ( ClientCanFlag(e.other) ) then

		if ( e.message:findi("hail") and flags < FLAG_LIMIT and not qglobals.saryrn and not qglobals.cipher ) then 
		
			if ( qglobals.tylis and qglobals.tylis == "2" ) then
			
					e.other:Message(0, "The Planar Projection's thoughts enter your own.  'You have done well, now receive the knowledge that Saryrn once held!'  You look down at your arms to see a set of unintelligible runes being burnt into your arms.  The pain is terrible and searing.  Suddenly the sensation is gone and the runes slowly fade.");
					eq.set_global("saryrn", "1", 5, "F");
					e.other:Message(15, "You have received a character flag!");
					flags = flags + 1;
					
					if ( qglobals.cl_saryrn ) then
						eq.delete_global("cl_saryrn");
					end
					
			elseif ( not qglobals.cl_saryrn  ) then
				e.other:Message(0, "The Planar Projection seems to flicker in and out of existence.  It seems to be impressed and grateful for the death of Saryrn.");
				eq.set_global("cl_saryrn", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
				flags = flags + 1;
			end
		end
	end
end
