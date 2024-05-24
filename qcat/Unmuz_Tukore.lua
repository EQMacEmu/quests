function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Your eyes betray your eagerness and your naivety young one. I am Unmuz Tukore. Scourge Knight of the Bloodsabers. If you have come seeking the [training as a Shadowknight] then I will offer you guidance.");
		elseif(e.message:findi("training as a shadowknight")) then
			e.self:Say("We Scourge Knights of the Bloodsabers, often refered to as shadowknights by those less knowledgeable of our sect, are gifted by Bertoxxulous with prowess in combat and powers over the spirits and bodies of the dead. It is through discipline, training, and devotion to the Plague Lord that we are granted our powers. You must first equip yourself with a [suit of armor] to defend you in battle from the weapons of our [enemies].");
		elseif(e.message:findi("suit of armor")) then
			e.self:Say("Take this note to Wellis Pestule. He will assist you in obtaining your armor. Once you have been properly outfitted return to me. I will allow you to assist me with a [pressing matter].");
			e.other:SummonCursorItem(20206); -- Item: Note to Wellis Pestule
		elseif(e.message:findi("pressing matter")) then
			e.self:Say("The Knights of Thunder, the order of paladins loyal to Karana, the Storm Lord, have been paying close attention for signs of us Bloodsabers in the streets of Qeynos. By orders of Antonius Bayle known disciples of the Plague Lord are to be executed by the Knights of Thunder. A particular knight, Grennet Stormhands, has recently discovered the loyalties of a Bloodsaber member that held a valuable position among the merchants of Qeynos. Grennet is to be hunted and slain for our loss. Find this Knight of Thunder and bring me his head.");
		elseif(e.message:findi("enemies")) then
			e.self:Say("The Knights of Thunder and the Priests of Life are our primary foes, and the power behind the throne of Antonius Bayle IV. If it were not for their presence this city would have been claimed in the name of the Plague Lord long ago. Instead we are forced to hide our temple in the catacombs and move through the sewers to avoid the patrols of Qeynos Guards in the streets. Be mindful of your words when not within the walls of this temple. The Qeynos Guards would execute you for your allegiance to the Bloodsabers.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Your eyes betray your eagerness and your naivety young one. I am Unmuz Tukore. Scourge Knight of the Bloodsabers. If you have come seeking training as a Shadowknight then I will offer you guidance."); -- made up text	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20186})) then
		e.self:Say("Excellent, the Knights of Thunder must learn that by beginning an inquisition of the Bloodsabers they are effectively declaring war. Take this Rusty Scourge Knight Saber to a forge and sharpen it with a sharpening stone. It may take you several attempts if you are unfamiliar with the process. Once that is done take the Tarnished Scourge Knight Saber and a Giant King Snake Skin to Wellis Pestule and he will put the finsihing touches on the weapon.");
		e.other:Faction(e.self,221,10); -- Faction: Bloodsabers
		e.other:Faction(e.self,262,-1); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,296,1); -- Faction: Opal Dark Briar
		e.other:Faction(e.self,341,-2); -- Faction: Priests of Life
		e.other:Faction(e.self,230,1); -- Faction: Corrupt Qeynos Guards
		e.other:QuestReward(e.self,0,0,0,0,20187,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:qcat  ID:45068 -- Unmuz_Tukore
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
