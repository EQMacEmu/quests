function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("appears to fade in and out. The ghostly figure seems to stare through you, as though he is not aware of your presence. 'Do you know who I am?', he asks, as if he is inquiring for his own benefit.");
	elseif(e.message:findi("who are you")) then
		e.self:Emote("begins to smile. 'It has come back to me, just now', he says. 'I am the Dragon Sage. I lived in the once great elven city of Takish Hiz, where I studied the dragons of Norrath.' The figure appears to be concentrating on something in the distance. His image begins to fade as he says, 'If I am among the world of the living again, then Norrath must be in great danger.'");
	elseif(e.message:findi("danger")) then
		e.self:Say("Thousands of years ago, Veeshan, the mother of all wurms, made her mark upon the face of a young world called Norrath. She struck the planet with her godly might, laying her claim to the world, and created the beings known as dragons. This began the [Age of Scale].");
	elseif(e.message:findi("age of scale")) then
		e.self:Say("The Age of Scale was the time when dragons ruled supreme. They controlled the lands, the sea, and the sky for some 3000 years. That was when [other gods] took notice.");
	elseif(e.message:findi("other gods")) then
		e.self:Say("Tunare, the Mother of All, Prexus, the Oceanlord, and Brell Serilis, the Duke of Below formed a pact in response to Veeshans claim to Norrath. The elves, the dwarves, and the aquatic kedge were all created to help keep the dragons in check. Rallos Zek, the Warlord, learned of this pact and created the giants. This began the [Elder Age].");
	elseif(e.message:findi("elder age")) then
		e.self:Say("The Elder Age was the time of the first humanoid races, the oldest on Norath, next to the dragons. The elves prospered, while the giants struggled to survive. The giants on the frozen continent of Velious were in constant skirmishes with the dragons. It was at this point that the [observations] began.");
	elseif(e.message:findi("observations")) then
		e.self:Say("The giants, smarter than expected, began watching and observing the habits of the dragons. They paid close attention to the things the dragons avoided... certain plants and watering holes. It was determined that a particular type of [plant], when mixed with other reagents, was deadly to the dragons. The giants adapted their technique to specifically harm Yelinaks brood in order to give them an advantage. The ancient Kromzek king, Porlos, used this to aid in his battle with Hsagra, Yelinaks mate. Porlos killed Hsagra, forever bringing Yelinaks vengeance upon his family. Thus began the eternal war between the giants and the dragons.");
	elseif(e.message:findi("plant")) then
		e.self:Say("The name of the plant eludes me at this time, for my thoughts have grown cold through the ages. The findings of the giants were written in a book of lore by some of our sages. You should seek out one of the giants Tomekeepers. If you find a Tomekeeper, ask him about the herb that harms dragons. Perhaps if you give him this trinket he will assist you. Maybe they will remember my tired soul.");
 		e.other:SummonCursorItem(1782); -- Giant Loyalist Token
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1783}, 0)) then -- Giant Scalebound Tome
		e.self:Emote("takes the guide and immediately begins to scan through it. He then says, 'Ah... Ah yes... According to this book, the dragonbane herb grows only in one place, deep inside the lair of the sirens. If my memory serves me properly one of the creatures there is very fond of its flavor. I will also need the blood of a dragon, but not just any dragon. The blood must come from a beast of Lord Yelinak's bloodline. Please go now and see if you can find this herb and the dragon blood. No time to waste, child. You will need to take this box to contain and combine the herbs and dragon blood in. Once you have accomplished this, please return the box to me.");
		e.other:QuestReward(e.self,0,0,0,0,17059); -- Ornate Reagent Box
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1786}, 0)) then -- Sealed Reagent Box
		e.self:Say("Ahhh! With the knowledge that I have gained from the Giant Scalebound Tome and these reagents, I can finish my research and create a most powerful spell for you! If successful, I will call it the Porlos' Fury spell. It will cause near fatal wounds to any dragon or dragon kin in Lord Yelinak's bloodline. Take this and study it. The magiks contained within will aid you in your fight. The Dragon Sage hands you the scroll and says, 'You will need a reagent to channel the magical energies through to enhance the power of the spell. Two peridots will be required to cast this spell. I wish you good fortune in your fight.");
		e.other:QuestReward(e.self,0,0,0,0,19469); -- Porlos' Fury
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
