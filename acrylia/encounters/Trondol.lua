local	soulstealer = nil;
local	grimling1 = nil;
local	grimling2 = nil;
local	grimling3 = nil;
local	grimling4 = nil;
local	grimling5 = nil;
local	grimling6 = nil;
local	grimling7 = nil;
local	grimling8 = nil;
local	march = 0;
local	chant = 0;

function TrondolTrade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6554}, 0)) then -- Grimling Shackle Key
		e.self:Say("I am too weak to make an escape, I warned you not to bother with me. I'll do my best, but I fear it is all in vain...");
		eq.spawn2(154346,0,0,-191,-703,2,99);
		eq.spawn2(154346,0,0,-219,-709,2,68);
		eq.spawn2(154346,0,0,-186,-730,2,231);
		eq.spawn2(154031,10,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)	
end

function TrondolWaypoint(e)
	if(e.wp == 4) then
		eq.signal(154039,1);
		e.self:SetAppearance(3);
	end
end

function Trondol2Trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 6711}, 0)) then -- Grimling Soulgem
		e.self:Say("I ... I don't know what to say. I owe you my life. I will tell the king, and all who will listen, what you have done for me. Take these shackles that they may know it was truly you who have plucked me from an eternity of slavery.");
		e.other:QuestReward(e.self,0,0,0,0,6513,5000); -- Shackles of a Vah Shir Captive
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function TronSignal(e)
	if(e.signal == 1) then
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(154031)) then
			eq.get_entity_list():GetMobByNpcTypeID(154031):Say("I cannot take another step, my spirit is fading... Save yourselves. You will have my eternal gratitude for your noble efforts.");
		end
		eq.set_timer("march",5000);
		eq.set_timer("chant",45000);
	end
end

function TronTimer(e)
	if(e.timer == "march") then
		march = march + 1;
		if(march == 1) then
			soulstealer = eq.spawn2(154036,0,0,-38,-271,-29,128);
		elseif(march == 2) then
			soulstealer:CastToNPC():MoveTo(-40,-330,-31,128,true);
			grimling4 = eq.spawn2(154033,0,0,-13,-243,-31,131);
		elseif(march == 3) then
			grimling4:CastToNPC():MoveTo(-30,-330,-31,128,true);
			grimling7 = eq.spawn2(154034,0,0,-136,-385,-31,62);
		elseif(march == 4) then
			grimling7:CastToNPC():MoveTo(-90,-375,-31,64,true);
			grimling2 = eq.spawn2(154034,0,0,20,-260,-31,133);
		elseif(march == 5) then
			grimling2:CastToNPC():MoveTo(8,-375,-31,194,true);
			grimling5 = eq.spawn2(154038,0,0,-130,-259,-31,91);
		elseif(march == 6) then
			grimling5:CastToNPC():MoveTo(-50,-330,-31,128,true);
			grimling8 = eq.spawn2(154035,0,0,-183,-384,-31,66);
		elseif(march == 7) then
			grimling8:CastToNPC():MoveTo(-90,-385,-31,64,true);
			grimling1 = eq.spawn2(154032,0,0,77,-332,-31,175);
		elseif(march == 8) then
			grimling1:CastToNPC():MoveTo(8,-385,-31,194,true);
			grimling6 = eq.spawn2(154037,0,0,-134,-326,-31,70);
		elseif(march == 9) then
			grimling6:CastToNPC():MoveTo(-90,-365,-31,64,true);
			grimling3 = eq.spawn2(154035,0,0,1,-199,-31,127);
		elseif(march == 10) then
			grimling3:CastToNPC():MoveTo(8,-365,-31,194,true);
			eq.stop_timer("march");
			march = 0;
		end
	elseif(e.timer == "chant") then
		chant = chant + 1;
		if(chant == 1) then
			soulstealer:CastToNPC():Emote("laughs, 'You think you run away? You not leave without spirit... I have spirit. You stay forever!");
		elseif(chant == 2) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(154031)) then
				eq.get_entity_list():GetMobByNpcTypeID(154031):Emote("gasps, 'Noo! I'd rather die than serve your evil master. Friends, do not risk sharing my fate! Run!");
			end
		elseif(chant == 3) then
			soulstealer:CastToNPC():Emote("draws his weapon, 'No one leaves! You all die for the power of the master!'");
		elseif(chant == 4) then
			soulstealer:CastToNPC():Shout("Attack!");
			GrimlingAttack(e);
		elseif(chant == 5) then
			eq.depop(154031);
			eq.stop_timer("chant");
			chant = 0;
		end
	end
end

function GrimlingAttack(e)
	eq.spawn2(154024,11,0,-40,-330,-31,128);
	eq.depop(154036);
	eq.spawn2(154028,11,0,8,-385,-31,194);
	eq.depop(154032);
	eq.spawn2(154026,11,0,8,-375,-31,194);
	eq.spawn2(154026,11,0,-90,-375,-31,64);
	eq.depop_all(154034);
	eq.spawn2(154025,11,0,8,-365,-31,194);
	eq.spawn2(154025,11,0,-90,-385,-31,64);
	eq.depop_all(154035);
	eq.spawn2(154027,11,0,-30,-330,-31,128);
	eq.depop(154033);
	eq.spawn2(154030,11,0,-50,-330,-31,128);
	eq.depop(154038);
	eq.spawn2(154029,11,0,-90,-365,-31,64);
	eq.depop(154037);
end

function event_encounter_load(e)
	eq.register_npc_event("Trondol", Event.trade, 154125, TrondolTrade);
	eq.register_npc_event("Trondol", Event.trade, 154031, Trondol2Trade);
	eq.register_npc_event("Trondol", Event.waypoint_arrive, 154031, TrondolWaypoint);
	eq.register_npc_event("Trondol", Event.signal, 154039, TronSignal);
	eq.register_npc_event("Trondol", Event.timer, 154039, TronTimer);
end
