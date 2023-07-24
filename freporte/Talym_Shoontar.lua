local factionId = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, friend?  It is a good day to be alive in Antonica!  If you should happen to visit Surefall Glade, say hello to Hager Sureshot for me.");
	elseif(e.message:findi("hager")) then
		e.self:Say("Hager Sureshot is that know-nothing ranger in charge of the Protectors of the Pine. He thinks he can protect all of Surefall Glade. He is wrong.");
	elseif(e.message:findi("poach")) then
		e.self:Say("Excuse me! I am a HUNTER. A hunter of profit, not glory. Have you come to [collect the bounty] on my head? For your sake, the answer had better be [no].");
	elseif(e.message:findi("collect")) then
		e.self:Say("Then do your best, whelp! I need the practice. I hope for your sake that my gypsy friends are not nearby.");
	elseif(e.message:findi("no")) then
		e.self:Say("Too bad. I heard there is a new market for skins of your kind.");
	end
end

function event_combat(e)
	if ( not e.joined and factionId ~= 0 ) then
		e.self:CastToNPC():SetNPCFactionID(factionId);		-- restore faction if Tlin doesn't kill
	end
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if(e.signal == 1) then
		e.self:Say("What kind of girly song was that? It stank as bas as a troll's breath.");
		turn = true;
	elseif(e.signal == 2) then
		e.self:Say("Ha!! That's right. Them ogres are as thick as they come.");
		turn = true;
	elseif(e.signal == 3) then
		e.self:Say("I ain't clappin' for no man.");
		turn = true;
	elseif(e.signal == 4) then
		e.self:Say("Antonius Bayle is a blithering fool.");
		turn = true;
		eq.signal(10186, 10); -- NPC: Tlin_Bowfright
	elseif(e.signal == 5) then
		e.self:Say("My grandma can outdrink any Erudite.");
		turn = true;
	elseif(e.signal == 6) then
		e.self:Say("Get off the stage, lass! Can't ye see he left because ye can't carry a tune?!");
		turn = true;
	elseif(e.signal == 7) then
		e.self:Say("Yeah!!  Sir Lucan is nothing more than a glorymonger.");
		turn = true;
	elseif(e.signal == 10) then
		factionId = e.self:CastToNPC():GetNPCFactionID();
		e.self:CastToNPC():SetNPCFactionID(0);		-- remove faction to prevent NPCs from assisting
		e.self:Say("All right, Tlin! I am going to smash your face in!");
		e.self:AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(10186),100); -- NPC: Tlin_Bowfright
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

-- END of FILE Zone:freporte  ID:10182 -- Talym_Shoontar



