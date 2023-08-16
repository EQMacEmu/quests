local POTIMEA_CONTROLLER_TYPE = 219053;
local INSTANCE_CONTROLLER_TYPE = 223077; -- _
local EVENTS_CONTROLLER_TYPE = 223078; -- _
local QUARM_TYPE = 223008;
local VORTEX_TYPE = 223158;
local EGG_TYPE = 223161;
local ZEBUXORUK_TYPE = 223159;
local DRUZZIL_TYPE = 223160;
local QUARM_STATE = {
	{ mr = 300, fr = 400, cr = 300, pr = 280, dr = 250, ac = 400 },
	{ mr = 300, fr = 200, cr = 400, pr = 280, dr = 250, ac = 400 },
	{ mr = 400, fr = 300, cr = 175, pr = 400, dr = 200, ac = 200 },
	{ mr = 200, fr = 200, cr = 200, pr = 200, dr = 400, ac = 1000 },
};

local quarmState, quarmMoved, phaseSpell, spellCount, cascadeSpellOne, cascadeSpellTwo;

function Phase6Signal(e)

	if ( e.signal == 601 ) then
		quarmState = 1;
		local quarm = eq.spawn2(QUARM_TYPE, 0, 0, -401, -1106, 22, 64);
		SetQuarmStats(quarm:CastToNPC());
		quarmMoved = false;		
		eq.spawn2(EGG_TYPE, 0, 0, -579, -1119, 60, 64);
		eq.signal(POTIMEA_CONTROLLER_TYPE, 6, 0, tostring(quarmState));
	end
end

function QuarmSignal(e)
	if ( not quarmMoved ) then
		quarmMoved = true;
		e.self:CastToNPC():MoveTo(42, -1126, 32, -1, false); -- not precise loc		
	end
end

function QuarmSpawn(e)
	eq.set_next_hp_event(math.random(73, 77));
end

function QuarmCombat(e)
	if ( e.joined ) then
		if ( e.self:GetHPRatio() > 96 ) then
			eq.set_next_hp_event(math.random(73, 77));
		end
		eq.set_timer("aoe", 10000);
		eq.set_timer("vortices", 25000);
		eq.stop_timer("check_hp");
	else
		eq.stop_timer("aoe");
		eq.stop_timer("vortices");
		eq.stop_timer("cascade");
		eq.set_timer("check_hp", 3000);
		eq.depop_all(VORTEX_TYPE);
	end
end

function SetQuarmStats(npc)
	for stat, value in pairs(QUARM_STATE[quarmState]) do
		npc:ModifyNPCStat(stat, tostring(value));
	end
end

