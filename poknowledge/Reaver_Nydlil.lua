--Reaver_Nydlil.pl
--Shadowknight PoP Spells
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("'s voice spills forth in a piercing hiss, the pitch high and accented in the tones of the Iksarian Empire of old.");
		e.self:Say("Welcome to New Tanaan, and stand before us as enemies not, but as equals. Your mind should be open to us, for we wish only to guide you where we have been led in our years beyond Norrath. If you are a knight of the shadows, then perhaps I may be of service in guiding you further to power. The adepts of New Tanaan, the scholars, have come forward and penned spells of our former lives in memory. We wish to share this knowledge with you without bias or judgment. There is more beyond the mortal limits of magic that I can aid you to attain should you wield the blade of the shadow. If you happen across a seemingly mundane arcane item of incorporeal material, do not discard it. Return it to me and I shall carve for you from its essence a most powerful spell conceived in the divine realms of pure magic.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("accepts the item carefully, his scaled hand delicate in its grasp. The iksar takes note of every detail upon the untainted planar arcane item before closing his eyes and giving forth a drawled, hissing chant of sounds and foreign words. The object in the shadowknight's hands begins to radiate in a dark aura as it pulses in and out of reality -- every beat of its wavering existence bringing it closer to a tangible state. Eventually, the item becomes whole, and the crimson runes, seemingly forged of blood from an unknown source, are flawless in their construction. The iksar opens his eyes and inspects the completed scroll briefly before handing it to you, 'This will serve you well, " .. e.other:GetCleanName() .. ". Go to the realms of the divine and see exactly what new power has been granted to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26920, 26924, 26921, 26925, 26937)); --Level 61 or 62 Class spell, PoP (Festering Darkness, Aura of Darkness, Touch of Volatis, Zevfeer's Bite, Deny Undead)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("accepts the item carefully, his scaled hand delicate in its grasp. The iksar takes note of every detail upon the untainted planar arcane item before closing his eyes and giving forth a drawled, hissing chant of sounds and foreign words. The object in the shadowknight's hands begins to radiate in a dark aura as it pulses in and out of reality -- every beat of its wavering existence bringing it closer to a tangible state. Eventually, the item becomes whole, and the crimson runes, seemingly forged of blood from an unknown source, are flawless in their construction. The iksar opens his eyes and inspects the completed scroll briefly before handing it to you, 'This will serve you well, " .. e.other:GetCleanName() .. ". Go to the realms of the divine and see exactly what new power has been granted to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21651, 26922, 26923, 21632, 21634, 21633)); --Level 63 or 64 Class spell, PoP (Shroud of Chaos, Aura of Pain, Terror of Thule, Blood of Hate, Pact of Hate, Spear of Decay)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("accepts the item carefully, his scaled hand delicate in its grasp. The iksar takes note of every detail upon the untainted planar arcane item before closing his eyes and giving forth a drawled, hissing chant of sounds and foreign words. The object in the shadowknight's hands begins to radiate in a dark aura as it pulses in and out of reality -- every beat of its wavering existence bringing it closer to a tangible state. Eventually, the item becomes whole, and the crimson runes, seemingly forged of blood from an unknown source, are flawless in their construction. The iksar opens his eyes and inspects the completed scroll briefly before handing it to you, 'This will serve you well, " .. e.other:GetCleanName() .. ". Go to the realms of the divine and see exactly what new power has been granted to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(26926, 26927, 26928, 21635)); --Level 65 Class spell, PoP (Voice of Thule, Aura of Hate, Touch of Innoruuk, Cloak of Luclin)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
