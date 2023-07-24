local RING_NPCS = {
	124316, -- Essence_of_Veeshan
	124287, -- an_emerald_hatchling 
	124285, -- an_onyx_hatchling 
	124288, -- a_cerulean_hatchling 
	124286, -- a_crimson_hatchling 
	124297, -- a_pearl_destroyer 
	124298, -- a_crimson_destroyer 
	124294, -- an_onyx_warden 400 dmg
	124291, -- a_cerulean_warden 400 dmg war
	124289, -- a_jade_warden 400 dmg
	124296, -- a_molten_warden 400 dmg
	124295, -- an_onyx_warden 340 dmg
	124290, -- a_jade_warden 340 dmg
	124299, -- a_crimson_warden 340 dmg
	124292, -- a_cerulean_warden 340 dmg war
	124293, -- a_cerulean_warden 340 dmg cleric
	124300, -- a_molten_destroyer 
	124302, -- an_onyx_destroyer 
	124301, -- a_cerulean_destroyer 
	124303, -- a_jade_destroyer 
	124308, -- a_swiftclaw_racnar 
	124309, -- a_tiger_stripe_racnar 
	124307, -- an_onyx_Templar 
	124305, -- a_jade_templar 
	124304, -- a_crimson_templar 
	124306, -- a_cerulean_templar 
	124311, -- an_acolyte_of_Veeshan 
	124319, -- an_acolyte_of_Veeshan 
	124318, -- a_templar_of_Veeshan
	124310, -- a_carrion_drake 
	124314, -- Vethrol_the_Skycaller 
	124312, -- Zruk_the_Lifestealer 
	124315, -- The_Herald_of_Vulak`Aerr 
	124313, -- Rarthek_the_Swiftclaw 
};
local RING_CLIENT_CHECK_TIMER = 10000;	-- how often to check for clients in the ring
local RING_END_TIMER = 180000;			-- shut down the event if no clients in range for this long
local RING_DEBUG_MODE = false;
local RING_WAVES = {
	[1] = {
		waveTime = 526000,
		waveFunc = function()
			-- Two drakes and a wurm destroyer spawn in the ring, and two more drakes come from the bridge.
			eq.spawn2(eq.ChooseRandom(124297, 124298), 0, 0, -740, 510, 140, 1); -- pit Wurm
			eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -698, 510, 123, 192); -- pit an_acolyte_of_Veeshan
			eq.spawn2(eq.ChooseRandom(124311, 124319), 40, 0, -756, 815, 125, 124); -- bridge an_acolyte_of_Veeshan
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -779, 510, 123, 65); -- pit warden (400 dmg)
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 41, 0, -725, 816, 125, 131); -- bridge warden (400 dmg)
		end
	},
	[2] = {
		waveTime = 150000,
		waveFunc = function()
			-- A vortex of mana fires. One flurry drake spawns with a number of hatchlings, some of which spawn on a delay
			-- I'm not sure how many hatchlings spawned. I don't think more than 6 ever popped at once, so my best guess is that there were 6 to start, and a couple more mini-waves of 3 or 4 each.

			eq.spawn2(124317, 0, 0, -740, 543, 130, 127); -- a vortex of mana
			eq.spawn2(124318, 0, 0, -740, 510, 130, 1); -- pit a_templar_of_Veeshan
			
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			if ( math.random(100) > 50 ) then
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			end
			if ( math.random(100) > 50 ) then
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			end
		end
	},
	[3] = {		-- wave 2 part 2
		waveTime = 150000,
		waveFunc = function()
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			if ( math.random(100) > 50 ) then
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			end
		end
	},
	[4] = {		-- wave 2 part 3
		waveTime = 227000,
		waveFunc = function()
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			if ( math.random(100) > 50 ) then
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, math.random(255)); -- pit hatchling
			end
		end
	},
	[5] = {		-- wave 3
		waveTime = 200000,
		waveFunc = function()
			-- A vortex of mana fires. Two wurm destroyers and two drakes spawn. Four minutes in, four more drakes spawn.

			eq.spawn2(124317, 0, 0, -740, 543, 130, 127); -- a vortex of mana
			
			eq.spawn2(eq.ChooseRandom(124297, 124298), 40, 0, -756, 815, 125, 124); -- bridge wurm
			eq.spawn2(eq.ChooseRandom(124297, 124298), 41, 0, -725, 816, 125, 131); -- bridge wurm
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -679, 509, 125, 192); -- pit warden (400 dmg)
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -802, 510, 125, 65); -- pit warden (400 dmg)
		end
	},
	[6] = {		-- wave 3 part 2
		waveTime = 331000,
		waveFunc = function()
			-- (On one occasion, the second half of this wave was only two drakes.)

			if ( math.random(100) > 25 ) then
				eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 40, 0, -756, 815, 125, 124); -- bridge warden (400 dmg)
				eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 41, 0, -725, 816, 125, 131); -- bridge warden (400 dmg)
			end
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -698, 510, 123, 192); -- pit warden (400 dmg)
			eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -779, 510, 123, 65); -- pit warden (400 dmg)
		end
	},
	[7] = {		-- wave 4
		waveTime = 524000,
		waveFunc = function()
			-- A vortex of mana fires. Zruk the Lifestealer (named drake - black, I think) spawns, and another vortex goes off on his death. Zruk is a bellycaster, and will spawn carrion drake adds after any deaths - including swarm pets!

			eq.spawn2(124317, 0, 0, -740, 543, 130, 127); -- a vortex of mana
			eq.spawn2(124312, 0, 0, -740, 510, 130, 1); -- Zruk
		end
	},
	[8] = {		-- wave 5
		waveTime = 150000,
		waveFunc = function()
			-- Two wurms spawn down the bridge. Two drakes spawn in the ring. Hatchlings pop at intervals. Watch out for runners and DT aggro.
			eq.spawn2(eq.ChooseRandom(124297, 124298), 40, 0, -756, 815, 125, 124); -- bridge wurm
			eq.spawn2(eq.ChooseRandom(124297, 124298), 41, 0, -725, 816, 125, 131); -- bridge wurm
			eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -698, 510, 123, 192); -- pit an_acolyte_of_Veeshan
			eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -779, 510, 123, 65); -- pit an_acolyte_of_Veeshan
		end
	},
	[9] = {		-- wave 5 part 2
		waveTime = 150000,
		waveFunc = function()
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
		end
	},
	[10] = {	-- wave 5 part 3
		waveTime = 220000,
		waveFunc = function()
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
			eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
		end
	},
	[11] = {	-- wave 6
		waveTime = 585000,
		waveFunc = function(splitters)
			-- Two drakes (wardens) spawn in the ring, one on each side of the room. When each dies, two more pop at their original spawn points, and so on. Wave includes 22 drakes in total, 10 splitting from each original.
			
			-- pit wardens (340 dmg)
			local parent = eq.spawn2(eq.ChooseRandom(124295, 124290, 124299, 124292, 124293), 0, 0, -698, 510, 123, 192):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -698,
				y = 510,
				z = 123,
				splits = 2,
				limit = 10,
				types = 1,
			});
			parent = eq.spawn2(eq.ChooseRandom(124295, 124290, 124299, 124292, 124293), 0, 0, -779, 510, 123, 65):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -779,
				y = 510,
				z = 123,
				splits = 2,
				limit = 10,
				types = 1,
			});
		end
	},
	[12] = {	-- wave 7
		waveTime = 584000,
		waveFunc = function()
			-- Two templars (flurry drakes) and one regular drake spawn in the ring. Carrion drakes spawn if players die.
			-- Templars (flurry) spawn at the left and right sides of room. The non-flurry drake spawns in the middle in back.
			
			eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -740, 510, 130, 1); -- pit an_acolyte_of_Veeshan 
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -679, 509, 125, 192); -- pit templar
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -802, 510, 125, 65); -- pit templar
		end
	},
	[13] = {	-- wave 8
		waveTime = 526000,
		waveFunc = function()
			-- Rarthek the Swiftclaw and a swiftclaw racnar spawn. A vortex fires on Rarthek's death.
			eq.spawn2(124313, 0, 0, -740, 510, 130, 1); -- Rarthek_the_Swiftclaw 
			eq.spawn2(124308, 0, 0, -740, 475, 125, 1); -- a_swiftclaw_racnar 
		end
	},
	[14] = {	-- wave 9
		waveTime = 529000,
		waveFunc = function()
			-- Five destroyer drakes spawn.
			eq.spawn2(eq.ChooseRandom(124300, 124302, 124301, 124303), 0, 0, -768, 482, 125, 31); -- pit destroyer drake
			eq.spawn2(eq.ChooseRandom(124300, 124302, 124301, 124303), 0, 0, -715, 484, 125, 226); -- pit destroyer drake
			eq.spawn2(eq.ChooseRandom(124300, 124302, 124301, 124303), 0, 0, -716, 538, 125, 158); -- pit destroyer drake
			eq.spawn2(eq.ChooseRandom(124300, 124302, 124301, 124303), 0, 0, -770, 536, 125, 93); -- pit destroyer drake
			eq.spawn2(eq.ChooseRandom(124300, 124302, 124301, 124303), 42, 0, -740, 816, 125, 127); -- bridge destroyer drake
		end
	},
	[15] = {	-- wave 10
		waveTime = 587000,
		waveFunc = function()
			-- Two templars (flurry drakes) spawn at the east and west ends of the main room. Carrion drakes spawn if players die.
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -802, 510, 125, 63); -- pit templar
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -679, 509, 125, 192); -- pit templar
		end
	},
	[16] = {	-- wave 11
		waveTime = 586000,
		waveFunc = function(splitters)
			-- spawns random NPCs.  Log 1 spawned with tiger+acolyte+templar+warden; log 2 spawned with 3 tigers+warden
			-- 2 more wardens seemed to spawn after the warden was killed.  (both splitting wardens was a jade incidentally)

			-- pit warden (400 dmg)
			local parent = eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -740, 510, 125, 1):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -740,
				y = 510,
				z = 125,
				splits = 2,
				limit = 2,
				types = 0,
			});
			
			local roll = math.random(100);
			
			if ( roll < 33 ) then
				eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -740, 479, 125, 1); -- pit templar
			elseif ( roll < 33 ) then
				eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -749, 479, 125, 1); -- pit an_acolyte_of_Veeshan 
			else
				eq.spawn2(124309, 0, 0, -740, 479, 125, 1); -- pit a_tiger_stripe_racnar
			end
			
			roll = math.random(100);
			if ( roll < 25 ) then
				eq.spawn2(124309, 0, 0, -774, 510, 125, 64); -- pit a_tiger_stripe_racnar
			elseif ( roll < 50 ) then
				eq.spawn2(eq.ChooseRandom(124297, 124298), 0, 0, -774, 510, 125, 64); -- pit wurm
			elseif ( roll < 75 ) then
				eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -774, 510, 125, 64); -- pit an_acolyte_of_Veeshan 
			else
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 127); -- pit hatchling
			end

			roll = math.random(100);
			if ( roll < 25 ) then
				eq.spawn2(124309, 0, 0, -705, 510, 125, 192); -- pit a_tiger_stripe_racnar 
			elseif ( roll < 50 ) then
				eq.spawn2(eq.ChooseRandom(124297, 124298), 0, 0, -705, 510, 125, 192); -- pit wurm
			elseif ( roll < 75 ) then
				eq.spawn2(eq.ChooseRandom(124311, 124319), 0, 0, -705, 510, 125, 192); -- pit an_acolyte_of_Veeshan 
			else
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 65); -- pit hatchling
				eq.spawn2(eq.ChooseRandom(124287, 124285, 124288, 124286), 0, 0, math.random(-782, -695), math.random(468, 555), 123, 127); -- pit hatchling
			end
		end
	},
	[17] = {	-- wave 12
		waveTime = 527000,
		waveFunc = function()
			eq.spawn2(124314, 0, 0, -740, 510, 130, 1); -- Vethrol_the_Skycaller
		end
	},
	[18] = {	-- wave 13
		waveTime = 527000,
		waveFunc = function()
			-- Three templars (flurry drakes) spawn. Deaths trigger carrion drakes. Two of the spawns are in the room on the left and right sides; the third comes from down the bridge.
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -802, 510, 125, 65); -- pit templar
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 0, 0, -679, 509, 125, 192); -- pit templar
			eq.spawn2(eq.ChooseRandom(124307, 124305, 124304, 124306), 42, 0, -740, 816, 125, 127); -- bridge templar
		end
	},
	[19] = {	-- wave 14
		waveTime = 582000,
		waveFunc = function(splitters)
			-- Three drakes (wardens) spawn. Two more drakes spawn each time one dies. Two of the initial spawns are in the room on the left and right sides; the third comes from down the bridge.
			local parent = eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -802, 510, 125, 63):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -802,
				y = 510,
				z = 125,
				splits = 2,
				limit = 2,
				types = 0,
			});
			parent = eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 0, 0, -679, 509, 125, 192):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -679,
				y = 509,
				z = 125,
				splits = 2,
				limit = 2,
				types = 0,
			});
			parent = eq.spawn2(eq.ChooseRandom(124294, 124291, 124289, 124296), 42, 0, -740, 816, 125, 127):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -740,
				y = 816,
				z = 125,
				splits = 2,
				limit = 2,
				types = 0,
				move = true,
			});
		end
	},
	[20] = {	-- wave 15
		waveTime = 583000,
		waveFunc = function(splitters)
			-- Two drakes (wardens) spawn in the ring. When each dies, two more pop, and so on. Wave includes 22 drakes in total, 10 splitting from each original.
			-- pit wardens (340 dmg)
			local parent = eq.spawn2(eq.ChooseRandom(124295, 124290, 124299, 124292, 124293), 0, 0, -698, 510, 123, 192):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -698,
				y = 510,
				z = 123,
				splits = 2,
				limit = 10,
				types = 1,
			});
			parent = eq.spawn2(eq.ChooseRandom(124295, 124290, 124299, 124292, 124293), 0, 0, -779, 510, 123, 65):GetID();
			table.insert(splitters, {
				parent = parent,
				children = {},
				x = -779,
				y = 510,
				z = 123,
				splits = 2,
				limit = 10,
				types = 1,
			});
		end
	},
	[21] = {	-- wave 16
		waveTime = 588000,
		waveFunc = function()
			eq.spawn2(124315, 0, 0, -740, 510, 130, 1); -- The_Herald_of_Vulak`Aerr
		end
	},
	[22] = {	-- wave 17
		waveTime = 7200000,	-- unknown if Vulak has some sort of timer.  Makes sense to have one in case a solo player manages to keep the ring going
		waveFunc = function()
			eq.spawn2(124128, 0, 0, -740, 510, 130, 1); -- #Vulak`Aerr
		end
	},
	[23] = {
		waveTime = 1000,
		waveFunc = function()
			eq.depop(124128); -- #Vulak`Aerr
			EndRingEvent();
		end
	},
};

