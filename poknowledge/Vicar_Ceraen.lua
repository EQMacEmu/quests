--Cleric PoP Spells
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I am Ceraen, priest of Tunare and resident of New Tanaan for over three centuries of my existence. Do not fear those whom may have been your enemy upon the prime. The scholars are equal and without bias toward one another, thus there is no safer place in the cosmos than New Tanaan. Each resident strives to bring knowledge closer to the curious and willing, and I am not exempt from this." );
		e.self:Say("If you are a priest in your world and seek to gain a higher understanding of the divine power that your faith has allowed you to wield, then perhaps what spells I have penned from memory of your world would be of use. I have also mastered levels in the workings of planar magic and its chaotic ways of forming upon the manifested planes. If by chance you come across a fledgling arcane item -- you will know it for its incorporeal state -- then do not hesitate to bring it to me. I may be able to infuse it with the powers of the divine and forge from it a spell of priestly might.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting. As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, " .. e.other:GetCleanName() .. ". Use its power wisely.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28646, 28557, 28561, 28572, 21690, 26945,26946,28558, 28563, 28566, 28567, 28564, 26947)); --Level 61 or 62 Cleric spell, PoP (Faith, Symbol of Kazad, Ward of Gallantry, Tarnation, Sermon of Penitence, Petrifying Earth, Greater Immobilize, Virtue, Blessing of Reverence, Supernal Elixir, Condemnation, Catastrophe, Pacification)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting. As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, " .. e.other:GetCleanName() .. ". Use its power wisely.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21647, 28569, 28571, 28573, 28559, 28560, 28562)); --Level 63 or 64 Cleric spell, PoP (Kazad's Mark, Hammer of Damnation, Supernal Light, Sound of Might, Destroy Undead, Mark of Kings, Word of Replenishment)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("takes the arcane item with great care and respect from you. For several moments the priest seems to enter a state of contemplative meditiation upon the arcane planar item. Suddenly, he begins a slow, soft chant -- a prayer whose dialect is unknown to your ears. Eventually, the arcane item in his hand begins to waver into this existence, its corporeal state rendered beneath the priest's chanting. As he grows quiet and calm once more, the priest hands the corporeal item to you -- the runes of divine power etched upon the tangible scroll, 'This should be of great use to you, " .. e.other:GetCleanName() .. ". Use its power wisely.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21689, 28555, 28565, 28568, 28570)); --Level 65 Cleric spell, PoP (Yaulp VI, The Silent Command, Armor of the Zealot, Mark of the Righteous, Hand of Virtue)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
