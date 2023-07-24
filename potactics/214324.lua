-- Vallon Zek Planar Projection

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
	
	if ( ClientCanFlag(e.other) ) then

		if ( e.message:findi("hail") and flags < FLAG_LIMIT ) then 
		
			local qglobals = eq.get_qglobals(e.other);
			local zeks = tonumber(qglobals.zeks) or 0;
			
			if ( zeks == 2 or zeks == 4 ) then
				e.other:Message(0, "You realize that the image is a projection of Maelin Starpyre's thoughts.  His thoughts enter into your own.  'The pack of notes you now possess from Vallon, bring them to me.  I would like to more closely study them'");
				if ( zeks == 2 ) then -- no VZ or TZ flag
					eq.set_global("zeks", "3", 5, "F"); -- 3 means just VZ flagged
				elseif ( zeks == 4 ) then -- 4 means has TZ flag; does not have VZ flag
					eq.set_global("zeks", "5", 5, "F"); -- 5 means VZ and TZ flagged
				end
				e.other:Message(15, "You have received a character flag!");
				flags = flags + 1;
				
				if ( qglobals.cl_vallon ) then
					eq.delete_global("cl_vallon");
				end
			elseif ( zeks < 2 and not qglobals.cl_vallon ) then
				e.other:Message(0, "The Planar Projection seems to flicker in and out of existence.  It seems to be impressed by the defeat of Vallon Zek.");
				eq.set_global("cl_vallon", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
				flags = flags + 1;
			end
		end
	end
end
