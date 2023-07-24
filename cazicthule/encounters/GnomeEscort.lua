local STOP_TEXT = {
	"Now this looks like a mask!  Give me a moment to draw this thing in my journal.  It will only take a second. I'm a genius you know, though my job is very difficult.",
	"My map is paying off.  This mask is just where they said it would be.  Just give me a minute to scribble this down and we'll continue.  Please continue to scan the room.  I'll feel much better if you're eaten first... err... if you watch my back.",
	"Oh joy, there's nothing down this hallway.  That will teach me to follow you again.  Let me look at my map and see if I can undo your handy work.  One moment please. Shheeesh!",
	"Well, that was a nice little trek.  Take a breather while I note this area in my journal.  I know that you must be tired.  I haven't seen a head as large as yours in quite some time.  Lean it against the wall or something.  We'll need to leave in a moment.",
	"You're doing a great job!  I'll just need a moment to make a few notes.  Feel free to stand there and defend me with your life.  Really, I don't mind the attention.  If you see a monster, just yell.  I'll be right behind you.",
	"Well look at this thing!  A splendid example of a Tae Ew sacrificial death mask or something.  At first glance, this thing looked like beautifully carved wood, but alas it is just skin.",
	"Well, here we are.  See, you didn't even have to break a sweat.  I'm all ready to... hmm... wait, I seem to have dropped my favorite quill.  Did you pick it up by chance?  I'll add a little something to your payment if you did.",
};

-- H1-H2-H4-H3-H5-C
-- H1-C-H2-H3-H4-H5
-- H1-C-H2-H4-H3-H5
local ROUTES = {
	{ 1, 2, 5, 8, 7, 10, 13 },
	{ 1, 3, 12, 4, 6, 9, 11 },
	{ 1, 3, 12, 5, 8, 7, 11 },
};
local GRIDS = {
	[1] = {			-- pyramid to H1
		g = 81,
		endWp = 17,
		stopText = 1,
		ambush = 1,
	},
	[2] = {			-- H1 to H2
		g = 82,
		endWp = 24,
		stopText = 2,
		ambush = 2,
	},
	[3] = {			-- H1 to C
		g = 83,
		endWp = 15,
		stopText = 6,
		ambush = 6,
	},
	[4] = {			-- H2 to H3
		g = 84,
		endWp = 22,
		stopText = 3,
		ambush = 3,
	},
	[5] = {			-- H2 to H4
		g = 85,
		endWp = 34,
		stopText = 4,
		ambush = 4,
	},
	[6] = {			-- H3 to H4
		g = 86,
		endWp = 30,
		stopText = 4,
		ambush = 4,
	},
	[7] = {			-- H3 to H5
		g = 87,
		endWp = 30,
		stopText = 5,
		ambush = 5,
	},
	[8] = {			-- H4 to H3
		g = 88,
		endWp = 23,
		stopText = 3,
		ambush = 3,
	},
	[9] = {			-- H4 to H5
		g = 89,
		endWp = 11,
		stopText = 5,
		ambush = 5,
	},
	[10] = {		-- H5 to C
		g = 90,
		endWp = 29,
		stopText = 6,
		ambush = 6,
	},
	[11] = {		-- H5 to pyramid
		g = 91,
		endWp = 18,
		stopText = 7,
	},
	[12] = {		-- C to H2
		g = 92,
		endWp = 6,
		stopText = 2,
		ambush = 2,
	},
	[13] = {		-- C to pyramid
		g = 93,
		endWp = 13,
		stopText = 7,
	},
};
local AMBUSHES = {
	{ x = -440, y = 27,  z = 3,   g = 94 },
	{ x = -374, y = -5,  z = 3,   g = 95 },
	{ x = -237, y = -37, z = 3,   g = 96 },
	{ x = -91,  y = 329, z = 3.7, g = 97 },
	{ x = -251, y = 536, z = 3,   g = 98 },
	{ x = -400, y = 62,  z = 4.3, g = 0 },
};
local BROWN1_TYPE = 48382;
local BROWN2_TYPE = 48401;
local GREEN1_TYPE = 48379;
local GREEN2_TYPE = 48400;
local TRACKER_TYPE = 48383;
local LIZARD_TYPES = { BROWN1_TYPE, BROWN2_TYPE, GREEN1_TYPE, GREEN2_TYPE, TRACKER_TYPE };
local GNOME_TYPE = 48402;
local PAUSE_TIMER = 118000;

local route, segment, spawnedTracker, eventComplete;