local ringActive = false;
local victory = false;
local wave = 0;
local clientsInRing = 0;
local invisClientTime = 0;
local orb;
local splitters;

function GlowingOrbEnterEvent(event)
	if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Entered Proximity"); end

	if ( not ringActive ) then
	
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(124000) and not event.other:GetGM() ) then	-- Thylex_of_Veeshan
		
			ringActive = true;
			victory = false;
			wave = 0;
			clientsInRing = 1;
			invisClientTime = 0;
			splitters = {};
		
			eq.depop_with_timer(124000);	-- Thylex_of_Veeshan
		
			eq.spawn2(124316, 0, 0, -760, 960, 128, 128); -- Essence_of_Veeshan
			eq.spawn2(124316, 0, 0, -740, 960, 128, 128); -- Essence_of_Veeshan
			eq.spawn2(124316, 0, 0, -720, 960, 128, 128); -- Essence_of_Veeshan
			
			eq.set_timer("wave", 10000);
			eq.set_timer("proximity", RING_CLIENT_CHECK_TIMER);
			
			if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Ring Event Active"); end
		end
	end
end

function EndRingEvent()
	
	for _, id in ipairs(RING_NPCS) do
		eq.depop_all(id);
	end
	
	if ( not victory ) then
		eq.depop(124128); -- #Vulak`Aerr
		eq.spawn_from_spawn2(354475);		-- Thylex_of_Veeshan's spawn point ID
		if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Respawning Thylex"); end
	end
	
	ringActive = false;

	if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Ring Event Inactive"); end
