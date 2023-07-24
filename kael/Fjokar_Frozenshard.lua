-- Wenglawks The Traitor

function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Today is a good day in Kael Drakkel. Don't you think?");
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("today is a good day")) then
		if(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Emote("snickers.  Do you always repeat what others say, Human?  Pestering me is a good way to end up dead.");	
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("wenglawk")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Wenglawks masquerades as a noble. As family lines go, his is even more diluted than those two Iceshard brothers. He is a petty merchant and traitor. One day I will find my proof of this.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("iceshard brother")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Klaggan and Vorken, those two ruffians who somehow have managed to become the lords of the Kromrif manor. They were nothing but a pair of thugs no less than twenty years ago. I remember watching them kill and maim the innocent among the Kromrif tribes. If it were not for King Tormax's protection, I would slay them.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("kromrif")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The Frost giants are a proud race, but they are not nearly as powerful and blessed as we Kromzek. Our cousins may be strong, but the might of an enraged storm giant is something to behold.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("courier")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Those Kromzek deserve to die. They know very well what he is up to. I will hunt them for sport, moving silently through the streets of Kael Drakkel, and invisibly through the outside world. Wenglawks has some sort of underhanded deals going on with the dragons. I have yet to find anything which will persuade King Tormax to allow me to slay him, unfortunately.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("dead")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("pats an ice covered spear at his side.  'This spear has been the demise of many.  A swift stab to the back of an unsuspecting foe is all that it takes.  I am still waiting for that thick headed Wenglawks to discover who has been killing his poor couriers.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 1717},0)) then -- Sealed Letter (Sealed Letter to Wenglawks)
		e.self:Say("You have found what I was unable to. King Tormax's protection of Wenglawks will end soon. His death will be so very delightful to invoke. 'rushes out of the room, dropping his spear as he does.'");
		e.other:Faction(e.self,429, 20); -- King Tormax
		e.other:Faction(e.self,448, 20); -- Kromzek
		e.other:Faction(e.self,436, -10); -- Yelinak
		e.other:Faction(e.self,405, -10); -- Dain Frostreaver IV
		e.other:QuestReward(e.self,0,0,0,0,25030,75000); -- Frozen Shard
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
