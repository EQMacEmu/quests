local factionId = 0;

function event_say(e)
	if ( e.message:findi("hail") ) then
		e.self:Say("I have no desire to speak with anyone. That includes you!");
	end
end

function event_combat(e)
	if ( not e.joined and factionId ~= 0 ) then
		e.self:CastToNPC():SetNPCFactionID(factionId);		-- restore faction if Plnorrick doesn't kill
	end
end


function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if ( e.signal == 1 ) then
		-- This NPC text is not precise.  It was put together from these alla comments:
		-- http://everquest.allakhazam.com/db/npc.html?id=985#m107866514287264
		-- http://everquest.allakhazam.com/db/npc.html?id=896#m107866603072607
		-- I just really wanted this bar fight in, which does happen
		e.self:Say("Go ahead and unite, fools. It will make it easier for the Teir'Dal to conquer you.");
		eq.signal(10163, 10);	-- Plnorrick_Spinecracker
	elseif ( e.signal == 2 ) then
		e.self:Say("Those halfwit ogres make good pets. If they are housebroken.");
		turn = true;
	elseif ( e.signal == 4 ) then
		e.self:Say("The Teir'Dal cower to no one. We are the only true force to be reckoned with.");
		turn = true;
	elseif ( e.signal == 5 ) then
		e.self:Say("There are no greater circles of magic than those of the Teir'Dal.");
		turn = true;
	elseif ( e.signal == 7 ) then
		e.self:Say("Let Sir Lucan D'Lere seek glory while we Teir'Dal seek great destiny.");
		turn = true;
	elseif ( e.signal == 10 ) then
		factionId = e.self:CastToNPC():GetNPCFactionID();
		e.self:CastToNPC():SetNPCFactionID(0);		-- remove faction to prevent NPCs from assisting	
	end
	
	if ( turn ) then
		bard = eq.get_entity_list():GetMobByNpcTypeID(10141);			-- NPC: Trolon_Lightleer
		if ( not bard.valid ) then
			bard = eq.get_entity_list():GetMobByNpcTypeID(10158);		-- NPC: Branis_Noolright
		end
		if ( not bard.valid ) then 
			bard = eq.get_entity_list():GetMobByNpcTypeID(10165);		-- NPC: Palana_Willin
		end
		if ( bard.valid ) then
			e.self:FaceTarget(bard);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end