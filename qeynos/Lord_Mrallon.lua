function event_say(e)
	if(e.message:findi("tale")) then
		if(e.other:GetFaction(e.self) < 3) then			
			e.self:Say("Nyrein Shadowstorm spent much of her life defending the Jaggedpine from within its confines. However, duty would sometimes deem that she trek beyond the forests to assure its protection. In the peak years of her life, she spent much time wandering the whole of Norrath in pursuit of one villain that had betrayed the entire order. We are not certain why or how this one, who at one time was Nyrein's most trusted of companions and second to only her within the order, fell to the temptations and corruption of The Faceless -- but we do know that Nyrein defeated him on the battlefield. He fled to the Plane of Fear and with him went the very essence of the Tempest Guard that remains caged within his corrupted, violent spirit. Find the Tempest Reaver and retrieve the Essence of the Tempest Guard, which you must then seal within the Hollowed Tempest Stone to create the Tempest's Guard Stone. Once you have this sacred stone, return it to Lady Deira.");
		elseif(e.other:GetFaction(e.self) < 6) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
  
	if(e.other:GetFaction(e.self) < 3 and item_lib.check_turn_in(e.self, e.trade, {item1 = 8919, item2 = 8951})) then
		e.self:Say("Aaaah, yet another warrior brave enough to face their own faults and honorable enough to strive for a proof of their worth and devotion to The Rainkeeper. Your kind is too few and far too rare, but do not think that your trials are at their end. I have forged the necessary Hollowed Tempest Stone -- yes, young warrior, I am indeed one well versed in the ways of the Tempest Guard for at one time I myself held such a rank in a time before the closing of the Jaggedpine. Aaaah, but enough reminiscing for one day -- your trial is the matter at hand. Within the Hollowed Tempest Stone you must combine the Essence of the Tempest Guard, which you will find only through great peril. The Tempest Reaver, who resides in the realm of Cazic-Thule himself, holds the essence. The [tale] regarding its presence there is indeed one to be heard if you wish to fully understand your task.");
		e.other:Faction(e.self,280,10); -- Faction: Knights of Thunder
		e.other:Faction(e.self,221,-10); -- Faction: Bloodsabers
		e.other:Faction(e.self,341,7); -- Faction: Priests of Life
		e.other:Faction(e.self,262,7); -- Faction: Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,17089,1000); -- Hollow Tempest Stone
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end
