local MAX_KEYS = 54;

local keys;
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
	eq.set_timer("depop", 600000);
	keys = 0;
end

function event_timer(e)
	eq.depop();
end

function event_combat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);

	if ( ClientCanFlag(e.other) ) then

		if ( e.message:findi("hail") ) then 
		
			if ( not qglobals.earthb_key and keys < MAX_KEYS ) then

				e.self:Say("Your will must be strong "..e.other:GetName()..". Seek council with the council of twelve if you so wish.");
				eq.set_global("earthb_key", "1", 5, "F");
				e.other:Message(15, "You have received a character flag!");

				keys = keys + 1;
				if ( keys == MAX_KEYS ) then
					eq.depop();
				end
			end
		end
	end
end
