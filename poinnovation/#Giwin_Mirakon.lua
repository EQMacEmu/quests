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
	--eq.depop_with_timer(206038);	-- preflag Giwin; apparently didn't depop on AK?
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
		
			if ( not qglobals.zeks ) then
				e.other:Message(0, "Giwin Mirakon tells you, 'Hey what are you doing!  Look at this mess that you have caused.  Rallos is not going to be happy about this.'");
				if ( not qglobals.cl_behemoth and flags < FLAG_LIMIT ) then
					eq.set_global("cl_behemoth", "1", 5, "F");
					e.other:Message(15, "You have received a new checklist flag!");
					flags = flags + 1;
				end
				
			else
				e.other:Message(0, "Giwin Mirakon gives you a look of disbelief and then concern.  'You destroyed the machine?!  You should come with me to the Plane of Tactics.  Surely the Zeks will want to honor you in your warring spirit.  I will go on ahead of you to prepare for your arrival.  I believe that you can access the Plane through the portal that the weakli.. Er tranquil have opened in the Plane of Tranquility.  I anticipate our next meeting on the Battlefields of Zek!'");
				if ( qglobals.zeks == "1" and flags <= FLAG_LIMIT ) then
					eq.set_global("zeks", "2", 5, "F");
					e.other:Message(15, "You have received a character flag!");
					flags = flags + 1;
					
					if ( qglobals.cl_behemoth ) then
						eq.delete_global("cl_behemoth");
					end
				end			
			end
		end
	end
end
