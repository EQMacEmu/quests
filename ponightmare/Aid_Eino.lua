local BANSHEE_TYPE = 204015; -- a_tortured_banshee
local NIGHTSTALKER_TYPE = 204019; -- a_nightstalker
local HOBGOBLIN_TYPE = 204011; -- a_hobgoblin
local TREMULOUS_BAT_TYPE = 204030; -- a_tremulous_bat
local TERROR_BAT_TYPE = 204042; -- a_terror_bat
local TORMENT_BAT_TYPE = 204031; -- a_torment_bat 
local DREAMKEEPER_TYPE = 204480; -- The_Dreamkeeper

local INVIS_MAN_SPAWNPOINTID = 345856;

local escortDone = false;

function event_spawn(e)
	e.self:Emote("steps from the shadows 'I am glad you were able to come help me, this is quite a dangerous realm!  We must tread carefully if we are to find the item Kerasha desires from this vile place.  Sometimes I worry her research with the magic of the land puts her in much danger.  Let us be off and find that which she desires.'");
	eq.set_timer("setrespawn", 1000);
	escortDone = false;
end

function event_timer(e)
	if ( e.timer == "setrespawn" ) then
		eq.stop_timer("setrespawn");
		eq.get_entity_list():GetSpawnByID(INVIS_MAN_SPAWNPOINTID):SetTimer(2160000);
	elseif ( e.timer == "depop" ) then
		eq.depop();
	end
end

function event_waypoint_arrive(e)
	
	if ( e.wp == 2 ) then
		e.self:Say("Vile Beasts!  Our presence has been detected!  Let not their dreams of evil sway you!");
		eq.spawn2(BANSHEE_TYPE, 0, 0, 992, -1083, 213, 106);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 1053, -1147, 216, 216);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 971, -1124, 212, 60);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 1071, -1101, 215, 179);
		
	elseif ( e.wp == 3 ) then
		e.self:Say("Even in my home I always hated werewolves, I fear you not vile fiends!");
		eq.spawn2(NIGHTSTALKER_TYPE, 0, 0, 586, -1625, 209.664, 172);
		eq.spawn2(NIGHTSTALKER_TYPE, 0, 0, 532, -1583, 208, 123);
	
	elseif ( e.wp == 4 ) then
		e.self:Say("Have you ever had a dream where you were being chased and could not run?  This place is the source of such nightmares.  Break those blocks and defend yourself!");
		eq.spawn2(HOBGOBLIN_TYPE, 0, 0, 524, -611, 213, 98);
		eq.spawn2(HOBGOBLIN_TYPE, 0, 0, 505, -674, 213, 53);
		eq.spawn2(HOBGOBLIN_TYPE, 0, 0, 552, -722, 211, 8);
		eq.spawn2(HOBGOBLIN_TYPE, 0, 0, 624, -694, 212, 214);
		eq.spawn2(HOBGOBLIN_TYPE, 0, 0, 589, -631, 217, 157);
	
	elseif ( e.wp == 6 ) then
		e.self:Say("Something knows we hunt it!  Cast your trepidations aside and defeat this evil!  Fear us Keeper, we have come for you!");
		eq.spawn2(BANSHEE_TYPE, 0, 0, 492, 659, 212, 56);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 576, 597, 212, 7);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 677, 652, 215, 202);
		eq.spawn2(BANSHEE_TYPE, 0, 0, 604, 767, 211, 134);
		eq.spawn2(eq.ChooseRandom(TREMULOUS_BAT_TYPE, TREMULOUS_BAT_TYPE, TERROR_BAT_TYPE, TORMENT_BAT_TYPE), 0, 0, 527, 610, 213, 31);
		eq.spawn2(eq.ChooseRandom(TREMULOUS_BAT_TYPE, TREMULOUS_BAT_TYPE, TERROR_BAT_TYPE, TORMENT_BAT_TYPE), 0, 0, 627, 602, 214, 236);
		eq.spawn2(eq.ChooseRandom(TREMULOUS_BAT_TYPE, TREMULOUS_BAT_TYPE, TERROR_BAT_TYPE, TORMENT_BAT_TYPE), 0, 0, 650, 732, 210, 161);
		eq.spawn2(eq.ChooseRandom(TREMULOUS_BAT_TYPE, TREMULOUS_BAT_TYPE, TERROR_BAT_TYPE, TORMENT_BAT_TYPE), 0, 0, 538, 719, 209, 91);
		
	elseif ( e.wp == 7 ) then
		e.self:SetAppearance(1); -- sit

	elseif ( e.wp == 8 ) then
		e.self:Say("The fiend shows itself!  Spew your vile dreams no longer!  Dispatch it!");
		local mob = eq.unique_spawn(DREAMKEEPER_TYPE, 0, 0, 578, 717, 205, 129);
	
	elseif ( e.wp == 10 ) then
		e.self:Say("Hand me the strand from the beast.  Quellious knows what Kerasha wants with such a thing.");
		eq.set_timer("depop", 1800000);
		escortDone = true;
	end
end

function event_waypoint_depart(e)
	if ( e.wp == 2 ) then
		e.self:Say("Now that our presence here is discovered we cannot delay. Rest when you can.");
	elseif ( e.wp == 3 or e.wp == 4 ) then
		e.self:Say("Now that you are rested, follow my steps, may Quellious guard us!");
	elseif ( e.wp == 6 ) then
		e.self:Say("Excellent rest up for a few moments, rally your strength as I meditate on a teaching of Quellious.");
	elseif ( e.wp == 8 ) then
		e.self:Emote("holds his bleeding side. 'That beast was quite vicious. Quickly! Let us make our way to the portal. I must seek the healers of tranquility to stanch the bleeding of this wound.  Give me a moment to gather my strength.'");
	elseif ( e.wp == 9 ) then
		e.self:Emote("gathers his strength and limps forward. 'Follow my steps to the portal!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if ( escortDone and item_lib.check_turn_in(e.self, e.trade, {item1 = 16261}, 0) ) then -- Strand of Nightmare
		e.self:Say("Excellent!  You and your companions have served me well, take my mark as a symbol of trust.  The Council may smile more favorably upon you now.  May Quellious watch over you!");
		e.other:QuestReward(e.self, 0, 0, 0, 0, 16260, 100000); -- Tiny Gold Fist
		eq.depop();
	end

	item_lib.return_items(e.self, e.other, e.trade);
end