function SpawnVortices(quarm)
		
	eq.depop_all(VORTEX_TYPE);
	
	-- spawn two near quarm
	local x, y, z = quarm:GetX(), quarm:GetY(), quarm:GetZ();
	local mob;
	for i = 1, 2 do
		mob = eq.spawn2(VORTEX_TYPE, 0, 0, x + math.random(-75, 75), y + math.random(-75, 75), z, 0);
		eq.set_timer("blur", 9000, mob);
	end

	-- spawn one on top of a random client.  Live doesn't do this
	local c = quarm:GetHateRandomClient(600);
	if ( c and c.valid ) then
		mob = eq.spawn2(VORTEX_TYPE, 0, 0, c:GetX(), c:GetY(), c:GetZ()+10, 0);
		eq.set_timer("blur", 9000, mob);
	end

	-- spawn vorticies on every ranger shooting from 400-500 range
	-- why do this?  because archery has CRAZY HUGE range and rangers have a stupidly good advantage on this fight
	-- if we don't punish them, people will make raids half full of ranger alts (they still might)
	-- the major problem is healers can heal+cure rangers from outside of AoE radius; they can also duck AoEs by running out a short ways
	local hl = quarm:GetHateList();
	local clients = {};
	local dist;
	for ent in hl.entries do
		if ( ent.ent:IsClient() and ent.ent:GetClass() == 4 ) then
			dist = quarm:CalculateDistance(ent.ent:GetX(), ent.ent:GetY(), ent.ent:GetZ());
			if ( dist > 400 and dist < 500 ) then
				table.insert(clients, ent.ent:CastToClient());
			end
		end
	end
	
	if ( #clients > 0 ) then
		c = clients[math.random(1, #clients)];
		mob = eq.spawn2(VORTEX_TYPE, 0, 0, c:GetX(), c:GetY(), c:GetZ()+10, 0);
		mob:AddToHateList(c, 10000);
		eq.set_timer("blur", 9000, mob);
	end
end

function VortexSpawn(e)
	local quarm = eq.get_entity_list():GetNPCByNPCTypeID(QUARM_TYPE);
	if ( quarm.valid and not e.self:CheckLoSToLoc(-242, -1124, 20) ) then
		eq.debug("Vortex spawned outside wall; moving to Quarm", 3);
		e.self:GMMove(quarm:GetX(), quarm:GetY(), quarm:GetZ(), 0);
	end
end

function VortexTimer(e)
	if ( e.timer == "blur" ) then
	
		local target = e.self:GetTarget();
		if ( target and target.valid ) then
			e.self:RemoveFromHateList(target);
		end
		
		local list = e.self:GetHateList();		
		for ent in list.entries do
			e.self:SetHate(ent.ent, 1);
		end
	end
end

function QuarmHP(e)
	if ( e.hp_event > 70 ) then
		eq.set_next_hp_event(math.random(48, 52));
		quarmState = 2;
		eq.get_entity_list():MessageClose(e.self, true, 500, 0, "Quarm roars in pain as his red head explodes in a shower of flaming ethereal energy!");
		e.self:SendIllusionPacket({race=304,gender=2,texture=254,helmtexture=1,size=70});
		phaseSpell = 2380; -- Drakeen Vortex; this is a revemped ST spell that I modified to mimic Quarm's 3k cold AoE
		spellCount = 1;
		
	elseif ( e.hp_event > 40 ) then
		eq.set_next_hp_event(math.random(23, 27));
		quarmState = 3;
		eq.get_entity_list():MessageClose(e.self, true, 500, 0, "Quarm roars in pain as his blue head explodes into pure ethereal energy!");
		e.self:SendIllusionPacket({race=304,gender=2,texture=254,helmtexture=2,size=70});
		phaseSpell = 3777; -- Timeforged Airblast III, 18 second AoE stun
		spellCount = 1;
		
	elseif ( e.hp_event > 20 ) then
		quarmState = 4;
		eq.get_entity_list():MessageClose(e.self, true, 500, 0, "Quarm shakes the cavern with a bellow of pain as the white head explodes into a swirling vortex of ethereal energy!");
		e.self:SendIllusionPacket({race=304,gender=2,texture=254,helmtexture=3,size=70});
		phaseSpell = 3770; -- Venomed Mist with -500 mana/tick DoT
		spellCount = 1;
	end
	SetQuarmStats(e.self);
	e.self:CastSpell(3230, e.self:GetID()); -- Balance of the Nameless
	eq.set_timer("phase_spell", 4000);
	eq.set_timer("aoe", 30000);
	eq.stop_timer("cascade");
	eq.signal(POTIMEA_CONTROLLER_TYPE, 6, 0, tostring(quarmState));
	
	eq.debug("PoTime Quarm state is now "..quarmState);
end

function DoQuarmAOE(quarm)
	local rng = math.random(1, 3);
	
	if ( quarmState == 1 ) then
	
		if ( rng == 1 ) then
			-- AK's Quarm spam casted these spells because they were in place of the real spells and these had no recast timers on them
			-- So doing this to kind-of mimic it.  Have to do something like this anyway because we only have a few spells we can use
			quarm:CastSpell(eq.ChooseRandom(3781, 3779), quarm:GetID()); -- Cinderblast of Time I, Dissention of Water I (250 dmg+atk debuff)
			eq.set_timer("cascade", 2000);
			spellCount = 9;
			cascadeSpellOne = 3781;
			cascadeSpellTwo = 3779;
		else
			quarm:CastSpell(eq.ChooseRandom(3767, 3768), quarm:GetID()); -- Epoch Conviction (curse), Infernal Flames (3k fire damage)
		end
		
	elseif ( quarmState == 2 ) then
	
		if ( rng == 1 ) then
			quarm:CastSpell(eq.ChooseRandom(3780, 3769), quarm:GetID()); -- Dissention of Water II (450 dmg+atk debuff), Glacier Breath (100 dmg+20% snare)
			eq.set_timer("cascade", 2000);
			spellCount = 9;
			cascadeSpellOne = 3780;
			cascadeSpellTwo = 3769;
		else
			quarm:CastSpell(eq.ChooseRandom(3767, 2380), quarm:GetID()); -- Epoch Conviction, Drakeen Vortex (3k cold damage)
		end
		
	elseif ( quarmState == 3 ) then
		
		if ( rng == 1 ) then
			quarm:CastSpell(3775, quarm:GetID()); -- Timeforged Airblast I (6 second stun, somewhat easily resisted)
			eq.set_timer("cascade", 2000);
			spellCount = 4;
			cascadeSpellOne = 3775;
			cascadeSpellTwo = 3775;
		else
			quarm:CastSpell(eq.ChooseRandom(3767, 3772), quarm:GetID()); -- Epoch Conviction, Earthen Collaboration II (poison)
		end
		
	elseif ( quarmState == 4 ) then

		if ( rng == 1 ) then
			quarm:SpellFinished(2307, quarm, 10, 0, 0, -300); -- Breath of the Fallen (disease dmg+dot; 8 hr duration)
		else
			quarm:CastSpell(eq.ChooseRandom(3767, 3771), quarm:GetID()); -- Epoch Conviction, Plagued Earth (disease curable)
		end

	end
end

function QuarmTimer(e)

	if ( e.timer == "check_hp" ) then
		if ( e.self:GetHPRatio() > 90 ) then
			if ( quarmState > 1 ) then
				quarmState = 1;
				e.self:SendIllusionPacket({race=304,gender=2,texture=254,helmtexture=0,size=70});
				SetQuarmStats(e.self);
				eq.signal(POTIMEA_CONTROLLER_TYPE, 6, 0, tostring(quarmState));
			end
			eq.stop_timer(e.timer);
		end
		
	elseif ( e.timer == "vortices" ) then
	
		SpawnVortices(e.self);
	
	elseif ( e.timer == "aoe" ) then
	
		DoQuarmAOE(e.self);
		eq.set_timer("aoe", 25000+math.random(0, 8000));
		
	elseif ( e.timer == "phase_spell" or e.timer == "cascade" ) then
	
		if ( e.timer == "phase_spell" ) then
			e.self:CastSpell(phaseSpell, e.self:GetID());		
		else
			e.self:CastSpell(eq.ChooseRandom(cascadeSpellOne, cascadeSpellTwo), e.self:GetID());
		end
		
		spellCount = spellCount - 1;
		if ( spellCount <= 0 ) then
			eq.stop_timer(e.timer);
		end
	end
end

function QuarmDeath(e)
	if ( quarmState ~= 4 or e.self:GetAC() ~= 1000 ) then
		eq.debug("Error: Quarm did not power up correctly.  Depoping corpse.");
		e.self:ClearItemList();
		e.self:Depop();
		eq.depop_all(e.self:GetNPCTypeID());
	end
end

function QuarmDeathComplete(e)
	eq.signal(INSTANCE_CONTROLLER_TYPE, 6, 0, "6;1");
	eq.depop_all(VORTEX_TYPE);
	local egg = eq.get_entity_list():GetMobByNpcTypeID(EGG_TYPE);
	egg:SetSpecialAbility(35, 0); -- No Harm from Players off
	egg:SetBodyType(7, false); -- NoTarget off
end

function EggDeathComplete(e)
	eq.spawn2(ZEBUXORUK_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end

function ZebuxorukSpawn(e)
	e.self:Emote("staggers about and looks at you drowsy, from his weakened state. 'My thanks to you.  I am surprised to see you have made it here.  We must get back to Norrath.  The time has come for me to share my knowledge. Something is coming, a threat to us all, and the sands in the hourglass are thinning. Make haste and take me back the way you came.'");
	eq.set_timer("dialog2", 32000);
end

function ZebuxorukTimer(e)
	eq.stop_timer(e.timer);
	
	if ( e.timer == "dialog2" ) then
		e.self:Say("I am surprised at the gods for taking such drastic measures, though I suppose all of the creations of the Nameless are capable of displaying poor judgment and irrational behavior.  These gods are burdened with powers and responsibilities beyond our comprehension, yet at times even they do not understand the eventual effect of their actions.  I am compelled to share the knowledge of the gods with the populace of Norrath, so that I might save their creations.  They do not realize that if mortality ceases to exist... if they are not worshipped and held aloft by the beliefs of those that they now have grown to fear... they will fall from power and a new age of darkness will wash over existence as they know it.  I did not seek to interfere with them or their realms, only to free them from a fate that awaits all of us.  It is this fate that now stands ready, greedily gathered on the edge of the void, ready to test the will of all mortals.");
		eq.set_timer("move", 28000);
		
	elseif ( e.timer == "move" ) then
		e.self:MoveTo(-295, -1120, 0, 64, true);	-- not precise loc
		
	elseif ( e.timer == "dialog5" ) then
		e.self:Say("Druzzil, I have missed you.  Wasn't it you that taught me in your own realm to seek knowledge and share it in all forms?");
	end
end

function ZebuxorukWaypointArrive(e)
	-- dialog3
	e.self:Say("If they have taken measures these extreme I must rethink what I have done, and what I will do.  If there was this much cause for conc...");
	eq.get_entity_list():MessageClose(e.self, true, 125, 0, "Suddenly in a bright flash a feminine figure appears before you.  Your ears ring from the loud burst as she slowly materializes.");
	eq.spawn2(DRUZZIL_TYPE, 0, 0, e.self:GetX() + 25, e.self:GetY(), e.self:GetZ(), 192);
	eq.set_timer("dialog5", 15000);
end

function DruzzilSpawn(e)
	eq.set_timer("dialog4", 9000);
end

function DruzzilTimer(e)
	eq.stop_timer(e.timer);
	
	if ( e.timer == "dialog4" ) then
		e.self:Emote("speaks with no movement of her mouth.  Her thoughts flow through you, calming you as you begin to comprehend what she is trying to communicate to you.");
		e.self:Emote("speaks to your mind, 'Zebuxoruk, my student I cannot allow this to happen.  If you were to escape from another prison the will and power of the gods will have been compromised.'");
		eq.set_timer("dialog6", 12000);
	
	elseif ( e.timer == "dialog6" ) then
		e.self:Emote("speaks to your mind, 'That I did, but I also taught you not to share your wealth of knowledge if it would affect the fate of others.  I cannot allow this to happen.  I must set things back to how they were before you and these mortals arrived here, I believe that you cannot understand this and I am sorry.'");
		eq.set_timer("dialog7", 6000);
	
	elseif ( e.timer == "dialog7" ) then
		e.self:Emote("looks upon Zebuxoruk one last time, as a wave of sadness comes across her gentle face.");
		eq.set_timer("dialog8", 6000);
		
	elseif ( e.timer == "dialog8" ) then
		e.self:Emote("begins to chant an incantation; mana flows out from her body in all directions.  Things begin moving slowly in reverse.  You become dizzy from the experience and fall to your knees.  As you look up the last thing you can see is Druzzil Ro smiling in your direction.  She then waves her arms gracefully and points at you.");
		eq.set_timer("dialog9", 6000);
		
	elseif ( e.timer == "dialog9" ) then
		eq.get_entity_list():MessageClose(e.self, true, 500, 0, "There is a brilliant flash and you find yourself displaced through time and space.  For a moment you lose touch with yourself.  As you wake, you find yourself back in the Plane of Knowledge, moments after talking to Maelin with the information of retrieving the Quintessence of Elements.  Druzzil has preserved the timeline, and restored existence back to its normalcy.");
		eq.set_timer("port", 2000);
		
	elseif ( e.timer == "port" ) then
		eq.set_timer("depop", 10000);
		
		local clientList = eq.get_entity_list():GetClientList();
		if ( clientList ) then
			for client in clientList.entries do
				if ( (client:GetX() < 500 or client:GetY() > 500) and not client:GetGM() ) then
					client:MovePC(202, 1007, 6, 390, 64*2);
				end
			end
		end
		
	elseif ( e.timer == "depop" ) then
		eq.depop_all(ZEBUXORUK_TYPE);
		eq.depop_all(DRUZZIL_TYPE);
	end
end

function event_encounter_load(e)
	eq.register_npc_event("Phase6", Event.signal, EVENTS_CONTROLLER_TYPE, Phase6Signal);

	eq.register_npc_event("Phase6", Event.combat, QUARM_TYPE, QuarmCombat);
	eq.register_npc_event("Phase6", Event.hp, QUARM_TYPE, QuarmHP);
	eq.register_npc_event("Phase6", Event.timer, QUARM_TYPE, QuarmTimer);
	eq.register_npc_event("Phase6", Event.signal, QUARM_TYPE, QuarmSignal);
	eq.register_npc_event("Phase6", Event.death, QUARM_TYPE, QuarmDeath);
	eq.register_npc_event("Phase6", Event.death_complete, QUARM_TYPE, QuarmDeathComplete);

	eq.register_npc_event("Phase6", Event.timer, VORTEX_TYPE, VortexTimer);
	eq.register_npc_event("Phase6", Event.spawn, VORTEX_TYPE, VortexSpawn);

	eq.register_npc_event("Phase6", Event.death_complete, EGG_TYPE, EggDeathComplete);
	eq.register_npc_event("Phase6", Event.spawn, ZEBUXORUK_TYPE, ZebuxorukSpawn);
	eq.register_npc_event("Phase6", Event.timer, ZEBUXORUK_TYPE, ZebuxorukTimer);
	eq.register_npc_event("Phase6", Event.waypoint_arrive, ZEBUXORUK_TYPE, ZebuxorukWaypointArrive);
	eq.register_npc_event("Phase6", Event.spawn, DRUZZIL_TYPE, DruzzilSpawn);
	eq.register_npc_event("Phase6", Event.timer, DRUZZIL_TYPE, DruzzilTimer);
	
	eq.signal(POTIMEA_CONTROLLER_TYPE, 7); -- tell PoTimeA that PoTimeB was reset in case zone B crashes
end
