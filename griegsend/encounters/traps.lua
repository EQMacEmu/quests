local FAKE_SENDING = 163002;	-- A_Dark_Sending_ (level 55; body type 67)

local TYPES = {
	[163150] = {	-- A_Dark_Sending (level 55; body type 67)
		163135, -- A_Dark_Sending (SK)
		163379, -- A_Dark_Sending (Cleric)
		163380, -- A_Dark_Sending (War)
		163381, -- A_Dark_Sending (Monk)
		163010, -- A_Dark_Sending (War higher level)
		163016, -- A_Dark_Sending (Necro)
		163391, -- A_Dark_Sending (Enchanter)
		163012, -- A_Black_Sending_
		163006, -- A_White_Sending_
		163004, -- A_Warped_Sending_
		163385, -- A_Grey_Sending_
	},
	[163124] = {	 -- An_Atra_Somnium
		163386, -- An_Atra_Somnium (lower dmg)
		163387, -- An_Atra_Somnium (higher dmg)
		163013, -- A_Niveus_Somnium
		163014, -- A_Pullus_Somnium
	},
	[163065] = {	 -- A_Dark_Vision
		163388, -- A_Dark_Vision_ (warrior)
		163392, -- A_Dark_Vision_ (cleric)
		163393, -- A_Dark_Vision_ (necromancer)
		163394, -- A_Dark_Vision_ (warrior higher level)
		163396, -- A_Dark_Vision_ (SK)
		163022, -- A_Somber_Vision_
		163023, -- A_Writhing_Vision
		163024, -- A_Fearful_Vision
		163026, -- A_Fearsome_Vision
		163025, -- A_Lucid_Vision
	},
	[163062] = {	 -- A_Dark_Visage (only one of these apparently)
		163390, -- A_Creeping_Visage
	},
};

local SPAWN_CHANCE = {
	[163150] = {	-- A_Dark_Sending (level 55; body type 67)
		13, -- A_Dark_Sending (SK)
		13, -- A_Dark_Sending (Cleric)
		14, -- A_Dark_Sending (War)
		13, -- A_Dark_Sending (Monk)
		13, -- A_Dark_Sending (War higher level)
		13, -- A_Dark_Sending (Necro)
		13, -- A_Dark_Sending (Enchanter)
		2, -- A_Black_Sending_
		2, -- A_White_Sending_
		2, -- A_Warped_Sending_
		2, -- A_Grey_Sending_
	},
	[163124] = {	 -- An_Atra_Somnium
		45, -- An_Atra_Somnium (lower dmg)
		45, -- An_Atra_Somnium (higher dmg)
		5, -- A_Niveus_Somnium
		5, -- A_Pullus_Somnium
	},
	[163065] = {	 -- A_Dark_Vision
		18, -- A_Dark_Vision_ (warrior)
		18, -- A_Dark_Vision_ (cleric)
		18, -- A_Dark_Vision_ (necromancer)
		18, -- A_Dark_Vision_ (warrior higher level)
		17, -- A_Dark_Vision_ (SK)
		3, -- A_Somber_Vision_
		1, -- A_Writhing_Vision
		1, -- A_Fearful_Vision
		3, -- A_Fearsome_Vision
		3, -- A_Lucid_Vision
	},
	[163062] = {	 -- A_Dark_Visage
		100, -- A_Creeping_Visage
	},
};

local EMOTE_TRAP_TYPES = {
	[163383] = 1,		-- Blue
	[163125] = 1,		-- Clouds
	[163089] = 1,		-- Look
	[163082] = 1,		-- Some
	[163110] = 1,		-- Something
	[163395] = 1,		-- Something	
	[163134] = 1,		-- Strange
	[163096] = 1,		-- The
	[163384] = 1,		-- The
	[163117] = 1,		-- What
	[163091] = 1,		-- Will
	[163215] = 1,		-- You
	[163382] = 1,		-- You
	[163153] = 1,		-- Your hand
};

function TrapCombatEvent(e)
	if ( e.joined ) then

		local typeId = e.self:GetNPCTypeID();
		
		if ( EMOTE_TRAP_TYPES[typeId] ) then
			eq.depop_with_timer();
			return;
			
		elseif ( typeId == FAKE_SENDING ) then
			e.self:Emote("tries to take form!");
			if ( math.random(100) > 25 ) then
				e.self:Emote("is unable to pierce the veil of reality.");				
			end
			eq.depop_with_timer();
			return;
		end
	
		if ( TYPES[typeId] and TYPES[typeId][1] and SPAWN_CHANCE[typeId] and SPAWN_CHANCE[typeId][1] ) then
		
			local roll = math.random(100);
			local i = 0;
			local sum = 0;
			local spawnType = TYPES[typeId][1];
			
			repeat
				i = i + 1;
				sum = sum + SPAWN_CHANCE[typeId][i];
			
			until ( not SPAWN_CHANCE[typeId][i] or sum >= roll or i > 100 )
			
			spawnType = TYPES[typeId][i];
		
			local npc = eq.spawn2(spawnType, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
			eq.set_timer("depop", 900000, npc);
		end
		
		eq.depop_with_timer();
	else
		eq.resume_timer("depop");
	end
end

function MobCombatEvent(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function TimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.depop_with_timer();
	end
end

function event_encounter_load(e)
	
	eq.register_npc_event("traps", Event.combat, FAKE_SENDING, TrapCombatEvent);
	for typeId in pairs(TYPES) do
		eq.register_npc_event("traps", Event.combat, typeId, TrapCombatEvent);
	end
	for typeId in pairs(EMOTE_TRAP_TYPES) do
		eq.register_npc_event("traps", Event.combat, typeId, TrapCombatEvent);
	end

	for _, spawnedTypes in pairs(TYPES) do
		for _, typeId in ipairs(spawnedTypes) do
			eq.register_npc_event("traps", Event.timer, typeId, TimerEvent);
			eq.register_npc_event("traps", Event.combat, typeId, MobCombatEvent);
		end
	end
		
end
