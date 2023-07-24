-- Dragon Heads quests

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Welcome to the castle of King Tormax. It is quite an accomplishment for one of your kind to have lived this long in the service of our great King Tormax. You must be powerful indeed. My power is like a storm - I may rage and destroy my foes with great fury.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("foes")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The dragons are the greatest threat to Kael Drakkel. For some reason they believe that this land we inhabit is holy and should not be tread upon. I cannot count the number of wurms I have beaten back from the gates of Kael Drakkel in the past. We giants will live on, though, for each year their numbers thin and ours only grow. With the help of mercenaries such as yourself we may be able to eradicate them from the face of Velious.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("eradicate")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("I dream of the day when the only dragons in Velious are the ones whose skins line my boots. Some day my dream will come true. Until the day I can gather a force powerful enough to assault their homes, I will slay whatever foul beasts tread near Kael Drakkel.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("assault")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("That is an aspiration of King Tormax. One day, it may be possible for us to do so. Encountering so many dragons at once may very well be suicide though. Enough of my banter about dragons. What is it that brings you to Dragon Death Keep? Do you seek more challenging tasks?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("challenging tasks")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("If you are as mighty as I believe you to be, travel out from this city and fight off the draconian menace. For the head of an elder dragon you will be handsomely rewarded.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("reward")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Emote("pats the huge axe at his side and drapes his shimmering cloak over his shoulders.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("axe")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("My axe is named Frostbringer. It was given to me by the great King Tormax for my service to him. Serving the king can be quite advantageous.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("cloak")) then
		if(e.other:GetFactionValue(e.self) >= 400) then
			e.self:Say("The cloak of the Maelstrom allows me to rage like a great storm. It is but a simple possession - the head of an elder dragon would be worth far more to my kind.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25119},0)) then
		e.self:Say("The bards will sing of your greatness, " .. e.other:GetCleanName() .. ". Rage on like the Maelstrom when you wear this cloak. You have done a great service for the city of Kael Drakkel, and we Kromzek do not soon forget great deeds.");
		e.other:Faction(e.self,429, 25); -- King Tormax
		e.other:Faction(e.self,448, 25); -- Kromzek
		e.other:Faction(e.self,436, -12); -- Yelinak
		e.other:Faction(e.self,405, -12); -- Dain Frostreaver IV
		e.other:QuestReward(e.self,0,0,0,0,25023,5000);
	elseif(e.other:GetFactionValue(e.self) >= 400 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25118},0)) then
		e.self:Say("We shall hang this head from the halls of Dragondeath Keep and sing your praises, " .. e.other:GetCleanName() .. ". Take my axe as a reward for your great deeds. You are a true hero for Kael Drakkel!");
		e.other:Faction(e.self,429, 25); -- King Tormax
		e.other:Faction(e.self,448, 25); -- Kromzek
		e.other:Faction(e.self,436, -12); -- Yelinak
		e.other:Faction(e.self,405, -12); -- Dain Frostreaver IV
		e.other:QuestReward(e.self,0,0,0,0,25022,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
