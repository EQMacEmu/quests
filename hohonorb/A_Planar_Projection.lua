local FLAG_LIMIT = 72 * 2;

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
	
	if ( e.message:findi("hail") and ClientCanFlag(e.other) and flags <= FLAG_LIMIT ) then

		if ( not qglobals.mmarr and not qglobals.cipher ) then
		
			if ( qglobals.hohtrials and qglobals.hohtrials == "111" ) then
				e.other:Message(0, "The Planar Projection's thoughts enter your own.  'You have done well, now receive the knowledge that Mithaniel Marr once held!'  You look down at your arms to see a set of unintelligible runes being burnt into your arms.  The pain is terrible and searing.  Suddenly the sensation is gone and the runes slowly fade.  Also among your possessions you find a small tattered book as old as the ages.  You recognize it as something that Maelin might be able to translate.");
				eq.set_global("mmarr", "1", 5, "F");
				e.other:Message(15, "You have received a character flag!");
				flags = flags + 1;
				
				if ( qglobals.cl_mmarr ) then
					eq.delete_global("cl_mmarr");
				end
			else
				e.other:Message(0, "The Planar Projection's thoughts enter your own.  'You have done well, however you are not ready to understand the Knowledge gained for defeating Mithaniel Marr.  Once you have learned more this knowledge will be revealed to you.'");
				eq.set_global("cl_mmarr", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
				flags = flags + 1;
			end
		end
		
		if ( not qglobals.zebuxoruk and not qglobals.mmarr_book ) then
		
			if ( qglobals.hohtrials and qglobals.hohtrials == "111" ) then
				eq.set_global("mmarr_book", "1", 5, "F");
				flags = flags + 1;
				
				if ( qglobals.cl_mmarr_book ) then
					eq.delete_global("cl_mmarr_book");
				end
			else
				eq.set_global("cl_mmarr_book", "1", 5, "F");
				flags = flags + 1;
			end		
		end		
	end
end
