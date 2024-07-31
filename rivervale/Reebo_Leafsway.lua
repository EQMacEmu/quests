function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and salutations, " .. e.other:GetCleanName() .. "! My name is Reebo Leafsway, loyal Druid of [Karana]. I am in charge of helping young druids who wish to get started down the [trail to Karana's wisdom]. I also do my share of tending the [crops].");
	elseif(e.message:findi("shakey")) then
		e.self:Say("Shakey is our protector and friend.  He is just getting old.  Losing his [stuffing].  His [head] is getting very dry and cracked.");
	elseif(e.message:findi("stuffing")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("The hay he requires is difficult to obtain. It must have been harvested from the Plains of Karana, then cursed by a high priest of the Faceless, [Cazic-Thule]. Finally, you must cast the hay and a flask of blessed Oil of Life into an armorer's forge. Only then will the hay be ready. We Stormreapers will reward you greatly if you could accomplish this task. Remember, you must give the scarecrow stuffing to Shakey only after it has been properly prepared.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("cazic")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Cazic-Thule is the dark deity of fear. He is worshiped by many evil beings. There is believed to be a ruined temple dedicated to him deep in the [Feerrott]. That would be a good place to look for one of his high priests.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("feerrott")) then
		e.self:Say("The Feerrott is a vast rain forest in southwestern Antonica. It is home to many lizardman tribes.");
	elseif(e.message:findi("trail.* wisdom")) then	
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Good. First you should learn that Karana's work is just that.. work. Karana provides us with the tools but it is by the sweat of our brows that we prosper. Common sense and hard work are two things that are highly prized by our people. Time for you to sweat, young one. Take this crate of carrots over to Blinza Toepopal in the Fool's Gold. They need our finest carrots for Mayor Gubbin's stew. When you return I will teach you a lesson of the Rainkeeper.");
			e.other:SummonCursorItem(13971); -- Item: Crate of Rotten Carrots 
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	elseif(e.message:findi("karana")) then
		e.self:Say("Karana is known as the Rainkeeper. It is through His will that our [crops] and our children grow big and healthy. He watches over us and protects us. calling down the fury of a tempest on those who wish harm upon His followers.");
	elseif(e.message:findi("crops")) then
		e.self:Say("The crops we grow here are mostly carrots, lettuce and squash. We also are the only place on all of Norrath where the soil can support the mystical Jumjum Stalk.");
	elseif(e.message:findi("head")) then
		e.self:Say("The head of a scarecrow is difficult to replace. We do not know what is needed and all of our attempts have failed. Perhaps you could [research] this for us and bring back a new head for our old friend Shakey?");
	elseif(e.message:findi("research")) then
		e.self:Say("We have heard of a great forbidden tome penned by an evil necromancer that holds the secrets of instilling life into scarecrows. We have recovered pages from that book. That is how we know about Shakey's hay. But the pages detailing the creation of a scarecrow's head are missing. We believe that the Erudites possess at least some of the pages and might know where the rest of them may be found. Start your search in their city of Erudin.");
	elseif(e.message:findi("nillipuss")) then
		e.self:Say("Nillipuss?  Oh that dirty brownie keeps stealing our jumjum for his own greedy uses.  We certainly would not mind if someone taught him a painful [lesson].");
	elseif(e.message:findi("lesson")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("He needs to be taught not to steal our jumjum!  If you find some jumjum on him, I would appreciate it if you would return it to me.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Oh good! I see you have taught that nasty Nillipuss a thing or two! Good. But it seems to me that he has stolen more jumjum than this. Perhaps he needs another lesson?";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13971})) then
		e.self:Say("Very good. Very good indeed. Karana does not need the blind obedience that so many deities require. Trust your instincts, they are more often right than not. Here, take this to Blinza. Hurry, she is expecting them. You may keep the donation she gives you in return.");
		e.other:QuestReward(e.self,0,0,0,0,13957,5); -- Item: Crate of Fine Carrots
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13972})) then
		e.self:Say("These carrots are rotten. They were rotten when I gave them to you. Why would you waste time and energy on such a fool's errand? Because I asked you to? Many, even those you trust will ask you to do things which you should not. Use the common sense that Karana has blessed you with to know which tasks can benefit our people and which could harm them. Learn this lesson well. You will need it if you plan to adventure beyond the vale. Now take these fresh carrots to Blinza and apologize for your error. You may keep the donation she gives you as payment.");
		e.other:QuestReward(e.self,0,0,0,0,13958); -- Item: Crate of Carrots
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13974,item2 = 13974,item3 = 13974,item4 = 13974},1,text)) then
		e.self:Say("Excellent!!  You must have taught ol' Nillipuss a great deal!  But he never seems to learn..  Oh well.  The Stormreapers and all of Rivervale owe you a debt of gratitude.  Please accept this token of our appreciation.");
		e.other:Faction(e.self,355,10); -- +Storm Reapers
		e.other:Faction(e.self,286,1); -- +Mayor Gubbin
		e.other:Faction(e.self,292,1); -- +Merchants of Rivervale
		e.other:Faction(e.self,324,-1); -- -Unkempt Druids
		e.other:QuestReward(e.self,0,math.random(0,15),math.random(0,15),0,eq.ChooseRandom(10308,8303,8304,10302,10303,10304,10305,10306,10309,17302,12001,10301,17301,17300,12002,12000),27440); -- Item(s): Anti-Poison Amulet (10308), Arrow of Contagion (8303), Arrow of Frost (8304), Earring of Disease Reflection (10302), Earring of Fire Reflection (10303), Earring of Frost Reflection (10304), Earring of Magic Reflection (10305), Earring of Poison Reflection (10306), Eye of Disvan (10309), Pierces Pouch of Storing (17302), Rod of Identification (12001), Runners Ring (10301), Travelers Pack (17301), Travelers Pouch (17300), Wand of Frost Bolts (12002), Compass (12000)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 12 or e.wp == 33 or e.wp == 51 or e.wp == 73 or e.wp == 96 or e.wp == 120) then
		e.self:Emote("whistles a happy hafling tune.");
	end
end

function event_signal(e)
	if ( e.signal == 0 ) then
		e.self:Emote("shakes his head sadly. 'Poor old [Shakey] just isn't what he used to be.'");
	elseif ( e.signal == 1 ) then
		local nillipuss = eq.get_entity_list():GetMobByNpcTypeID(19015); -- Nillipuss
		if ( e.self:CalculateDistance(nillipuss:GetX(), nillipuss:GetY(), nillipuss:GetZ()) < 150 ) then
			e.self:Say("Blast you, [Nillipuss]!  Leave our jumjum alone!");
		end
	end
end

-- END of FILE Zone:rivervale  ID:19056 -- Reebo_Leafsway