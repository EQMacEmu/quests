local EENOT_SPAWN_LOCS = {
	{ 898, -137, 108 },
	{ 500, -645, 27 },
	{ 1972, -800, 309 },
	{ 2024, -118, 297 },
	{ 2977, -479, 389 },
	{ 3464, -833, 511 },
	{ 4184, -745, 548 }
}

local REGGIT_SPAWN_LOCS = {
	{ 4206, -440, 502 },
	{ 4086, -589, 490 },
	{ 3637, -545, 442 },
	{ 2684, -739, 417 },
	{ 2269, -613, 269 },
	{ 2002, -732, 287 },
	{ 979, -592, 215 },
	{ 783, -547, 142 },
}

local KOBB_SPAWN_LOCS = {
	{ 876, -58, 98 },
	{ 2927, 886, 346 },
	{ 1861, 315, 216 },
	{ 666, 944, 56 },
	{ 1047, 1366, 118 },
	{ 2117, 1265, 255 },
	{ 2514, 1704, 307 },
	{ 1131, 1632, 211 },
	{ 542, 1713, 57 },
	{ 1255, 505, 142 }
}

function event_say(e)
	if(e.other:GetFactionValue(e.self) < 0) then
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	elseif(e.other:GetFactionValue(e.self) < 100) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	elseif(e.other:GetFactionValue(e.self) >= 100) then
		if(e.message:findi("hail")) then
			e.self:Say("It is good to finally meet one who respects the disciplines of the Ashen Order.  All I have met are rangers.  They have interfered with my [mission in the woods].");
		elseif(e.message:findi("mission in the wood")) then
			e.self:Say("I have come here to avenge my family.  One season past, they were attacked by a trio of deadly tigers.  I came here to hunt the beasts down, but then I found the local rangers and residents here protect the tigers.  They seem to be legends in these parts.  The tigers even have name's!!  They call them Eenot, Reggit and Kobb.  I wish I had help from a [fellow monk].");
		elseif(e.message:findi("fellow monk")) then
			e.self:Say("Good!! The rangers are watching me so you must go alone.  I can only wait until the morning, then I must go.  If you find all three tigers, return their pelts to me and I shall reward you with something discovered for monks only.");
			TigerSpawns(e);
		elseif(e.message:findi("treant fist")) then
			e.self:Say("The treant fists were created by great craftsmen.  They are for the fists of a monk and offer greater dexterity and increase the durability of one's soul.  My last pair were given to Master Puab of the Ashen House training grounds.");
			eq.depop_with_timer();
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I asked you to hunt down all three of the tigers.";
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12341, item2 = 12342, item3 = 12343},1,text)) then
		e.self:Say("Good work.  I hope you had no run ins with the local rangers.  Here is my reward.  An object from the past which I found in my journeys.  Wish that I could reward you also with [treant fists].");
		e.other:Faction(e.self,361,10); -- Ashen Order Faction ID-361
		e.other:Faction(e.self,281,1); -- Knights of Truth Faction ID-281
		e.other:Faction(e.self,309,1); -- Silent Fist Clan Faction ID-309
		e.other:QuestReward(e.self,0,0,0,0,12367); -- Collar of Neshika ID-12367
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function TigerSpawns(e)
	local eenot_loc = EENOT_SPAWN_LOCS[math.random(1, #EENOT_SPAWN_LOCS)];
	local reggit_loc = REGGIT_SPAWN_LOCS[math.random(1, #REGGIT_SPAWN_LOCS)];
	local kobb_loc = KOBB_SPAWN_LOCS[math.random(1, #KOBB_SPAWN_LOCS)];
	
	eq.unique_spawn(20276, 0, 0, eenot_loc[1], eenot_loc[2], eenot_loc[3]); -- Spawn Eenot
	eq.unique_spawn(20277, 10, 0, reggit_loc[1], reggit_loc[2], reggit_loc[3]); -- Spawn Reggit
	eq.unique_spawn(20000, 11, 0, kobb_loc[1], kobb_loc[2], kobb_loc[3]); -- Spawn Kobb
end