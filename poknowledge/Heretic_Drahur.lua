--Necromancer PoP Spells
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Salutations. The keepers of necromancy in New Tanaan are neither your enemy or foe, as they may have been upon the material world of Norrath. Though our natures are in tact, we have elevated ourselves beyond the petty, debased bickering that Norrath has come to embody over the passing eras. All adventurers and intelligent beings are welcome in our midst, for we share only the common goal of knowledge and personal betterment in our power. I have gathered tomes and spells that I no longer have use for, as I have ascended beyond Norrath's limitations of the dark arts. However, you remain a mortal still and your abilities may never reach the esteemed levels of ours, bur do not let this discourage you. Search my tomes and perhaps I hold something of importance or relevance to your current quest for power. There is another realm of magic that I am quite familiar with, as well -- the aspects of planar magic.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("takes the arcane item from you. The erudite inspects the incorporeal item for a brief amount of time. He then closes his eyes and begins a dark chant that causes the air about you to grow cold and stiff - your breathing is briefly impaired and for a single moment, you feel as if you are about to suffocate. As the erudite's voice falls back to silence, the discomfort fades and you look upon the item in his hands. It is corporeal now - tangible in all aspects. Runes of inky black have formed upon the item - runes that you recognize immediately as those of necromantic foundations. The erudite gives a gentle nod of his head and hands the scroll to you, 'This should prove more than useful for your endeavors in the planes. However, it extends beyond such limits and can be applied to the primordial world.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26945, 21638, 21640, 28413, 28417, 26946, 28418, 28419)); --Level 61 or 62 Necromancer spell, PoP (Greater Immobilize, Touch of Mujaki, Neurotoxin, Shield of the Arcane, Legacy of Zek, Petrifying Earth, Rune of Death, Saryrn's Kiss)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("takes the arcane item from you. The erudite inspects the incorporeal item for a brief amount of time. He then closes his eyes and begins a dark chant that causes the air about you to grow cold and stiff - your breathing is briefly impaired and for a single moment, you feel as if you are about to suffocate. As the erudite's voice falls back to silence, the discomfort fades and you look upon the item in his hands. It is corporeal now - tangible in all aspects. Runes of inky black have formed upon the item - runes that you recognize immediately as those of necromantic foundations. The erudite gives a gentle nod of his head and hands the scroll to you, 'This should prove more than useful for your endeavors in the planes. However, it extends beyond such limits and can be applied to the primordial world.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28414, 28420, 28421, 28422, 28415, 28423, 28424, 28559)); --Level 63 or 64 Necromancer spell, PoP (Force Shield, Death's Silence, Embracing Darkness, Saryrn's Companion, Shield of Maelin, Seduction of Saryrn, Touch of Death, Destroy Undead)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("takes the arcane item from you. The erudite inspects the incorporeal item for a brief amount of time. He then closes his eyes and begins a dark chant that causes the air about you to grow cold and stiff - your breathing is briefly impaired and for a single moment, you feel as if you are about to suffocate. As the erudite's voice falls back to silence, the discomfort fades and you look upon the item in his hands. It is corporeal now - tangible in all aspects. Runes of inky black have formed upon the item - runes that you recognize immediately as those of necromantic foundations. The erudite gives a gentle nod of his head and hands the scroll to you, 'This should prove more than useful for your endeavors in the planes. However, it extends beyond such limits and can be applied to the primordial world.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28416, 28425, 28427)); --Level 65 Necromancer spell, PoP (Blood of Thule, Child of Bertoxxulous, Word of Terris)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- quest by Kilelen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
