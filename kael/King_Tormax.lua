-- Gauntlets of Dragon Slaying
-- Belt of Dwarf Slaying

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". You know who I am, but I only vaguely know of you. My purpose is simple, I will rule these lands like my father, and my grandfather before him. All tasks but two are inconsequential to me.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You may have proven yourself worthy to serve the Kromzek, " .. e.other:GetCleanName() .. ", but you have yet to earn my trust.");		
		else
			e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
		end
	elseif(e.message:findi("task")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The tasks are simple, " .. e.other:Race() .. ". I wish the death of the other 'powers' of this frozen waste land. If you are able to destroy either of my mortal foes, bring me proof of your exploits and you will be known as the hero of Kael Drakkel.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You may have proven yourself worthy to serve the Kromzek, " .. e.other:GetCleanName() .. ", but you have yet to earn my trust.");		
		else
			e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
		end
	elseif(e.message:findi("power")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("laughs deeply. 'I speak of the foolish old dragon Yelinak and that pitiful Dain Frostreaver.'");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You may have proven yourself worthy to serve the Kromzek, " .. e.other:GetCleanName() .. ", but you have yet to earn my trust.");		
		else
			e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
		end
	elseif(e.message:findi("yelinak")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yelinak's mate was slain by my ancestor Porlos single-handedly.  Since that time, the great beast has stalked my line.  Unable to slay any of us...");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You may have proven yourself worthy to serve the Kromzek, " .. e.other:GetCleanName() .. ", but you have yet to earn my trust.");		
		else
			e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
		end
	elseif(e.message:findi("dain")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Dain Frostreaver is the leader of the disgusting Coldain.  Some day they will be cleansed from this holy land.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You may have proven yourself worthy to serve the Kromzek, " .. e.other:GetCleanName() .. ", but you have yet to earn my trust.");		
		else
			e.self:Say("Why do I even suffer such lesser beings in my presence? Remove yourself, " .. e.other:Race() .. ", else I'll have my guards relieve you of your head.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30501}, 0)) then -- Dain head
		if(e.other:GetFaction(e.self) < 8) then
			e.other:Faction(e.self,429,500); -- Faction: King Tormax
			e.other:Faction(e.self,448,500); -- Faction: Kromzek
			e.other:Faction(e.self,436,-250); -- Faction: Yelinak
			e.other:Faction(e.self,405,-250); -- Faction: Dain Frostreaver IV
			e.other:QuestReward(e.self,0,0,0,0,25858,500000);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 24984}, 0)) then -- Yelinak head
		if(e.other:GetFaction(e.self) < 8) then
			e.other:Faction(e.self,429,500); -- Faction: King Tormax
			e.other:Faction(e.self,448,500); -- Faction: Kromzek
			e.other:Faction(e.self,436,-250); -- Faction: Yelinak
			e.other:Faction(e.self,405,-250); -- Faction: Dain Frostreaver IV
			e.other:QuestReward(e.self,0,0,0,0,25857,500000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_combat(e)

	if (e.joined) then
		eq.set_timer("help", 300000);
		help_tormax(e);
	else
		eq.stop_timer("help");
	end

end

function event_timer(e)
	if(e.timer == "help") then
		e.self:Shout("King Tormax shouts 'Those who raise arms against me will suffer my wrath!'");
		help_tormax(e);
	end
end


function help_tormax(e)
	local kyenka = eq.get_entity_list():GetMobByNpcTypeID(113133);
	
	if (kyenka.valid and not kyenka:IsEngaged()) then
		kyenka:CastToNPC():SetRunning(true);
		kyenka:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local yetarr = eq.get_entity_list():GetMobByNpcTypeID(113247);
	
	if (yetarr.valid and not yetarr:IsEngaged()) then
		yetarr:CastToNPC():SetRunning(true);
		yetarr:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
	
	local vkjen = eq.get_entity_list():GetMobByNpcTypeID(113036);
	
	if (vkjen.valid and not vkjen:IsEngaged()) then
		vkjen:CastToNPC():SetRunning(true);
		vkjen:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local klraggek = eq.get_entity_list():GetMobByNpcTypeID(113098);
	
	if (klraggek.valid and not klraggek:IsEngaged()) then
		klraggek:CastToNPC():SetRunning(true);
		klraggek:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local drendar = eq.get_entity_list():GetMobByNpcTypeID(113037);
	
	if (drendar.valid and not drendar:IsEngaged()) then
		drendar:CastToNPC():SetRunning(true);
		drendar:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local irrek = eq.get_entity_list():GetMobByNpcTypeID(113302);
	
	if (irrek.valid and not irrek:IsEngaged()) then
		irrek:CastToNPC():SetRunning(true);
		irrek:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end

	local velden = eq.get_entity_list():GetMobByNpcTypeID(113382);
	
	if (velden.valid and not velden:IsEngaged()) then
		velden:CastToNPC():SetRunning(true);
		velden:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
end
