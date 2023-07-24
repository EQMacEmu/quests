--Magician PoP Spells/Songs
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, traveler! I am Somat, Elementalist extraordinaire and one of several of my trade here in New Tanaan. We have all spent much time preparing for your arrival and hope that our time is not in vain. If you are a wielder of the elemental forces, then come and browse my inventory, friend! I may hold a spell or two that might pique your interest. Also, if you perhaps hold a seemingly mundane item of arcane relation that you found in your travels upon the planes, then do not hesitate to let me have a look at it. Don't worry -- we are not thieves here! Rather, we wish to aid you and I so love dabbling in the chaos of planar magic!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ethereal = item_lib.count_handed_item(e.self, e.trade, {29112}); --Ethereal Parchment
	local spectral = item_lib.count_handed_item(e.self, e.trade, {29131}); --Spectral Parchment
	local glyphed = item_lib.count_handed_item(e.self, e.trade, {29132}); --Glyphed Rune Word
	if(ethereal > 0) then
		repeat
			e.self:Emote("takes the planar arcane item and examines it with a strange glance in his eye. At first he seems overly excited -- like a child who has been handed a new toy, but then his glance changes into something that had previously seemed impossible of his charming features -- a stern seriousness. The gnome closes his eyes and begins a soft chant beneath his breath. The words are barely audible beneath the slow, gentle vibration that rings through the air around the both of you. The item seems to grow more real and tangible, its incorporeal state completely rent beneath the magician's spell. The gnome eventually opens his eyes and scans the arcane runes, scribed in fiery red, pale blue, crystal, and a deep emerald hue. He then nods in approval and extends the scroll to you, 'There you go, friend! This should do quite nicely, indeed!");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21641, 21642, 32411, 29357, 29358, 29359, 29360, 29361, 28413, 28428, 28440, 21637, 21643, 21646, 21669, 28430, 28431)); --Level 61 or 62 Magician spell, PoP (Belt of Magi'Kot, Blade of Walnan, Flameshield of Ro, Summon Platinum Choker, Summon Runed Mantle, Summon Sapphire Bracelet, Summon Spiked Ring, Summon Glowing Bauble, Shield of the Arcane, Ward of Xegony, Elemental Barrier, Xegony's Phantasmal Guard, Fist of Ixiblat, Talisman of Return, Burnout V, Sun Storm, Servant of Marr)
			ethereal = ethereal - 1;
		until ethereal == 0;
	end
	if(spectral > 0) then
		repeat
			e.self:Emote("takes the planar arcane item and examines it with a strange glance in his eye. At first he seems overly excited -- like a child who has been handed a new toy, but then his glance changes into something that had previously seemed impossible of his charming features -- a stern seriousness. The gnome closes his eyes and begins a soft chant beneath his breath. The words are barely audible beneath the slow, gentle vibration that rings through the air around the both of you. The item seems to grow more real and tangible, its incorporeal state completely rent beneath the magician's spell. The gnome eventually opens his eyes and scans the arcane runes, scribed in fiery red, pale blue, crystal, and a deep emerald hue. He then nods in approval and extends the scroll to you, 'There you go, friend! This should do quite nicely, indeed!");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(21644, 29362, 28432, 28433, 28497, 16341, 29363, 21645, 21659, 21668, 28415, 28434)); --Level 63 or 64 Magician spell, PoP (Blade of The Kedge, Summon Jewelry Bag, Black Steel, Child of Ro, Malosinia, Elemental Silence, Maelstrom of Ro, Girdle of Magi'Kot, Destroy Summoned, Planar Renewal, Shield of Maelin, Maelstrom of Thunder)
			spectral = spectral - 1;
		until spectral == 0;
	end
	if(glyphed > 0) then
		repeat
			e.self:Emote("takes the planar arcane item and examines it with a strange glance in his eye. At first he seems overly excited -- like a child who has been handed a new toy, but then his glance changes into something that had previously seemed impossible of his charming features -- a stern seriousness. The gnome closes his eyes and begins a soft chant beneath his breath. The words are barely audible beneath the slow, gentle vibration that rings through the air around the both of you. The item seems to grow more real and tangible, its incorporeal state completely rent beneath the magician's spell. The gnome eventually opens his eyes and scans the arcane runes, scribed in fiery red, pale blue, crystal, and a deep emerald hue. He then nods in approval and extends the scroll to you, 'There you go, friend! This should do quite nicely, indeed!");
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(28435, 28436, 16342)); --Level 65 Magician spell, PoP (Rathe's Son, Sun Vortex, Call of the Arch Mage)
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
