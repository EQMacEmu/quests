function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Draan N'Ryt, provider of the purest [adamantite ore] and master smith of [adamantite chainmail]!");
	elseif(e.message:findi("adamantite ore")) then
		e.self:Say("Adamantite ore is a very special metal that we smith in our unique Teir'Dal forge with our highly specialized techniques. It is also used by ogres in the crafting of their war plate and weapons. Adamantite ore can be worked like standard ores into bricks, blocks, and sheets but must be tempered with Neriak Nectar instead of water. Folded sheets of adamantite must also be tempered with Neriak Nectar and must be hammered with our Teir'Dal smithy hammer instead of the crude standard one. Our Teir'Dal enchanters have also developed the means to enchant small bricks of adamantite. Ogres may work adamantite ore in their forge as well but they must temper it with Ogre Swill instead of Neriak Nectar and because of their immense strength still use the standard smithy hammer.");
	elseif(e.message:findi("adamantite chainmail")) then
		e.self:Say("Adamantite chainmail can only be crafted in our unique Teir'Dal forge using our highly specialized smithing techniques. It is a durable armor that is so light, it does not hinder even those who practice the mystical arts. All pieces of adamantite chainmail require the appropriate chain pattern for the piece desired, a Teir'Dal smithy hammer, a silk swatch, and shadow temper. Veils, neckguards, and bracelets require one set of adamantite rings. Coifs, mantles, skirts, sleeves, and gloves require two sets of adamantite rings. Tunics, capes, and leggings require three sets of adamantite rings. Once you have mastered the art of crafting adamantite chain you may want to attempt [enchanted adamantite] chainmail.");
	elseif(e.message:findi("enchanted adamantite")) then
		e.self:Say("Enchanted adamantite chainmail requires an appropriate chain pattern for the piece desired, a Teir'Dal smithy hammer, a silk swatch, and shadow temper. Like standard adamantite chain it may only be crafted in our Teir'Dal Forge but requires that the rings be crafted from enchanted adamanatite.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42086 -- Draan_N`Ryt

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
