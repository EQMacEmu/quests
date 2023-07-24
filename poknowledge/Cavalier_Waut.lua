--Paladin PoP Spells
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day t'ye, traveler. The adepts of New Tanaan 'ave worked very laboriously t'properly welcome ye t'the Plane of Knowledge. Many of us 'ave delved into the past lives of our ventures upon Norrath an' 'ave brought forth from the recesses of our memories the spells that we once wielded as might t'our cause. Now, we no longer be needin' them, but we understand that ye may very well find them t'be of use yet. Oh, and if ye find an item of arcane nature though it seems t'be mundane or useless t'ye, dinnae disregard it! The planes 'old many items that are not what they seem, friend. Return such incorporeal runes and scrolls t'me and I shall make them spells worhty of any crusading paladin!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("accepts the item carefully, studying it with great caution as she handles it in her small hands. The paladin then nods softly to herself as if in recognition or preparation and then closes her eyes. The dwarf's voice begins to spill softly across the area in a divine chant of reverence and prayer. As the dwarf speaks her indeciferable words, the item in her hand seems to grow corporeal and real. Runes form upon it in silvery script that seem to shimmer in the torch-cast light of Myrist. Eventually, she opens her eyes and inspects the item for a final time. Nodding to herself once more in satisfaction, she hands the scroll to you with a warm smile, ''This should de ye good, m'friend, I guarantee! Be careful, though, for this be a powerful spell not t'be underestimated or used without caution or respect.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26945, 21631, 26941, 21652, 26933, 26937)); --Level 61 or 62 Paladin spell, PoP (Greater Immobilize, Touch of Nife, Crusader's Touch, Force of Akilae, Ward of Nife, Deny Undead)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("accepts the item carefully, studying it with great caution as she handles it in her small hands. The paladin then nods softly to herself as if in recognition or preparation and then closes her eyes. The dwarf's voice begins to spill softly across the area in a divine chant of reverence and prayer. As the dwarf speaks her indeciferable words, the item in her hand seems to grow corporeal and real. Runes form upon it in silvery script that seem to shimmer in the torch-cast light of Myrist. Eventually, she opens her eyes and inspects the item for a final time. Nodding to herself once more in satisfaction, she hands the scroll to you with a warm smile, ''This should de ye good, m'friend, I guarantee! Be careful, though, for this be a powerful spell not t'be underestimated or used without caution or respect.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26934, 26939, 21654, 26935, 21649)); --Level 63 or 64 Paladin spell, PoP (Pious Might, Light of Nife, Aura of the Crusader, Quellious' Word of Serenity, Supernal Cleansing)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("accepts the item carefully, studying it with great caution as she handles it in her small hands. The paladin then nods softly to herself as if in recognition or preparation and then closes her eyes. The dwarf's voice begins to spill softly across the area in a divine chant of reverence and prayer. As the dwarf speaks her indeciferable words, the item in her hand seems to grow corporeal and real. Runes form upon it in silvery script that seem to shimmer in the torch-cast light of Myrist. Eventually, she opens her eyes and inspects the item for a final time. Nodding to herself once more in satisfaction, she hands the scroll to you with a warm smile, ''This should de ye good, m'friend, I guarantee! Be careful, though, for this be a powerful spell not t'be underestimated or used without caution or respect.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21653, 26936, 26938)); --Level 65 Paladin spell, PoP (Shackles of Tunare, Wave of Marr, Brell's Stalwart Shield)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
