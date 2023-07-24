function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -300) then -- this is within 100 faction of being completely accurate, tested at -400 and -200, -400 was too low and -200 worked
			e.self:Say("Greetings, fine citizen of Qeynos, what can I make for you today?  How about a genuine, handmade [rat fur cap]?  Or maybe a lovely [rat pelt cape]?  Maybe you'd like a necklace?  For a small fee. I can make a nice [snake fang necklace] or a [lucky rat's foot necklace].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("rat fur cap")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Rat fur cap?  You're in luck, that happens to be my specialty, " .. e.other:GetCleanName() .. ".  Just bring me 2 pieces of rat fur and 3 gold, and I'll make one up for you while you wait.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("rat pelt cape")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("The rat pelt cape..  that happens to be my specialty!  I must say, it would be the perfect choice to go with that outfit you have on.  All I need are 3 rat pelts, those big ol' rats out in the hills work great for these capes, and 4 gold.  I must say, at these prices, everyone in Qeynos will be wearing one in a matter of weeks.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("snake fang necklace")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Hey, great choice..  the snake fang necklace just happens to be my specialty, " .. e.other:GetCleanName() .. "!  Just bring me 3 snake fangs, and 2 gold.  With one of these around your neck, you're sure to be the center of attention down at Crow's..  or anywhere else you fill your mug.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("lucky rat")) then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Now that is exactly what you need my friend, a lucky rat's foot necklace..  and, it just happens to be my specialty!  Just bring me one rat's foot, some rat whiskers, and I won't even charge you any gold. Just buy me a honey mead, and you'll be the luckiest rat dodger this side of Highpass.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("kane"))then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("Commander Kane Bayle is the commander of all the Qeynos Guard.  He is second only to his brother, Antonius Bayle.  His post is in the guard house at the city gates.  Mind you, do not bother him, he has a bit of a temper.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	elseif(e.message:findi("circle.* unseen hand"))then
		if(e.other:GetFactionValue(e.self) >= -300) then
			e.self:Say("The Circle of the Unseen Hand?  I have heard nothing of them.  Are they some sort of performing magic troupe?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:Say("Get your rat fur caps here! Get your snakes fang necklaces here! Special discount prices.. this week only.");
	elseif(e.wp == 9) then
		e.self:Say("Custom made rat pelt capes.. cheap, cheap, cheap!");
	elseif(e.wp == 12) then
		e.self:Say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you when you aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");
	elseif(e.wp == 17) then
		e.self:Say("Get your rat fur caps here! Get your snake fang necklaces here! Special discount prices.. This week only.");		
	elseif(e.wp == 23) then
		e.self:Say("Feeling a bit unlucky lately? Gnoll pups always picking on you? Fire beetles attacking you when you aren't looking? what you need is a lucky rat's foot necklace! Satisfaction guaranteed!");		
	elseif(e.wp == 27) then
		e.self:Say("Menkes' discount fashions and jewelry, now open for business.. custom made hats, to fit any size head.");
	end
	
end

function event_trade(e)
	local item_lib =require("items");
	local text1 = "Yea, this is good, but remember, I need 3 gold and 2 pieces of rat fur to make a cap for you.";
	local text2 = "That's part of it, now get me the rest and you'll be walking off in a brand new cape, my friend.";
	local text3 = "Hey, I'm giving you a great deal here.. Get the rest of items for this already. I'm sure we both have important things to do.";
	local text4 = "Oh yea.. this will be the finest snake fang necklace I've ever made.";	
	
	if(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13064,item2 = 13064, gold = 3},1,text1)) then -- hand-ins worked at -400 faction low dubious, didn't work at scowls
		e.self:Say("Hey. look at this. some of my best work, if I do say so myself. Enjoy, and tell your friends");
		e.other:Faction(e.self,121,2); -- Qeynos Citizen
		e.other:QuestReward(e.self,0,0,0,0,1050,200);  -- rat fur cap
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13054,item2 = 13054,item3 = 13054,gold = 4},1,text2)) then
		e.self:Say("This cape turned out great. It'll sure help keep you warm on those cold and stormy nights out in the Karanas.");
		e.other:Faction(e.self,121,5); -- Qeynos Citizen
		e.other:QuestReward(e.self,0,0,0,0,1051,200); -- rat pelt cape
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13067,item2 = 13067,item3 = 13067,gold = 2},1,text4)) then
		e.self:Say("Hey, hey.. with this little baby, you will be the talk of the town tonight!");
		e.other:Faction(e.self,121,5); -- Qeynos Citizen
		e.other:QuestReward(e.self,0,0,0,0,1052,200); -- Snake fang necklace
	elseif(e.other:GetFactionValue(e.self) >= -500 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13065,item2 = 13071,item3 = 13033},1,text3)) then
		e.self:Say("Now this here has got to be one of my best works.. I dare you to find someone who can make a higher quality necklace than this one! Enjoy, my good friend!");
		e.other:Faction(e.self,121,5); -- Qeynos Citizen
		e.other:QuestReward(e.self,0,0,0,0,1053,200); -- rat's foot necklace
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
