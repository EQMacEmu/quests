function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, friend. Have a drink. I have some [unique drinks]. Try one. And remember. You get rowdy, the [Bouncers] crush you.");
	elseif(e.message:findi("bouncers")) then
		e.self:Say("The Bouncers were organized by me. As I traveled to many of the world's taverns I encountered great enforcers called bouncers. It was their duty to keep order amongst chaos. When I returned and rose to greatness after the creation of the [Flaming Clurg]. I organized the Oggok Bouncers to keep order amongst the [rival guilds].");
	elseif(e.message:findi("flaming clurg")) then
		e.self:Say("The Flaming Clurg was my greatest creation. It brought me great respect in Oggok. Unfortunately, I have heard tales of an [imposter drink].");
	elseif(e.message:findi("imposter drink")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- must be at high indifferent
			e.self:Say("I have heard there is a barkeep who dares to sell a similar drink in Neriak's Foreign Quarter. I have put a price on his head. Anyone who returns with his head shall be greatly rewarded.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Find ways to help all in Oggok. Then we will have conversation.");
		else
			e.self:Say("You are brave. An enemy are you of Oggok. Leave while you still can.");						
		end
	elseif(e.message:findi("rival guilds")) then
		e.self:Say("Oggok has been the battleground for the feud between the Greenblood knights and shamans and the Craknek warriors. It is fueled by the superior intellect of the Greenbloods. Few remember that I, Clurg, was once dim, but now I speak with great words.");
	elseif(e.message:findi("unique drinks")) then
		e.self:Say("I have been all over Norrath and even served with some very great [barkeeps in Freeport]. I am the creator of both [Flaming Clurg] and Ogre Swill.")
	elseif(e.message:findi("barkeeps in freeport")) then
		e.self:Say("Yes. I have journeyed to many taverns, but it was in Freeport that I acquired most of my art. I compiled all my drink recipes in a [special book].")	
	elseif(e.message:findi("special book")) then
		if(e.other:GetFactionValue(e.self) >= 50) then -- must be at high indifferent	
			e.self:Say("I compiled all my drinks into one book. I lost this book while in Freeport. No doubt some barkeep is experimenting with it. I would pay dearly for the return of my Barkeep Compendium.")
		elseif(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Find ways to help all in Oggok. Then we will have conversation.");
		else
			e.self:Say("You are brave. An enemy are you of Oggok. Leave while you still can.");		
		end					
	elseif(e.message:findi("blood temper")) then
		e.self:Say("I have been working with the bouncers on designing mighty weapons and armor with which to slay our foes. The blood temper I invented is needed for the armor and weapons to be their strongest. It is simply Ogre Swill brewed with the blood of an elf, the blood of a human, and the blood of a dwarf.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13379})) then -- must be at high indifferent
		e.self:Say("Ahhh!! My Barkeep Compendium has been returned!! I am in your debt. I do not like to be in any man's debt. Let me offer you this as payment for your great service. Obtaining my book could not have been a simple task.");
		-- confirmed live factions
		e.other:Faction(e.self,228,50);   --Clurg
		e.other:Faction(e.self,274,-50); --Kazon Stormhammer
		e.other:Faction(e.self,261,50);  --Green Blood Knights
		e.other:Faction(e.self,232,50);   --Craknek Warriors
		e.other:Faction(e.self,337,50);  --Oggok Guards
		e.other:QuestReward(e.self,0,0,0,0,13380,500);
	elseif(e.other:GetFactionValue(e.self) >= 50 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13378})) then -- must be at high indifferent
		e.self:Say("Haha! He shall mix no more Flaming Pungla's! I shall drink from his rotting skull tonight. As for you, take this and call it yours. Consider yourself a friend of Clurg.");
		-- confirmed live factions
		e.other:Faction(e.self,228,15);   --Clurg
		e.other:Faction(e.self,274,-15); --Kazon Stormhammer
		e.other:Faction(e.self,261,15);  --Green Blood Knights
		e.other:Faction(e.self,232,15);   --Craknek Warriors
		e.other:Faction(e.self,337,15);  --Oggok Guards
		e.other:QuestReward(e.self,0,0,1,5,eq.ChooseRandom(3132,3128,3134,3135,3136,10021,10024,6302,13355,6006),500);
	else
		e.other:Say("I am no dumb ogre. I take gift when handed.");		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
