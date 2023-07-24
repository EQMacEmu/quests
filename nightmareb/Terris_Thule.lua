-- dream defilers at 79% and 69%, dispel at 50%, gargoyles at 40%
-- one defiler seems to spawn for every player that has attacked Terris, not pets or healers; not 100% sure how this works
-- there are two defilers types.  one is larger and is immune to stuff

local PLANAR_PROJECTION_TYPE = 221042;
local DEFILER_SMALL_TYPE = 221045;
local DEFILER_LARGE_TYPE = 221044;
local GARG_TYPE = 221043;
local GARG_SPAWN_IDS = { 365397, 366053, 366176, 367232 };

function event_death_complete(e)
	eq.spawn2(PLANAR_PROJECTION_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	eq.signal(PLANAR_PROJECTION_TYPE, e.killer:GetID()); -- e.killer for death_complete is somebody with kill rights, not death blow
end

function event_spawn(e)
	eq.set_next_hp_event(95);
end

function SpawnDefilers(mob)
	local numSpawns = 0;
	local hateList = mob:GetHateList();
	
	for ent in hateList.entries do
		if ( ent.ent:IsClient() and ent.damage > 0 ) then
			numSpawns = numSpawns + 1;
		end
	end

	local t;
	for i = 1, numSpawns do
		t = math.random(1, 2);
		if ( t == 1 ) then
			t = DEFILER_SMALL_TYPE;
		else
			t = DEFILER_LARGE_TYPE;
		end
		--eq.spawn2(t, 0, 0, -1634, -192, 267, 0); -- defilers seem to all spawn from this single point; this is the precise loc on Live servers
		eq.spawn2(t, 0, 0, -1661, -168, 140, 0); -- moved point to ground because our pathing doesn't like them spawning on the wall
	end
end

function event_hp(e)

	if ( e.hp_event == 95 ) then
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "The sound of a thousand terrified screams fills your head.  You feel yourself becoming a part of the fabric of this nightmare realm.");
		eq.set_next_hp_event(79);
		
	elseif ( e.hp_event == 79 ) then
		eq.set_next_hp_event(69);
		SpawnDefilers(e.self);
	
	elseif ( e.hp_event == 69 ) then
		eq.set_next_hp_event(50);
		SpawnDefilers(e.self);
	
	elseif ( e.hp_event == 50 ) then
		eq.set_next_hp_event(40);
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "As if in a waking nightmare, you feel your movements slow and your arms begin to fail you.  Each swing of your weapon feels as if it will miss its mark.   Even your legs begin to fail you, as you fall deeper into the dreamlike state!");
		e.self:CastSpell(3150, e.self:GetID()); -- Direption of Dreams
	
	elseif ( e.hp_event == 40 ) then
		e.self:Shout("You will not escape my realm so easily!");
		eq.get_entity_list():MessageClose(e.self, true, 250, 0, "The air grows thick with the smell of burning mana.  A rumbling sound draws your attention to the massive statues that rest above the ancient monoliths.  The statues begin to crumble, as they shift their attention from the heavens to you!");
		
		local npcList = eq.get_entity_list():GetNPCList();
		
		if ( npcList ) then
		
			for npc in npcList.entries do

				if ( npc.valid and npc:GetSpawnPointID() ) then
				
					for _, id in ipairs(GARG_SPAWN_IDS) do
						if ( id == npc:GetSpawnPointID() ) then
							eq.spawn2(GARG_TYPE, 0, 0, npc:GetX(), npc:GetY(), npc:GetZ(), npc:GetHeading());
							npc:Depop(true);	-- depop with timer
							break;
						end
					end
				end
			end
		end

	end
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("boundscheck", 1000);
	else
		eq.set_timer("checkhp", 3000);
		eq.stop_timer("boundscheck");
	end
end

function event_timer(e)

	if ( e.timer == "checkhp" ) then
	
		if ( e.self:GetHPRatio() == 100 ) then
			eq.stop_timer("checkhp");
			eq.set_next_hp_event(95);
			
			--[[
			-- gargs have a brief unaggro depop timer and the untargatbles respawn when they despawn so this isn't neccessary
			local elist = eq.get_entity_list();
			
			for _, id in ipairs(GARG_SPAWN_IDS) do
				elist:GetSpawnByID(id):SetTimer(1);
			end
			eq.depop_all(GARG_TYPE);
			]]
		end
		
	elseif ( e.timer == "boundscheck" ) then
	
		if ( e.self:GetX() > -1580 or e.self:GetX() < -2090 or e.self:GetY() > 250 or e.self:GetY() < -280 ) then
			eq.get_entity_list():MessageClose(e.self, true, 200, 0, "Terris Thule disappears into the ether and reforms at the center of her chamber, cleansed of your magic!");
			e.self:GMMove(e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH());
			e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
		end
	end
end
