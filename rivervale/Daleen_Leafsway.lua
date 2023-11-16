function event_spawn(e)
	eq.set_timer("blurt",600000);
end

function event_say(e) 	
	
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ".  Welcome to Tagglefoot's Farm.  We grow nothing but the finest vegetables in our field.  We even manage to harvest the mystical jumjum stalk in our fields.  Karana has blessed us indeed.");  
	elseif(e.message:findi("starving")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Deputy Eigon! I forgot! I was supposed to bring him some turnips to eat while he is on patrol! Oh... He asked so nicely, too. I feel bad that I forgot. If only someone would take these [turnips] to the Deputy..");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("turnips")) then
		if(e.other:GetFactionValue(e.self) >= 100) then -- requires amiably
			e.self:Say("Oh, thank you so much! You can keep any payment he gives you. Be sure to tell him I'm sorry.");
			e.other:SummonCursorItem(16165); -- Item: Sack of Turnips
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_timer(e)
	if (e.timer == "blurt") then
		e.self:Say("Oh Dear.. I can't believe I forgot.. He must be [starving]!");
	end
end

--END of FILE Zone:rivervale  ID:19082 -- Daleen_Leafsway 

