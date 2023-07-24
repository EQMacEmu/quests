local NORTH_TVX_TYPE = 158136;
local SOUTH_TVX_TYPE = 158465;
local NORTH_VA_XAKRA1_SPAWNID = 365859;
local NORTH_VA_XAKRA2_SPAWNID = 365582;
local SOUTH_VA_XAKRA1_SPAWNID = 366962;
local SOUTH_VA_XAKRA2_SPAWNID = 366429;

local LINK_HATE_CAP = 5000;

local BAD_COORDS = {
	-- in water outside, SE
	{ -270, -157,		-- min X, max X
	  -1000, -181,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
	-- in water outside, S
	{ -270, 573,		-- min X, max X
	  -1000, -603,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
	-- in water outside, NE
	{ -270, -157,		-- min X, max X
	  181, 1000,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
	-- in water outside, N
	{ -270, 573,		-- min X, max X
	  603, 1000,		-- min Y, max Y
	  -1000, 1000,		-- min Z, max Z
	},
	-- above floors 
	{ -500, 1000,		-- min X, max X
	  -1000, 1000,		-- min Y, max Y
	  100, 1000,		-- min Z, max Z
	},
};

function BadAreaCheck(self)

	local hl = self:GetHateList();
	local clients = {};
	for ent in hl.entries do
		if ( ent.ent:IsClient() ) then
			table.insert(clients, ent.ent:CastToClient());
		end
	end
	
	if ( self:GetX() > -260 and self:GetZ() < 0 ) then
		self:GMMove(self:GetSpawnPointX(), self:GetSpawnPointY(), self:GetSpawnPointZ(), self:GetSpawnPointH());
		self:WipeHateList();
	end

	for _, client in ipairs(clients) do
		if ( not client:GetGM() ) then
			for _, coords in ipairs(BAD_COORDS) do
			
				if ( client:GetX() > coords[1] and client:GetX() < coords[2]
					and client:GetY() > coords[3] and client:GetY() < coords[4]
					and client:GetZ() > coords[5] and client:GetZ() < coords[6]
				) then
					eq.signal(158480, client:GetID()); -- Stop_Cheating; tell it to Cazic Touch
					return;
				end
			end
		end
	end
end

function AggroLink(boss, guardId)
	local npcList = eq.get_entity_list():GetNPCList();
	local bossTopHater = boss:GetHateTop();
	local bossTopHate = boss:GetHateAmount(bossTopHater, false);
	local cappedHate = bossTopHate;
	local topHaterGuardHate;
	if ( bossTopHate > LINK_HATE_CAP ) then
		cappedHate = LINK_HATE_CAP;
	end
	
	if ( npcList ) then
	
		for npc in npcList.entries do

			if ( npc.valid and npc:GetSpawnPointID() == guardId ) then
				
				if ( bossTopHater ) then
					topHaterGuardHate = npc:GetHateAmount(bossTopHater, false);
					
					if ( topHaterGuardHate < cappedHate ) then
						npc:SetHate(bossTopHater, cappedHate);
					end
				end				
				return;
			end
		end
	end

end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("aggrocheck", 1000);
		
		-- players were pulling this NPC through the wall to outside or to 3rd floor to avoid trash.  Kill the bastard
		if ( e.self:GetX() > -260 ) then
			eq.set_timer("cheat_check", 1000);
			BadAreaCheck(e.self);
		end
	else	
		eq.stop_timer("aggrocheck");
		eq.stop_timer("cheat_check");
		if ( e.self:GetX() < -150 ) then
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
		end
	end
end

function event_timer(e)
	if ( e.timer == "aggrocheck" ) then
		local selfId = e.self:GetNPCTypeID();
		local mob;

		if ( selfId == NORTH_TVX_TYPE ) then
			AggroLink(e.self, NORTH_VA_XAKRA1_SPAWNID);
			AggroLink(e.self, NORTH_VA_XAKRA2_SPAWNID);
		elseif ( selfId == SOUTH_TVX_TYPE ) then
			AggroLink(e.self, SOUTH_VA_XAKRA1_SPAWNID);
			AggroLink(e.self, SOUTH_VA_XAKRA2_SPAWNID);
		end
		
	elseif ( e.timer == "cheat_check" ) then
		if ( e.self:GetX() > -260 and e.self:GetHPRatio() > 95 ) then
			BadAreaCheck(e.self);
		else
			eq.stop_timer(e.timer);
		end	
	end
end
