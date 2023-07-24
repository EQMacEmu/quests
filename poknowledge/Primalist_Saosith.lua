--Beastlord PoP Spells
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome, traveler, to New Tanaan. All citizens of New Tanaan have come together in welcoming Norrath's curious travelers who crave knowledge and a path to better themselves individually. What little help I alone can offer is extended to the Beastlords of Norrath, for as I was once one of them in a time long since past. If you are a Beastlord, then perhaps what spells that I have penned, though neither unique nor rare to your world, would be of use. If through your endeavors upon the planes you happen to come across fledgling manuscripts -- similar to those upon which a spell or song is scribed -- then you may return them to me if you wish. I am quite versed in the ways of planar magics relating to the Beastlord's focus.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Say("The magic you have given me is quite potent, it should be a simple task to use primal forces to focus its magic into a spell.");
			e.self:Emote("closes her eyes and the object glows slightly in her hands.");
			e.self:Say("Here, I hope this will prove of some use to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28544, 28545, 21629, 28547, 28548)); --Level 61 or 62 Beastlord spell, PoP (Spirit of Arag, Infusion of Spirit, Healing of Sorsha, Scorpion Venom, Spiritual Vigor)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Say("The magic you have given me is quite potent, it should be a simple task to use primal forces to focus its magic into a spell.");
			e.self:Emote("closes her eyes and the object glows slightly in her hands.");
			e.self:Say("Here, I hope this will prove of some use to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28549, 28550, 21630, 28551, 28552)); --Level 63 or 64 Beastlord spell, PoP (Arag's Celerity, Spirit of Rellic, Frost Spear, Spiritual Dominion, Spirit of Sorsha)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Say("The magic you have given me is quite potent, it should be a simple task to use primal forces to focus its magic into a spell.");
			e.self:Emote("closes her eyes and the object glows slightly in her hands.");
			e.self:Say("Here, I hope this will prove of some use to you.");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28553, 28554)); --Level 65 Beastlord spell, PoP (Sha's Revenge, Ferocity)
			glyphed = glyphed - 1;
		until glyphed == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
