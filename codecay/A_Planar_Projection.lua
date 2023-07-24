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

		if ( e.message:findi("hail") and flags < FLAG_LIMIT ) then 
		
			if ( not qglobals.bertox_key ) then
				return;
			end
			
			local fuirstel = tonumber(qglobals.fuirstel or 0);
			
			if ( fuirstel == 3 ) then
				e.other:Message(0, "Milyk Fuirstel's thoughts enter into your own.  'Bertoxxulous is slain, for this my brother and I are forever in your debt.  Please, when you have the opportunity come visit me in the Plane of Tranquility.  I would like to thank you face to face.'");
				eq.set_global("fuirstel", "4", 5, "F");
				e.other:Message(15, "You have received a character flag!");
				flags = flags + 1;
				
				if ( qglobals.cl_bertox ) then
					eq.delete_global("cl_bertox");
				end
				
			elseif ( not qglobals.cl_bertox and fuirstel < 3 ) then
				e.other:Message(0, "The Planar Projection seems to flicker in and out of existence.  It seems joyous that Bertoxxulous has been slain.");
				e.other:Message(15, "You have received a new checklist flag!");
				eq.set_global("cl_bertox", "1", 5, "F");
				flags = flags + 1;
			end			
		end
	end
end
