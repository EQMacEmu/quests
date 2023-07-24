function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! How lucky you are to encounter the greatness of the legendary Sir Edwin Motte, slayer of cyclopes, battler of beasts, crusher of creatures, masher of monsters, eradicator of evil and champion of the third annual dart championship of Freeport.");
	end
end

function event_signal(e)
	if ( e.self:IsEngaged() ) then
		return;
	end

	local turn, bard;
	
	if(e.signal == 1) then
		e.self:Say("What is it with all this political revelry. Let's here more jests!");
		turn = true;
	elseif(e.signal == 2) then
		e.self:Say("Haha!! I shall laugh because it is true. Forgive me, ogre friends.");
		turn = true;
	elseif(e.signal == 3) then
		e.self:Say("I say, that Sir Lucan is no man of nobility. So they say...");
		turn = true;
	elseif(e.signal == 4) then
		e.self:Say("I say!! I have fought side by side with the great Antonius bayle. He is a man of supreme virtue.");
		turn = true;
	elseif(e.signal == 5) then
		e.self:Say("Bloody right, you are! Those fellows can't keep down any grog.");
		turn = true;
	elseif(e.signal == 7) then
		e.self:Say("Bloody right!! Sir Lucan is no knight. He is nothing more than a mere warrior.");
		turn = true;
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