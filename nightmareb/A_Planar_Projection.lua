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

		if ( e.message:findi("hail") ) then 
		
			if ( qglobals.thelin ) then
				if ( qglobals.thelin == "2" and flags < FLAG_LIMIT ) then
					e.other:Message(0, "You recognize the voice in your mind to be Thelin Poxbourne's.  The words echo, 'The cruel hand of Terris no longer shall torment my dreams.  Thank you friends, you are my savior.  Please return to me in the Plane of Tranquility.  I would like to express to you my gratitude.'");
					eq.set_global("thelin", "3", 5, "F");
					e.other:Message(15, "You have received a character flag!");
					flags = flags + 1;
					
					if ( qglobals.cl_terris ) then
						eq.delete_global("cl_terris");
					end
				end
			elseif ( not qglobals.thelin or qglobals.thelin == "1" ) then
				if ( not qglobals.cl_terris and flags <= FLAG_LIMIT ) then
					-- no text for this checklist flag; probably because it wasn't possible to enter the zone without the maze flag when the first made it
					eq.set_global("cl_terris", "1", 5, "F");
					e.other:Message(15, "You have received a new checklist flag!");
					flags = flags + 1;
				end
			end
		end
	end
end
