function event_say(e)
	if(e.other:GetFaction(e.self) < 5) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, " .. e.other:Race() .. ". Welcome to the great arena of Kael Drakkel. I am Vkjor, master of the arena. The games begin and end when I wish them to. Gladiators train themselves year round to entertain the populace of Kael. Have you come to watch, or is there something else I can help you with?");
		elseif(e.message:findi("watch")) then
			e.self:Say("Well then, if you present me with a ticket I might consider having a few gladiators come forth and fight.");
		elseif(e.message:findi("something else") or e.message:findi("help you with")) then
			e.self:Say("What is it you need? Do you wish to be a gladiator or something along those lines? I do not allow your kind to fight in the arena, I am sorry to say. It is a sacred place for the children of Zek. If you wish to hone your battle skills, however, I do have several things I need taken care of.");
		elseif(e.message:findi("taken care")) then
			e.self:Say("I have several things which must be dealt with. However I must know if you are capable of the tasks before I send you off. Do you fight like an ice wurm or a dragon?");
		elseif(e.message:findi("dragon")) then
			e.self:Say("If you fight like a dragon, I suppose destroying one might not be that hard for you. Several years ago, Nevederia led a flight of dragons to defile the Temple of Rallos Zek. We beat them back to the skies but not without our losses.");
		elseif(e.message:findi("loss")) then
			e.self:Say("My youngest son, Vkjrog, now rests with Rallos Zek in the Plane of War. The loss has sapped me nearly of my will to live. However, a few things keep me going - my duty to keep the arena in order and the knowledge that I might still bring pain and suffering to Nevederia. I wish her to suffer as I did with the loss of a child. She may stay safe in the Temple of Veeshan but her brood does not. Slay her three children and bring me proof of their deaths so they may serve as my message to Nevederia. I will compensate you with a pair of gloves fit for a fine warlord if you can give me this satisfaction.");
		elseif(e.message:findi("ice wurm")) then
			e.self:Say("Very well, young one. A friend of mine named Graktar recently traveled to the Eastern Wastes in search of the remains of his brother, Vkalth. Please take this note to Graktar and assist him in his search. Return to me when you have news of his fate.");
			e.other:SummonCursorItem(25102); -- Large note
		end
	elseif(e.other:GetFaction(e.self) < 7) then
		e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself."));
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 25128,item2 = 25129,item3 = 25127})) then --  Bloody claws of Draazak, Jerigozia, and Veredenia
		e.self:Emote("looks down at you, shocked. 'I honestly did not expect you to be able to destroy her children, " .. e.other:GetCleanName() .. ". Vkjrog must have guided your hand as you slew those beasts. Nevederia will now know sorrow the like of which she has never felt.' Vkjor drops a shiny pair of gauntlets on the ground before you as he turns his attention to the bloody claws he now holds.'");
		e.other:Faction(e.self,448,75); -- Faction: Kromzek
		e.other:Faction(e.self,419,18); -- Faction: Kromrif
		e.other:Faction(e.self,429,18); -- Faction: King Tormax
		e.other:Faction(e.self,430,-37); -- Faction: Claws of Veeshan
		e.other:QuestReward(e.self,0,0,0,0,25078,75000); -- Silver Steel Gauntlets
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