end

function CountClientsInRing()
	local clientList = eq.get_entity_list():GetClientList();
	local clients = 0;
	local invisibleClients = 0;

	if ( clientList ) then
		for client in clientList.entries do
		
			-- these strictly defined regions are to prevent SoS rogues or FD characters
			-- from hiding in corners to avoid the AoE cast by the orb
			if ( not client:GetGM() and client:GetZ() > 110 and client:GetZ() < 131 and client:GetY() > 435 and client:GetY() < 700) then
			
				if ( 	(client:GetX() > -779 and client:GetX() < -701)
						or
						(client:GetX() > -820 and client:GetX() < -660 and client:GetY() < 595)
				) then
				
					clients = clients + 1;
					if ( client:IsInvisible(orb) or client:GetFeigned() ) then
						invisibleClients = invisibleClients + 1;
					end
				end
			end
		end
	end

	return clients, invisibleClients;
end

function GlowingOrbSpawnEvent(event)
	eq.set_proximity(-820, -660, 435, 700, 110, 131);
	
	ringActive = false;
	orb = event.self;

	if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Orb Spawn Event"); end
end

function GlowingOrbTimerEvent(event)

	if ( not ringActive ) then
		eq.stop_timer("wave");
		eq.stop_timer("proximity");
		eq.stop_timer("end");
		return;
	end

	if ( event.timer == "wave" ) then
		wave = wave + 1;
		if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Beginning Wave "..wave); end
		RING_WAVES[wave].waveFunc(splitters);
		
		if ( RING_DEBUG_MODE ) then
			eq.set_timer("wave", RING_WAVES[wave].waveTime / 10);
		else
			eq.set_timer("wave", RING_WAVES[wave].waveTime);
		end
		
	elseif ( event.timer == "proximity" ) then
		
		local clients, invisClients = CountClientsInRing();
		
		if ( clients == 0 ) then
		
			if ( clientsInRing > 0 ) then
				if ( RING_DEBUG_MODE ) then
					eq.set_timer("end", RING_END_TIMER / 5);
				else
					eq.set_timer("end", RING_END_TIMER);
				end
			end
			if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: No clients in ring"); end
		else
			eq.stop_timer("end");
			
			if ( clients == invisClients and wave > 1 ) then
				event.self:CastSpell(1490, event.self:GetID());		-- Wave of Heat.  What Sony used is unknown.  This fits the best from
																	-- what I can find in the spell data
				invisClientTime = invisClientTime + RING_CLIENT_CHECK_TIMER;
				
				if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: No clients visible"); end
				
				if ( invisClientTime > RING_END_TIMER ) then
					EndRingEvent();		-- shutdown event if client(s) is/are hidden for too long
										-- there are places where Orb AoEs can't hit
				end
			else
				invisClientTime = 0;
			end		
		end
		clientsInRing = clients;
		
	elseif ( event.timer == "end" ) then

		if ( CountClientsInRing() == 0 ) then
			EndRingEvent();
		else
			eq.stop_timer("end");
			eq.set_timer("proximity", RING_CLIENT_CHECK_TIMER);
			if ( RING_DEBUG_MODE ) then eq.zone_emote(7,"<ZONE MESSAGE>: Clients in ring; 3 minute timer ended"); end
		end	
	end
