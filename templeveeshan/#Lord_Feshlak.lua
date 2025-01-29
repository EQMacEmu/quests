-- #Lord_Feshlak NPCID: 124008

function event_spawn(e)
	eq.spawn2(124157, 0, 0, -810, 470, 129, 34); -- a_guardian_spirit 
end

function event_death(e)

	local npc_list = eq.get_entity_list():GetNPCList();
	
	if ( npc_list ) then
		for npc in npc_list.entries do
			if ( npc:GetNPCTypeID() == 124157 and npc:GetX() == -810 and npc:GetY() == 470 ) then
				npc:Depop();
				break;
			end
		end
	end
end

function event_combat(e)

	if (e.joined) then
		eq.set_timer("help", 300000);
		HelpMe(e);
	else
		eq.stop_timer("help");
	end
end

function event_timer(e)
	if(e.timer == "help") then
		HelpMe(e);
	end
end

function HelpMe(e)
	local aaryonar = eq.get_entity_list():GetMobByNpcTypeID(124010);
	
	if (aaryonar.valid) then
		aaryonar:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
	end
end

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then -- must be sneaking to get this dialogue
		if(e.message:findi("hail")) then
			e.self:Emote("looks down at you and words rumble from deep within his throat.  'What brings you to me mortal?  I do not share the hate for the Kromzek that Yelinak has.  I will live here in peace and tranquility until those pests pose a true threat to my way of life.");
		elseif(e.message:findi("pests")) then
			e.self:Say("The Kromzek and the Kromrif are but pests.  They are short lived like your kind.");
		elseif(e.message:findi("way of life")) then
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end