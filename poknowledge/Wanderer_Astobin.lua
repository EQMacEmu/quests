--Druid PoP Spells
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings traveler. I am Wanderer Astobin, warden of nature and guardian of Tunare's most blessed and sacred of treasures -- life and balance. I have pledged my existence to upholding this vow and even here, that vow remains. Though I no longer carry my scimitar or scout the wilds of the world as one of its many guardians, my pledge shall remain whole through my guidance of others whose pledge is akin to mine. If you are a druid -- your deity matters not -- then allow me to guide you if I may. What spells I have scribed are for you to search through and purchase should you find them worthy of your abilities. If through your travels in the outer planes you discover incorporeal items seemingly of an arcane nature, do not disregard them. I am well-trained in the ways and manner of planar magic and will be more than willing to turn these fledgling arcane items into tangible spells suited for those of druidic vows.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26943, 28524, 28525, 28526, 28564, 21656, 28527, 28528, 28529, 28530)); --Level 61 or 62 Druid spell, PoP (Earthen Roots, Storm's Fury, Hand of Ro, Winter's Storm, Catastrophe, Flight of Eagles, Immolation of Ro, Karana's Rage, Nature's Might, Ro's Illumination)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21658, 21659, 28531, 28532, 28533, 28535, 28536, 28538, 21657, 28534, 28537, 28539, 28540)); --Level 63 or 64 Druid spell, PoP (Protection of the Nine, Destroy Summoned, Blessing of Replenishment, E'ci's Frosty Breath, Nature's Infusion, Command of Tunare, Swarming Death, Shield of Bracken, Karana's Renewal, Protection of Seasons, Savage Roots, Summer's Flame, Brackencoat)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("respectfully accepts the item, holding it in his hands like one would a delicate and priceless relic. His eyes scan its every surface in a detailed study before he closes his eyes and begins to weave a chant of unknown dialect and origin. As the druid's voice filters softly through the area, the object in his hand begins to fade into this existence, its intangible state destroyed beneath the druid's magic. Runes begin to appear upon the fully manifested scroll -- runes of a druidic decent. The druid ceases his chanting and then slowly hands the item to you, 'This is a spell of great power. Use it wisely and with caution, for to abuse the gifts of nature is to corrupt our sole purpose.'");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28645, 28541, 28542, 28543)); --Level 65 Druid spell, PoP (Legacy of Bracken, Blessing of the Nine, Winter's Frost, Mask of the Forest)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
