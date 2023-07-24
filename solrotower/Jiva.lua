local TYPES = { 212404, 212399, 212403, 212406, 212405, 212400, 212401, 212402 };
local LOCS = {
	{ -2255, -338, -1089.787 },
	{ -2304, -312, -1097 },
	{ -2328, -263, -1089.62 },
	{ -2302, -214, -1089.574 },
	{ -2255, -192, -1089.62 },
	{ -2206, -216, -1097 },
	{ -2183, -264, -1089.703 },
	{ -2204, -314, -1090.085 },
};
local SAYS = {
	"Makin, come to my aid!",
	"Adeel, I require your assistance!",
	"Jiri, lend me your help!",
	"Seif, to my side!",
	"Nabil, come to my aid!",
	"Aydin, your knowledge of the arcane is needed!",
	"Cemal, enchanted ones, I need your help!",
	"Fahim, your control over the elements is needed!",
};

local add = 0;
	
function event_death_complete(e)
	eq.spawn2(212412, 0, 0, -2126, 105, -1100, 0);	-- a_flaming_cauldron
	eq.spawn2(212417, 0, 0, -2211, -790, -1094, 128);	-- a_warder_of_Jiva
	eq.spawn2(212417, 0, 0, -2255, -790, -1094, 128);
	eq.spawn2(212417, 0, 0, -2301, -790, -1094, 128);
end

function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("adds", 45000);
		add = 0;
	else
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if ( e.timer == "adds" ) then
		add = add + 1;
		if ( add > #TYPES ) then
			add = 1;
		end
		eq.spawn2(TYPES[add], 0, 0, LOCS[add][1], LOCS[add][2], LOCS[add][3], 0);
		e.self:Say(SAYS[add]);
	end
end
