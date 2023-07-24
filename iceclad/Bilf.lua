local count = 0;

function event_spawn(e)
	eq.set_timer("roll",70000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shove off, mate.  We're busy 'scoutin'.  Can't ya see?  Hehehe!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110054)) then
			eq.get_entity_list():GetMobByNpcTypeID(110054):Say("Har har!  Scoutin'.  Yah, thats what we be doin'!");
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110055)) then
			eq.get_entity_list():GetMobByNpcTypeID(110055):Say("Har har!  Scoutin'.  Yah, thats what we be doin'!");
		end
	end
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Emote("rolls a pair of handcarved dice.  'Har har!  The bones be favorin' me today!'");
	elseif(count == 2) then
		e.self:Emote("rolls a pair of handcarved dice.  'Bah!  You loaded these dice!  I never roll this bad!'")
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110055)) then
			eq.get_entity_list():GetMobByNpcTypeID(110055):Say("I ain't loaded nothin'.  Just roll and lose yer chips.  Har har!");
		end
	elseif(count == 3) then
		e.self:Emote("gets a strange smile and throws down a couple of chips.  'Time ta ante up.  I'm feelin' lucky.'");
	elseif(count == 4) then
		count = 0;
	end
end