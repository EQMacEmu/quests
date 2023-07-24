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

		-- this will need to be removed if the 85/15 thing gets implemented
		if ( not qglobals.sol_room or qglobals.sol_room ~= "11111" ) then			
			return;
		end
		
		if ( e.message:findi("hail") and flags < FLAG_LIMIT and (not qglobals.pofire or qglobals.pofire ~= "2") ) then 
		
			if ( qglobals.pofire and qglobals.pofire == "1" and qglobals.zeks and qglobals.zeks == "7" ) then
			
					e.other:Message(0, "Miak the Searedsoul's thoughts enter into your own.  'That is it!  The portal into the Plane of Fire lies within the Lava Well of Ro.  You must now fall into this well to gain access into that plane.  I will make adjustments to the Plane of Tranquility portal so that you can access that Element from here as well.'");
					eq.set_global("pofire", "2", 5, "F");
					e.other:Message(15, "You have received a character flag!");
					flags = flags + 1;
					
					if ( qglobals.cl_solusek ) then
						eq.delete_global("cl_solusek");
					end
					
			elseif ( not qglobals.cl_solusek  ) then
				e.other:Message(0, "The Planar Projection flickers in and out of existence.  It seems to be impressed by the defeat of Solusek Ro.");
				eq.set_global("cl_solusek", "1", 5, "F");
				e.other:Message(15, "You have received a new checklist flag!");
				flags = flags + 1;
			end
		end
	end
end
