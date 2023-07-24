-- Captain_Bvellos
-- Bvellos' Bounty, Mask of War

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am the captain of the Kael militia. I will be watching those of your kind who have come to Kael Drakkel as mercenaries and bounty hunters. You may have come here to serve king Tormax but Kael is my home and I intend to keep it a safe place for the Kromzek. Keep yourself out of trouble or you will end up in a world of pain.");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("work")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Are you looking for work, " .. e.other:GetCleanName() .. "? I may have a use for one of your kind. I believe that several nobles in this fine city are not all they appear to be. I have suspicions about that filthy Wenglawks. He will do whatever it takes to amass his own wealth. My sources tell me that he may very well be trading with the Coldain, or worse yet, the dragons. If you could find me proof of his underhanded dealings, I would be most pleased.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("proof")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The more convincing the proof is, the better. There must be a record of his actions somewhere.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("safe")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("With the influx of mercenaries into Kael Drakkel, I have seen minor crimes increase. I have had to increase my militia patrols. A majority of my militia work longer hours than they did before. There was a time when we only had to watch for the dragons from the sky and the Coldain from the outside. Now we must watch within.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("mercenaries")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I have several bounties open if you are interested. Bring me the head of a Coldain and I will reward you with a small sum of money and spread the word of your good work. There is also a bounty upon the nefarious Icepaw kobolds who serve the outcast Velketor. I require four of the paws of those little beasts.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	local head = item_lib.count_handed_item(e.self, e.trade, {30081});
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25301, item2 = 25301, item3 = 25301, item4 = 25301}, 0)) then
		e.self:Say("You have done well to hunt down these foul dogs.");
		e.self:Emote("reaches into a large bag and pulls something shiny from within its depths 'Take this as a reward.");
		e.other:Faction(e.self,448,40); -- Faction: Kromzek
		e.other:Faction(e.self,419,10); -- Faction: Kromrif
		e.other:Faction(e.self,429,10); -- Faction: King Tormax
		e.other:Faction(e.self,430,-20); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,{itemid = eq.ChooseRandom(25077,25084,25018)}); -- Item(s): Silvery Mask (25077), Antlered Mask (25084), Giant Scalemail Tunic (25018)
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1718}, 0)) then -- Wurmscale Scroll
		e.self:Say("This indeed points to Wenglawks being a traitor. If only there were more proof I could take this to the king. Thank you, " .. e.other:GetCleanName() .. ", you have done a great service for Kael. Take this mask as a reward for your service to this city.");
		e.other:Faction(e.self,448,50); -- Faction: Kromzek
		e.other:Faction(e.self,419,12); -- Faction: Kromrif
		e.other:Faction(e.self,429,12); -- Faction: King Tormax
		e.other:Faction(e.self,430,-25); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25024,1000);
	end

	if(head > 0) then	
		repeat
			e.self:Say("Excellent, " .. e.other:GetCleanName() .. ". Here is the bounty as promised.");
			e.other:Faction(e.self,448,40); -- Faction: Kromzek
			e.other:Faction(e.self,419,10); -- Faction: Kromrif
			e.other:Faction(e.self,429,10); -- Faction: King Tormax
			e.other:Faction(e.self,430,-20); -- Faction: Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,math.random(5,8),0,1000);
			head = head - 1;
		until head == 0
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