end

function VortexOfManaSpawnEvent(event)

	if ( wave == 2 ) then
		event.self:CastSpell(2090, event.self:GetID());		-- Greater Mana Surge
	
	elseif ( wave == 5 ) then
		event.self:CastSpell(2087, event.self:GetID());		-- Greater Infusion
	
	else
		event.self:CastSpell(2093, event.self:GetID());		-- Greater Rejuvenation
	end
	
	eq.depop(event.self:GetNPCTypeID());
end

function BossDeathEvent(event)
	eq.spawn2(124317, 0, 0, -740, 543, 130, 127); -- a vortex of mana
end

function SlayEvent(event)

	if ( wave == 7 or wave == 12 or wave == 15 or wave == 18 ) then
		
		if ( event.self:GetID() == 0 or event.self:GetID() == event.other:GetID()) then
			return;
		end
		eq.spawn2(124310, 0, 0, event.other:GetX(), event.other:GetY(), event.other:GetZ() + 5, 1); -- a_carrion_drake 
	end
end

function SplitDrakeDeathEvent(event)

	local npcType, t, grid;
	local depth = 1;

	for _, v in ipairs(splitters) do
		if ( v.parent == event.self:GetID() ) then
			t = v;
			break;
		end
	end

	if ( not t ) then
		for j, v in ipairs(splitters) do

			for i, childTable in ipairs(v.children) do
				if ( childTable.spawnId == event.self:GetID() ) then
					t = v;
					depth = childTable.depth;
					if ( depth > 3 ) then
						return
					end
					break;
				end
			end
		end
	end
	
	if ( not t ) then
		return;
	end

	for i = 1, t.splits do
	
		grid = 0;
	
		if ( #t.children < t.limit ) then

			if ( t.types == 1 ) then
				npcType = eq.ChooseRandom(124295, 124290, 124299, 124292, 124293);	-- warden 340 dmg
			else
				npcType = eq.ChooseRandom(124294, 124291, 124289, 124296);		-- warden 400 dmg
			end
			
			if ( t.move ) then
				grid = 42;
			end
		
			table.insert(t.children, {
				spawnId = eq.spawn2(npcType, grid, 0, t.x or event.self:GetX(), t.y or event.self:GetY(), t.z or event.self:GetZ() + 1, math.random(255)):GetID(),
				depth = depth + 1,
				}
			);
		end
		
		if ( depth > 2 ) then
			return
		end
	end	
end

function VulakDeathEvent(event)
	victory = true;
	EndRingEvent();
end

function event_encounter_load(e)
	-- #A_Glowing_Orb
	eq.register_npc_event("VulakRing", Event.spawn, 124125, GlowingOrbSpawnEvent);
	eq.register_npc_event("VulakRing", Event.enter, 124125, GlowingOrbEnterEvent);
	eq.register_npc_event("VulakRing", Event.timer, 124125, GlowingOrbTimerEvent);
	
	-- ensure GlowingOrbSpawnEvent() executes
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(124125) ) then
		eq.depop_with_timer(124125);
	end

	eq.register_npc_event("VulakRing", Event.spawn, 124317, VortexOfManaSpawnEvent);	-- a vortex of mana
	
	eq.register_npc_event("VulakRing", Event.death, 124312, BossDeathEvent);	-- Zruk_the_Lifestealer
	eq.register_npc_event("VulakRing", Event.death, 124313, BossDeathEvent);	-- Rarthek_the_Swiftclaw
	eq.register_npc_event("VulakRing", Event.death, 124314, BossDeathEvent);	-- Vethrol_the_Skycaller
	eq.register_npc_event("VulakRing", Event.death, 124315, BossDeathEvent);	-- The_Herald_of_Vulak`Aerr

	eq.register_npc_event("VulakRing", Event.death, 124295, SplitDrakeDeathEvent);	-- an_onyx_warden 340 dmg
	eq.register_npc_event("VulakRing", Event.death, 124290, SplitDrakeDeathEvent);	-- a_jade_warden 340 dmg
	eq.register_npc_event("VulakRing", Event.death, 124299, SplitDrakeDeathEvent);	-- a_crimson_warden 340 dmg
	eq.register_npc_event("VulakRing", Event.death, 124292, SplitDrakeDeathEvent);	-- a_cerulean_warden 340 dmg war
	eq.register_npc_event("VulakRing", Event.death, 124293, SplitDrakeDeathEvent);	-- a_cerulean_warden 340 dmg cleric

	eq.register_npc_event("VulakRing", Event.death, 124294, SplitDrakeDeathEvent);	-- an_onyx_warden 400dmg
	eq.register_npc_event("VulakRing", Event.death, 124291, SplitDrakeDeathEvent);	-- a_cerulean_warden 400dmg war
	eq.register_npc_event("VulakRing", Event.death, 124289, SplitDrakeDeathEvent);	-- a_jade_warden 400 dmg
	eq.register_npc_event("VulakRing", Event.death, 124296, SplitDrakeDeathEvent);	-- a_molten_warden 400 dmg

	eq.register_npc_event("VulakRing", Event.death, 124128, VulakDeathEvent);	-- #Vulak`Aerr

	for _, id in ipairs(RING_NPCS) do
		eq.register_npc_event("VulakRing", Event.slay, id, SlayEvent);
	end
end
