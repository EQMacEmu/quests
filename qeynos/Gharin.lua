function event_say(e)	
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then -- requires indifferent
			e.self:Say("Good day! I see they have good stock for the future armies of Qeynos. I, myself, wish to be a soldier one day instead of doing this [job].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("job")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I am a [messenger] for Antonius Bayle. Not big enough to fight, but light enough to run all the way to the [Jaggedpine] tomorrow morning. I sort of wish I did not have to go. I'd rather be at the Lion's Mane.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("messenger") or e.message:findi("Jaggedpine")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I will be taking a private note to the head druid of the Jaggedpine Treefolk. Matter of fact, I am carrying the note right now. But enough about that, if it were not for the mission tomorrow, I could be doing something at the [Lion's Mane].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("lion.* mane")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Ahh. The Lion's Mane. If I were there, I would be enjoying a stein of Crow's [special brew]. They are expecting their first shipment of the brew. I believe if I had a few or more of those lagers, I would be very ill. I would probably have to have someone else deliver the note for me. Still, I wish I had one of those fine brews.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("special brew")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Crow's special brew is one of the finest lagers anywhere. It used to be sold only at Crow's bar, but apparently Crow is allowing it into other bars. For a hefty price, too, I assume. This deal is good for decent citizens considering that the other two bars in Qeynos cater to pretty rough crowds.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib =require("items");
	local text = "Oh! That's tasty. I guess I could handle a few more.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13799,item2 = 13799,item3 = 13799,item4 = 13799},1,text)) then
		e.self:Say("Oohhh! My head. Stop the pub from spinning. I cannot make it to the Jaggedpine feeling like this. Please take this note to Te'Anara of the Treefolk. Here is a little silver for the favor. Thanks. Ooohhhh..");
		e.other:Faction(e.self,262,50,0); -- confirmed live factions
		e.other:Faction(e.self,219,7,0); -- Faction: Antonius Bayle
		e.other:Faction(e.self,230,-7,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(e.self,223,-12,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(e.self,291,5,0); -- Faction: Merchants of Qeynos
		e.other:QuestReward(e.self,0,1,0,0,18807,250); -- Item: A Sealed Letter
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
