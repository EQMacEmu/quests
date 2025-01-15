function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Good evening. Are not the stars beautiful? Somewhere out there, I imagine there is another world and another person staring right back at me. If you have business with me, please save it for the morning in the palace.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("moodoro")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Moodoro Finharn is my brother. He was a good boy up until he met that accursed halfling named [Flynn] Merrington.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("flynn")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Flynn Merrington talked my brother into stealing waters from the [Vasty Deep] and selling them to any buyers they could find. The waters from the Vasty Deep are sacred. That is why they started their [business].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("vasty deep")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("The Vasty Deep waters are said to be magical. Of course this is rumor, but it does not stop magic users from all over Norrath from trying to obtain some of the waters.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("business")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Flynn had talked Moodoro into delivering the waters to him in Qeynos. Eventually Moodoro was caught. He was sentenced to death, but a few spells from yours truly helped him escape death by replacing him with a [doppelganger].");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("doppelganger")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("The doppelganger's innards were pulled out its esophagus and Moodoro went to Qeynos to start a new life. Unfortunately, he found Flynn there also. Now they have started up again somehow! My guildmaster is aware of this and fears what the High Council will do to our guild when they find this out. Will you [help] me?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	elseif(e.message:findi("help")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Find out how they get the water. Get me the water and I shall put a poison on the seal of the container. Then you carefully carry the container back to Flynn, not to my brother, and we shall put an end to this");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself.","Oh look, a talking lump of refuse.  How novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13118})) then
		e.self:Say("Good work! Now, hold the bottle by the label! When you hand Flynn the bottle, the label will slide off. Bring me the label as proof of the deed.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,231,20); -- Craftkeepers
		e.other:Faction(e.self,266,2); -- High Council of Erudin
		e.other:Faction(e.self,265,-3); -- Heretics 
		e.other:Faction(e.self,267,3); -- High Guard of Erudin
		e.other:QuestReward(e.self,0,0,0,0,13122,300); -- Item: Eruds Tonic
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 13123})) then
		e.self:Say("Fantastic. Now I can rest assured that my brother stands a better chance of finding the right path without that manipulating little man around. Master Lanken can rest assured that the waters are safe from abuse.");
		-- Confirmed Live Faction
		e.other:Faction(e.self,231,30); -- Craftkeepers
		e.other:Faction(e.self,266,3); -- High Council of Erudin
		e.other:Faction(e.self,265,-4); -- Heretics
		e.other:Faction(e.self,267,4); -- High Guard of Erudin
		e.other:QuestReward(e.self,math.random(20),0,0,0,eq.ChooseRandom(13122,5019,6017,5021,5013),100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98002 -- Nolusia_Finharn