function GnomeSpawn(e)
	e.self:Say("Well look at you! You see, you're off to a great start!  Now, just follow me and yell out if something stabs you or maims you in anyway.  Never fear, I've memorized gate and have complete confidence in your ability to fend off danger for at least five seconds.  Follow me... follow me.");
	route = math.random(1, #ROUTES);
	segment = 1;
	spawnedTracker = false;
	eventComplete = false;
	e.self:AssignWaypoints(GRIDS[ROUTES[route][segment]].g);
end

function GnomeWaypointArrive(e)
	if ( e.wp == GRIDS[ROUTES[route][segment]].endWp ) then
	
		e.self:Say(STOP_TEXT[GRIDS[ROUTES[route][segment]].stopText]);
		
		if ( segment == 7 ) then
			-- escort ended
			eventComplete = true;
			eq.set_timer("depop", 1800000);
		else
			eq.set_timer("pause", PAUSE_TIMER);

			local ambushType = math.random(1, 4);
			local ambush = AMBUSHES[GRIDS[ROUTES[route][segment]].ambush];

			if ( ambushType == 1 ) then
				eq.spawn2(BROWN1_TYPE, ambush.g, 0, ambush.x, ambush.y, ambush.z, 0);
				if ( math.random(100) > 50 ) then
					eq.spawn2(BROWN1_TYPE, ambush.g, 0, ambush.x, ambush.y, ambush.z, 0);
				end
			elseif ( ambushType == 2 ) then
				eq.spawn2(BROWN2_TYPE, ambush.g, 0, ambush.x, ambush.y, ambush.z, 0);
				if ( math.random(100) > 50 ) then
					eq.spawn2(BROWN2_TYPE, ambush.g, 0, ambush.x, ambush.y, ambush.z, 0);
				end
			elseif ( ambushType == 3 ) then
				local num = math.random(5, 6);
				for i = 1, num do
					eq.spawn2(GREEN1_TYPE, ambush.g, 0, ambush.x + math.random(-2, 2), ambush.y + math.random(-2, 2), ambush.z + math.random(-2, 2), 0);
				end
			elseif ( ambushType == 4 ) then
				local num = math.random(3, 4);
				for i = 1, num do
					eq.spawn2(GREEN2_TYPE, ambush.g, 0, ambush.x + math.random(-2, 2), ambush.y + math.random(-2, 2), ambush.z + math.random(-2, 2), 0);
				end
			end
		end
	end
end

function GnomeTimer(e)
	if ( e.timer == "pause" ) then
		e.self:Say("Alrighty, off we go!");

		if ( segment == 6 and not spawnedTracker ) then
			e.self:Say("Ack ack ack! Eat them not me!");
			eq.spawn2(TRACKER_TYPE, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
			spawnedTracker = true;
			eq.set_timer("pause", PAUSE_TIMER);
			return;
		end
		segment = segment + 1;
		e.self:AssignWaypoints(GRIDS[ROUTES[route][segment]].g);
		eq.stop_timer("pause");
		
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function GnomeTrade(e)
	local item_lib = require("items");
	
	if ( eventComplete and item_lib.check_turn_in(e.self, e.trade, {item1 = 8723}, 0) ) then -- A Tiny Metal Quill
		e.self:Emote("begins to cast a spell.  Gimlik says, 'Well, you've got a good eye on you for being so daft.  Thank you for returning my quill. Take care!'  Gimlik gates.");
		-- Tiny Gear Shaped Earring, Rough Steel Cog Earring, Iron Cog Earring, Shiny Cog Earring, Cogboggle's Clockwork Contraption
		e.other:QuestReward(e.self, 0, 0, 0, 0, eq.ChooseRandom(8726, 8727, 8728, 8729, 8730));
		e.other:GiveCash(0, 0, 0, math.random(2, 7) * 5);
		eq.depop();
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

function LizardSpawn(e)
	eq.set_timer("depop", 600000);
end

function LizardTimer(e)
	eq.depop();
end

function LizardCombat(e)
	if ( e.joined ) then
		eq.pause_timer("depop");
	else
		eq.resume_timer("depop");
	end
end

function event_encounter_load(e)
	eq.register_npc_event("GnomeEscort", Event.waypoint_arrive, GNOME_TYPE, GnomeWaypointArrive);
	eq.register_npc_event("GnomeEscort", Event.spawn, GNOME_TYPE, GnomeSpawn);
	eq.register_npc_event("GnomeEscort", Event.timer, GNOME_TYPE, GnomeTimer);
	eq.register_npc_event("GnomeEscort", Event.trade, GNOME_TYPE, GnomeTrade);

	for _, typeId in ipairs(LIZARD_TYPES) do
		eq.register_npc_event("GnomeEscort", Event.spawn, typeId, LizardSpawn);
		eq.register_npc_event("GnomeEscort", Event.timer, typeId, LizardTimer);
		eq.register_npc_event("GnomeEscort", Event.combat, typeId, LizardCombat);
	end
end
