function event_say(e)
	if(e.message:findi("tell.* fortune") or e.message:findi("fortune.* teller")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("So you wish to find a path in which to reach your destiny? Very well. Open your mind and give me your hand. Tell me the faith you follow.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* bristlebane")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("To be like the king of thieves is the path on which you stray. Go to Crow's after sundown. It is better than in day.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* bertoxxulous")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The catacombs contain safe haven for you and me. It is our place. To you, I tell no lie.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* brell") or e.message:findi("follow.* serilis")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The place of true power is usually beneath your feet. Stay in this city and a rare enemy you just may meet.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* cazic") or e.message:findi("follow.* thule")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("You will find an acquaintance who is elvish and dark. Be forewarned that in this city it is best not to bark.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* innoruuk") or e.message:findi("follow.* hate")) then
		if(e.other:GetFactionValue(e.self) >= 100) then 
			e.self:Say("To hate is your way. Just as the father of the dark race. To Nektulos is where you should head at good pace.");			
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* karana")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("You will be very safe in this city of thunder. Travel to the catacombs for easy plunder.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* erollisi marr") or e.message:findi("follow.* love")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("To be strong in the ways of love is truly the only way. Go into Karana's Paw and enjoy your day.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* mithaniel marr")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("As is your god you are one of true valor from which you cannot part. Go forth into the catacombs and say hail Mister Bloodheart.");			
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow marr")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("Which Marr? Come on, work with me here!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* prexus")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("He created the Kedge freaks which are now gone from this land. Go deep into the caves of the Jaggedpine and someone will take your hand.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* quellious")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The tranquility and peace of the child lies in your heart. By fighting the opal elves you shall be doing your part.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* rodcet nife")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The power of healing is brought forth in your mass. Go past the gates and tell Zutros you are from Highpass.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* tribunal")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The tranquility and peace of the child lies in your heart. By fighting the opal elves you shall be doing your part.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* tunare")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("From the mother of all elves you find comfort and peace. Walk the fields of Karana where troubles shall cease.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* veeshan")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("The blood of the mother of all wyrms runs deep in great cities. Be aware that you are not alone in this town of no pity.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* zek")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("To die in battle is the true and only way. Go into Blackburrow and join the fray.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* ro")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("To set foot upon his land would set your body ablaze. Go far north of Freeport to find the eye in days.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("follow.* no one")) then
		if(e.other:GetFactionValue(e.self) >= 0) then 
			e.self:Say("To be agnostic now is your chosen path. Now power holds sway but home and hearth.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end	
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {gold = 50})) then
		e.self:Say("Fifty gold? You must want a rune of fortune. If you want another one, give fifty gold to Mizr N'Mar in the Neriak library.");
		e.other:QuestReward(e.self,0,0,0,0,10530,10); -- Rune of Fortune (top)
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end
