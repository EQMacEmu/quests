function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("shakes his body and his countless necklaces cause a loud rattle to echo off the stone walls. 'Hello " .. e.other:GetCleanName() .. ". Have you come to [worship] or have you just come for a visit to view our wonderful architecture and to [pay your respects].'");
	elseif(e.message:findi("worship")) then
		e.self:Say("Very well. You worship quietly then. May Brell Serillis bless you.");
	elseif(e.message:findi("respects")) then
		e.self:Say("You have, well then! You can pay your respects by bringing me a [present].");
	elseif(e.message:findi("present")) then
		e.self:Say("I like necklaces. I wear necklaces made from every kind of beast. The power of the beast is contained within each necklace. The more necklaces I wear, the greater my power! Bring me a Bear Fang Necklace, a Wolf Fang Necklace and a Panther Fang Necklace. This will show your devotion to the temple. Then perhaps I can do you a [favor].");
	elseif(e.message:findi("favor") or e.message:findi("heretic") or e.message:findi("mystic") or e.message:findi("treant finger") or e.message:findi("bear liver") or e.message:findi("griffon down") or e.message:findi("griffon skull")) then
		if(e.other:GetFactionValue(e.self) >= 350) then
			if(e.message:findi("favor")) then
				e.self:Say("I see that you truly respect our temple and more importantly, myself. Since I have great power and you have given me many gifts, I am willing to give you a gift if you are skilled in the ways of the [mystic] or the [heretic].");
			elseif(e.message:findi("heretic") or e.message:findi("mystic")) then
				e.self:Say("I can make a weapon for you, one that you may use to curse your enemies with terrible illness. I require several items. The shaft of the weapon will be made from a Treant Finger. I shall cover the shaft in Griffon Down and affix a Griffon Skull to the top. Finally, I shall need a Diseased Bear Liver with which to imbue the staff with its terrible magic.");
			elseif(e.message:findi("treant finger")) then
				e.self:Say("I doubt a treant would willingly hand over his finger. Remember , the older the treant the stronger the shaft of the weapon will be.");
			elseif(e.message:findi("bear liver")) then
				e.self:Say("The best person to talk to about that would be that human. I believe he calls himself Farkus Grime. He passes through here now and then and he seems to be fascinated with disease. Perhaps he could help you with that.");
			elseif(e.message:findi("griffon down")) then
				e.self:Say("I imagine you could find one of those from a Griffon.");
			elseif(e.message:findi("griffon skull")) then
				e.self:Say("I imagine you could find one of those from a Griffon.");
			end
		elseif(e.other:GetFaction(e.self) < 6) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 8258,item2 = 8261,item3 = 8257})) then
		e.self:Emote("puts the necklaces around his neck as his body shakes, causing the various bits and pieces of bone and tooth to clatter loudly. 'Ah yes! I feel the power flowing through me, I am ever closer to the spirit world! I thank you for your devotion to the temple!'");
		e.other:Faction(e.self,1598,100); -- Anchorites of Brell Serilis
	elseif(e.other:GetFactionValue(e.self) >= 350 and item_lib.check_turn_in(e.self, e.trade, {item1 = 8268,item2 = 8267,item3 = 8266,item4 = 8265})) then
		e.self:Say("Very well. These will do just fine. Here, it is finished. Take this and smite your enemies with terrible disease.");
		e.other:QuestReward(e.self,0,0,0,0,8071);  -- Rod of Ulceration
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
