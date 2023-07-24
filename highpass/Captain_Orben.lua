function event_say(e)	
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Greetings, traveler! I am Captain Orben of the Highpass Guards. I keep watch over my men and the [volunteers] here at the West Gate. It's been a busy [job] here lately, with the [gnoll raids] and all.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("job")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("We're short-handed around here, as usual. Would you like to help us out with the [Volunteer Watch]?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("volunteer")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("The Volunteer Watch guards the entry gates of Highpass. Since the [gnoll raids] are becoming more and more frequent, it's a busy job. But it can pay well, depending on how many [gnolls] you slay.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("gnoll")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("The Mucktail Gnolls of the Karanas have been trying to expand their territory. Small gnoll raiding parties are frequently rushing the West Gate. Without the [Volunteer Watch] helping us out, Highpass would probably be overrun by those vile beasts.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("hold")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Highpass Hold is run by [Carson McCabe], who lives in the keep. It's a rough place here, but you can easily make a quick buck.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("carson")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("Carson runs this place. I wouldn't cross him; he seems like a pretty ruthless guy. I hear he's got connections all over Antonica!");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("keep")) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			e.self:Say("The keep is in the center of Highpass Hold. The keep was made in a natural cave and then expanded over the past few years. I hear they are currently adding some new floors beneath it.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local scalp = 0;
	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13792,item2 = 13792,item3 = 13792,item4 = 13792}, 0)) then
			scalp = 4;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13792,item2 = 13792,item3 = 13792}, 0)) then
			scalp = 3;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13792,item2 = 13792}, 0)) then
			scalp = 2;
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13792}, 0)) then
			scalp = 1;
	end
	
	if(scalp > 0) then
		if(e.other:GetFactionValue(e.self) >= -350) then
			repeat
				e.self:Say("Great work! Maybe you can help us out again sometime?");
				e.other:Faction(e.self,332,5,0); -- Faction: Highpass Guards
				e.other:Faction(e.self,329,2,0); -- Faction: Carson McCabe
				e.other:Faction(e.self,331,2,0); -- Faction: Merchants of Highpass
				e.other:Faction(e.self,230,2,0); -- Faction: Corrupt Qeynos Guards
				e.other:Faction(e.self,330,2,0); -- Faction: The Freeport Militia
				e.other:QuestReward(e.self,math.random(0,10),math.random(0,10),math.random(0,5),math.random(0,1),0,25); -- verified xp live data
				scalp = scalp - 1;
			until scalp == 0
		else
			e.self:Say("I will not aid beings such as you."); -- text made up. faction too low and eat items.
			scalp = 0;
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
