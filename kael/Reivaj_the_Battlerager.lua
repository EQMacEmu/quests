function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". You tread in the halls of Iceshard manor. Are you here with a purpose or are you lost?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("lost")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Turn around and go to your left through the hallways, then turn right and go straight.  That should lead you out of this fine manor");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("purpose")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I do not know what purpose you would serve to the Kromrif. If you seek to amass a fortune you have come to the wrong man. I am but a simple battlerager, wielding my blade for the Iceshard brothers when needed.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("rallos zek")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("The great war god guides my blade and has helped shape my day to day life... I feel as if there is something greater mapped out for my life than what I have here.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("plan")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("I have been planning to travel forth from Kael Drakkel and destroy any Coldain who have spread from their safe home in Thurgadin. It is always a nice trip, I will take several of the elder Kromrif with me as well. Perhaps we will track down the elusive wurm, Blizzent.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("blizzent")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Blizzent is an ancient ice wurm Vorken speaks of occasionally. If I remember the story correctly, Blizzent once bit Vorken and Klaggen and has had a desire to have another taste. I have never seen the wurm myself. He may not even be alive still. If I were able to slay Blizzent and retrieve proof of it, I could probably get in good with master Vorken.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	elseif(e.message:findi("battle")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Yes, I am a warrior who thrives on battle.  I have great faith in Rallos Zek and I call upon his power to make me more efficient in battle.  I am not like the foolish berserkers.  They howl like animals and create strange totems.  They simply unleash their anger upon the world whereas I focus and destroy my foes with the aid of Rallos Zek.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");		
		else
			e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common. Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here? Now go away!","I wonder how much I could get for the tongue of a blithering fool? Leave before I decide to find out for myself."));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25117}, 0)) then
		e.other:Faction(e.self,419,25); -- Kromrif
		e.other:Faction(e.self,448,6); -- Kromzek
		e.other:Faction(e.self,406,-12); -- Coldain
		e.other:Faction(e.self,430,-2); -- Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25083,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
