local TYPES = {
	[158028] = {			-- weak shades all classes
		158008, -- #Qua_Centien_Xakra
		158032, -- #Qua_Thall_Xakra
		158007, -- #Qua_Zethon_Xakra
		158040, -- #Qua_Senshali_Xakra
		158102, -- #Qua_Liako_Xakra
		158029, -- #Qua_Va_Liako_Xakra
		158122, -- #Zov_Centien_Xakra
		158116, -- #Zov_Thall_Xakra
		158043, -- #Zov_Zethon_Xakra
		158013, -- #Zov_Senshali_Xakra
		158110, -- #Zov_Liako_Xakra
		158014, -- #Zov_Va_Liako_Xakra
		158088, -- #Zun_Centien_Xakra
		158087, -- #Zun_Thall_Xakra
		158103, -- #Zun_Zethon_Xakra
		158016, -- #Zun_Senshali_Xakra
		158012, -- #Zun_Liako_Xakra
		158123, -- #Zun_Va_Liako_Xakra
	},
	[158467] = {				-- weak shade warriors
		158008, -- #Qua_Centien_Xakra
		158122, -- #Zov_Centien_Xakra
		158088, -- #Zun_Centien_Xakra
	},
	[158468] = {				-- weak shade clerics
		158032, -- #Qua_Thall_Xakra
		158116, -- #Zov_Thall_Xakra
		158087, -- #Zun_Thall_Xakra
	},
	[158469] = {				-- weak shade wizards
		158007, -- #Qua_Zethon_Xakra
		158043, -- #Zov_Zethon_Xakra
		158103, -- #Zun_Zethon_Xakra
	},
	[158470] = {					-- weak shade rogues
		158040, -- #Qua_Senshali_Xakra
		158013, -- #Zov_Senshali_Xakra
		158016, -- #Zun_Senshali_Xakra
	},
	[158080] = {			-- strong shades all classes
		158088, -- #Zun_Centien_Xakra
		158087, -- #Zun_Thall_Xakra
		158103, -- #Zun_Zethon_Xakra
		158016, -- #Zun_Senshali_Xakra
		158012, -- #Zun_Liako_Xakra
		158123, -- #Zun_Va_Liako_Xakra
		158113, -- #Pli_Centien_Xakra
		158100, -- #Pli_Thall_Xakra
		158101, -- #Pli_Zethon_Xakra
		158074, -- #Pli_Senshali_Xakra
		158097, -- #Pli_Liako_Xakra
		158098, -- #Pli_Va_Liako_Xakra
		158121, -- #Eom_Centien_Xakra
		158125, -- #Eom_Thall_Xakra
		158099, -- #Eom_Zethon_Xakra
		158124, -- #Eom_Senshali_Xakra
		158112, -- #Eom_Liako_Xakra
		158069, -- #Eom_Va_Liako_Xakra
	},
	[158471] = {				-- strong shade clerics
		158087, -- #Zun_Thall_Xakra
		158100, -- #Pli_Thall_Xakra
		158125, -- #Eom_Thall_Xakra
	},
	[158472] = {				-- strong shade wizards
		158103, -- #Zun_Zethon_Xakra
		158101, -- #Pli_Zethon_Xakra
		158099, -- #Eom_Zethon_Xakra
	},
	[158473] = {				-- strong shade rogues
		158016, -- #Zun_Senshali_Xakra
		158074, -- #Pli_Senshali_Xakra
		158124, -- #Eom_Senshali_Xakra
	},
	[158095] = {				-- weak akhevan all classes
		158126, -- #Qua_Centien
		158009, -- #Qua_Thall
		158090, -- #Qua_Zethon
		158104, -- #Qua_Senshali
		158111, -- #Qua_Liako
		158114, -- #Qua_Va_Liako
		158127, -- #Zov_Centien
		158015, -- #Zov_Thall
		158139, -- #Zov_Zethon
		158106, -- #Zov_Senshali
		158131, -- #Zov_Liako
		158091, -- #Zov_Va_Liako
		158089, -- #Zun_Centien
		158011, -- #Zun_Thall
		158094, -- #Zun_Zethon
		158107, -- #Zun_Senshali
		158141, -- #Zun_Liako
		158137, -- #Zun_Va_Liako
	},
	[158010] = {				-- weak akhevan clerics
		158009, -- #Qua_Thall
		158015, -- #Zov_Thall
		158011, -- #Zun_Thall
	},
	[158474] = {				-- weak akhevan rogues
		158104, -- #Qua_Senshali
		158106, -- #Zov_Senshali
		158107, -- #Zun_Senshali
	},
	[158475] = {				-- strong akhevan all classes
		158089, -- #Zun_Centien
		158011, -- #Zun_Thall
		158094, -- #Zun_Zethon
		158107, -- #Zun_Senshali
		158141, -- #Zun_Liako
		158137, -- #Zun_Va_Liako
		158105, -- #Pli_Centien
		158129, -- #Pli_Thall
		158115, -- #Pli_Zethon
		158133, -- #Pli_Senshali
		158108, -- #Pli_Liako
		158134, -- #Pli_Va_Liako
		158096, -- #Eom_Centien
		158128, -- #Eom_Thall
		158138, -- #Eom_Zethon
		158132, -- #Eom_Senshali
		158130, -- #Eom_Liako
		158109, -- #Eom_Va_Liako
	},
	[158476] = {				-- strong akhevan warriors
		158089, -- #Zun_Centien
		158105, -- #Pli_Centien
		158096, -- #Eom_Centien
	},
	[158477] = {				-- strong akhevan wizards
		158094, -- #Zun_Zethon
		158115, -- #Pli_Zethon
		158138, -- #Eom_Zethon
	},
	[158478] = {				-- strong akhevan rogues
		158107, -- #Zun_Senshali
		158133, -- #Pli_Senshali
		158132, -- #Eom_Senshali
	},
	[158479] = {				-- strong akhevan knights
		158141, -- #Zun_Liako
		158137, -- #Zun_Va_Liako
		158108, -- #Pli_Liako
		158134, -- #Pli_Va_Liako
		158130, -- #Eom_Liako
		158109, -- #Eom_Va_Liako
	},
};

function TrapCombatEvent(e)
	if ( e.joined ) then
		local myType = e.self:GetNPCTypeID();
		if ( TYPES[myType] ) then
			eq.spawn2(TYPES[myType][math.random(1, #TYPES[myType])], 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
		end
		eq.depop_with_timer();
	end
end

function SpawnEvent(e)
	eq.set_timer("depop", 2220000);
end

function TimerEvent(e)
	if ( e.timer == "depop" ) then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function CombatEvent(e)
	if ( e.joined ) then
		if ( not eq.is_paused_timer("depop") ) then
			eq.pause_timer("depop");
		end
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	for trapType in pairs(TYPES) do
		eq.register_npc_event("traps", Event.combat, trapType, TrapCombatEvent);
	end
	
	-- depop timers
	for _, trapTypes in ipairs( { TYPES[158028], TYPES[158080], TYPES[158095], TYPES[158475] } ) do
		for _, npcType in pairs(trapTypes) do
			eq.register_npc_event("traps", Event.combat, npcType, CombatEvent);
			eq.register_npc_event("traps", Event.timer, npcType, TimerEvent);
			eq.register_npc_event("traps", Event.spawn, npcType, SpawnEvent);
		end
	end
end
