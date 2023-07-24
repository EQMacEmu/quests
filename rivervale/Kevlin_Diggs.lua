function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "! Welcome to my shop! We have many fine wares. The Diggses of Rivervale have always supplied halflings and travelers with the finest armor. I advise you to purchase armor only from Kevlin's Gear and not to be conned into buying from Sonsa Fromp.");
	elseif(e.message:findi("mangler")) then
		e.self:Say("Mangler is my guard dog. I have had him since he was a pup. You had best stay far away from him - he doesn't like strangers. And don't even think about hurting him or I will KILL you. You got that?! Good. Did you have some shopping to do or did you just come here to talk about my dog?");
	elseif(e.message:findi("meeka")) then
		e.self:Say("Meeka Diggs is my younger sister. She is also in the family business. She deals with all the cloth armor.");
	elseif(e.message:findi("twippie")) then
		e.self:Say("Twippie Diggs is my youngest sibling. He handles all the sales of leather armor.");
	elseif(e.message:findi("lashinda")) then
		e.self:Say("Ahh... Lashinda... She is my new love. She works over at the Fool's Gold.");
	elseif(e.message:findi("sonsa")) then
		e.self:Say("I used to be wed to Sonsa Fromp. She shamed the Diggs name by cheating my customers. She would charge my customers double! I am sure she is still doing the same, but it is done without the Diggs name. Good riddance!");
	end
end

function event_signal(e)
	e.self:Say("Settle down there, [Mangler].. Hey! I told you to stay off of that table!");
end

-- END of FILE Zone:rivervale  ID:19053 -- Kevlin_Diggs