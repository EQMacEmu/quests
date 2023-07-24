function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Hmm, I have been watching you. You made it further than I thought you would. I will have to work on my defenses in the future. So, what do you seek of me?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("Jaled")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Jaled Dar is quite dead, you know. But he was tasty, I feasted on his remains long ago. I do wish his spirit would go away, his incessant wailing disturbs me, and worse, it makes other dragons wary of this place. I have not eaten as well as I would have liked since his shade came to stay. If you wish to speak with him yourself, I can arrange that, for I hold a key that will unlock his tomb.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("key")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("This IS my realm, after all. Nothing is barred to me. But I did not become who I am by doing something for nothing. If you wish to talk to Jaled Dar, you will have to do something for me first. Are you willing to do this task?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("task") or e.message:findi("neb")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("There is an annoying uprising taking place among the Chetari and Paebala. This is affecting my diet. I get cranky when I don't eat right. I am VERY cranky right now. The rebellion is led by a Paebala named Neb. He has taken his followers into a part of the Necropolis that I have difficulty reaching, and he has somehow tamed the goo there as well, preventing my Chetari followers from assaulting them directly. If Neb were to fall, I am certain the rebellion would quickly falter. Bring me Neb's head, and I will give you the key to Jaled Dar's tomb.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("harla")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I know that name.  Oh, that pest Jaled Dar mentions it from time to time.  And there was... yes, I think that is it.  I dined upon a young purple recently, which the Chetari had captured for me.  He called out the name Harla Dar as well.  I am still digesting him, as a matter of fact.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("claws of veeshan")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("The Claws of Veeshan? They are delicious!  They still do not know that it was MY idea to create the Necropolis, to insure a steady supply of food.  They are bound by tradition, and tradition says that all dragons should come here to die.  Fools, of course, but who am I to complain?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("vaniki")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Vaniki is my child, so to speak.  She and all of the Chetari are my creations.  I uplifted them from the Paebala.  They are smarter, larger, stronger than their cousins.  And I taught them the dark ways.   They serve me well, bringing me food, and are my eyes and ears outside of this place.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 26010}, 0)) then
		e.self:Say("Excellent work! Here is your key, go bother that prattling fool Jaled Dar, and leave me be.");
		e.other:Faction(e.self,464,500); -- Faction: Zlandicar
		e.other:Faction(e.self,430,-50); -- Faction: Claws of Veeshan
		e.other:Faction(e.self,462,50); -- Faction: Chetari
		e.other:Faction(e.self,304,-50); -- Faction: Ring of Scale
		e.other:QuestReward(e.self,0,0,0,0,28060,250000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
