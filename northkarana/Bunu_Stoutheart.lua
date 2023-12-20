function event_spawn(e)
	eq.set_timer("follow",1000);
end

function event_timer(e)
	if(e.timer == "follow") then
		local mobtypeID =  eq.get_entity_list():GetMobByNpcTypeID(13065);
		
		if(mobtypeID) then
			local follow_mob = mobtypeID:GetID();
			eq.follow(follow_mob,15);
			eq.stop_timer("follow");
		end
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. "!  I am Bunu Stoutheart of the [Fangbreakers].  I am a loyal shaman who serves the will of the Tribunal.");
	elseif(e.message:findi("fangbreaker")) then
		e.self:Say("The Fangbreakers are Norrath's foremost [lycanthrope] hunters.  We bring those bloodthirsty beasts to justice.");
	elseif(e.message:findi("werewolves") or e.message:findi("lycanthrope") or e.message:findi("werewolf")) then
		e.self:Say("Lycanthropes, or werewolves, are victims of a horrible curse that transforms them into vicious murdering beasts.  But the fact that they are not in control of themselves does not excuse them from responsibility! They must be punished for the atrocities they commit!");
	elseif(e.message:findi("halas")) then
		e.self:Say("I hail from Halas, nestled deep in the Everfrost Peaks, but the Plains of Karana have been my home for many years now.");	
	end
end
