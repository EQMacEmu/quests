function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings traveler and welcome to the Plane of Knowledge! I am so pleased to see so many eager minds among us -- for it has been so long since I have had the meaningful presence of a pupil. If by chance you practice the art of Enchantments. then I might be of service to you. I have penned many spells from memory as a wandering enchanter and scholar of Norrath's history and though these spells are nothing unique or rare unto your world. they may provide some aid to you while you are here. Also. if you happen upon a seemingly meaningless item of arcane nature -- you will recognize these specific items I speak of by their corporeal state of existence -- then do not hesitate to take them up and return them to me. I know a thing or two regarding planar magic and can turn these seemingly mundane items into enchantments of great power.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("accepts the item quite eagerly. With wide-eyes, the enchanter carefully examines every aspect of the fledgling arcane item. Eventually, she begins to weave a soft chant of arcane words -- their nature familiar to you of the art of enchantment, though they remain foreign in dialect and meaning. Eventually, the enchanter grows silent and the object cradled in her hands is whole and born anew. Golden runes line the tangible parchment -- runes of arcane enchantment. The enchantress then extends the item to you in gracious and unconditional offering, ''You have done well in recovering this, " .. e.other:GetCleanName() .. ". I am quite surprised that you were able to find one, for they are rare indeed. In any case, I have turned it into something that may prove useful to you as your journeys upon the planes continue.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26944, 28413, 28643, 28644, 28452, 28453, 26947, 21665, 21667, 28455, 28457, 28469, 21639)); --Level 61 or 62 Enchanter spell, PoP (Greater Fetter, Shield of the Arcane, Arcane Rune, Boggle, Howl of Tashan, Rune of Zebuxoruk, Pacification, Speed of Vallon, Guard of Druzzil, Strangle, Beckon, Word of Morell, Aeldorb's Animation)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("accepts the item quite eagerly. With wide-eyes, the enchanter carefully examines every aspect of the fledgling arcane item. Eventually, she begins to weave a soft chant of arcane words -- their nature familiar to you of the art of enchantment, though they remain foreign in dialect and meaning. Eventually, the enchanter grows silent and the object cradled in her hands is whole and born anew. Golden runes line the tangible parchment -- runes of arcane enchantment. The enchantress then extends the item to you in gracious and unconditional offering, ''You have done well in recovering this, " .. e.other:GetCleanName() .. ". I am quite surprised that you were able to find one, for they are rare indeed. In any case, I have turned it into something that may prove useful to you as your journeys upon the planes continue.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21666, 28458, 28460, 28461, 28464, 28415, 28459, 28465, 28468)); --Level 63 or 64 Enchanter spell, PoP (Night's Dark Terror, Torment of Scio, Tranquility, Uproar, Sleep, Shield of Maelin, Insanity, Command of Druzzil, Bliss)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("accepts the item quite eagerly. With wide-eyes, the enchanter carefully examines every aspect of the fledgling arcane item. Eventually, she begins to weave a soft chant of arcane words -- their nature familiar to you of the art of enchantment, though they remain foreign in dialect and meaning. Eventually, the enchanter grows silent and the object cradled in her hands is whole and born anew. Golden runes line the tangible parchment -- runes of arcane enchantment. The enchantress then extends the item to you in gracious and unconditional offering, ''You have done well in recovering this, " .. e.other:GetCleanName() .. ". I am quite surprised that you were able to find one, for they are rare indeed. In any case, I have turned it into something that may prove useful to you as your journeys upon the planes continue.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21648, 21664, 28470)); --Level 65 Enchanter spell, PoP (Illusion Froglok, Vallon's Quickening, Voice of Quellious)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--quest by Kilelen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
