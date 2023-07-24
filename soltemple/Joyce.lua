-- Magician Quests

function event_say(e)
	if(e.other:GetFactionValue(e.self) >= 0) then	
		if(e.message:findi("hail")) then
			e.self:Say("I am Joyce of the Temple of Solusek Ro. I am the guardian of four of the items of the elementalist. If you are a magician, ask me about the [Robe of the Elements], the [Clay Bracelet], the [Earthen Boots] or the [Circlet of Mist]");
		elseif(e.message:findi("mist")) then
			e.self:Say("The Circlet of Mist is a beautiful hoop that would look good atop your head. It produces a fine gleam, and is known to increase your mental power. Are you [interested in the circlet]?");
		elseif(e.message:findi("circlet")) then
			e.self:Say("I will construct for you a Circlet of Mist, but I will need you to bring me the proper components. Bring me a globe of mist from a festering hag in the Estate of Unrest, a watery ring from an aqua goblin tidal lord in Dagnor's Cauldron, a ring of Evoluoy from one of the larger alligators in the Temple of Cazic-Thule and a sapphire. Bring me these components, and I will construct for you a Circlet of Mist.");
		elseif(e.message:findi("clay")) then
			e.self:Say("The clay bracelet is a wonderful piece of jewelry to wear on your wrist. It provides fine protection, enhances your resistance to magic, and lets you call forth a mystic eye to help you in your travels. Are you [interested in the bracelet]?");
		elseif(e.message:findi("bracelet")) then
			e.self:Say("I will make you a clay bracelet, but you will need to bring me the proper components. I will need each of the four runes of clay. Three of them can be found in the Rathe Mountains, held by gnomish necromancers. The fourth one is somewhere in the Ocean of Tears, held by a goblin headmaster. Bring me these four components, and I will make you a clay bracelet.");
		elseif(e.message:findi("earthen")) then
			e.self:Say("Earthen Boots are a fine adornment for the feet of any Magician. They have a wonderful brown color, and are known to enhance the stamina of any Magician who wears them. As an added bonus, animals do not tend to notice those who wear Earthen Boots. Are you [interested in the boots]?");
		elseif(e.message:findi("boots")) then
			e.self:Say("I will cobble you a pair of earthen boots, but you will need to bring me the proper components. I need a stone marker from a glyphed guard in Castle Mistmoore, a heart of stone from the stone skeleton near Lake Rathe, soiled boots from a froglok tonta knight in the caverns of Guk and a cat's eye agate. Bring me these four items, and I will cobble you a pair of earthen boots.");
		elseif(e.message:findi("elements")) then
			e.self:Say("The Robe of the Elements is a fine cloak for a Magician. It provides protection from the elements, protection from melee attacks and aids the Magician with her focus. Are you [interested in the robe]?");
		elseif(e.message:findi("robe")) then
			e.self:Say("I will make for you the Robe of the Elements, but I will be needing the proper components. I will be needing a fire goblin skin, a frost goblin skin, a Twice-Woven Cloak which can be found on Faerie Guards in the Faydark, and a scroll of elemental armor. Return to me with these items and I will craft your robe.");
		end
	else
		e.self:Say(eq.ChooseRandom("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.","Is that your BREATH, or did something die in here?  Now go away!","I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.","Oh look..a talking lump of refuse..how novel!"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Solusek Ro does not believe in half measures.";
	
	--circlet
	if(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10545, item2 = 10547, item3 = 10034, item4 = 10546},1,text)) then
		e.self:Say("Astounding! You found all four components that I need to make the Circlet of Mist. Wasn't that ring annoying ? I always find goblins hard to deal with. Well done! Take this circlet with my complements.");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,2358,500);
	--bracelet
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10539, item2 = 10542, item3 = 10540, item4 = 10541},1,text)) then
		e.self:Say("One, two, three.. all four runes of clay! I knew you looked competent. I am very impressed! Please take the Clay Bracelet that you have earned.");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,2359,500);
	--boots
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10543, item2 = 10026, item3 = 10544, item4 = 2363},1,text)) then
		e.self:Say("Marker, heart, boots and gem. All four items that I need to cobble earthen boots for you. Well done! Take these boots, and may they serve you well!");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,2357,500);
	--robe
	elseif(e.other:GetFactionValue(e.self) >= 0 and item_lib.check_turn_in(e.self, e.trade, {item1 = 2361, item2 = 2362, item3 = 15109, item4 = 2360},1,text)) then
		e.self:Say("Oh, you brought me all of the components! I knew you could do it. It is my pleasure to give you a Robe of the Elements.");
		e.other:Faction(e.self,415,5); -- Faction: Temple of Sol Ro
		e.other:Faction(e.self,416,-1); -- Faction: Shadowed Men
		e.other:QuestReward(e.self,0,0,0,0,1356,500);
	end
end

-- Quest edited by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
