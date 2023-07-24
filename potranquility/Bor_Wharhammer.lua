-- Bor_Wharhammer
-- PoP quest armors

function event_say(e)
	e.self:DoAnim(49);  -- does this animation regardless of phase
	if(e.message:findi("hail")) then
		e.self:Say("Greetin's t'ye " .. e.other:GetCleanName() .. "! Isn't the area 'round 'ere so nice an' quiet? Such a departure from me old days; slaving o'er the forge t'create masterpieces! T'be 'onest. at times I do miss the old forge. but after I created me finest breastplate, it seemed as if nothing else I made could ever live up t'it. So I left me home to'wander the land an' see what I could learn o'the world. I 'ave learned quite a bit from the elders 'ere an' the skilled craftspeople in New Tanaan. I 'ave even devised a type o'emblem that will impart the magic o'tranquility into the user t'create planar armors from pieces o'energy found in the planes.");
	elseif(e.message:findi("emblem")) then
		if (e.other:GetLevel() < 55) then
			e.self:Say("Ye look mighty inexperienced t'be in this area. " .. e.other:GetCleanName() .. ". Come an' seek me out when ye 'ave more knowledge o'the planes!");
        else
			e.self:Say("Well, the emblems dinnae be easy t'craft but I will gladly give ye one fer the price of 500 platinum pieces. They allow a planes traveler with no craftin' skills t'create many fine pieces o'planar armor in a special, magical kit I also 'ave an' will throw in with the price. The kit acts as a focal point fer the wild magic energy o'the Planes. Ye will only be able t'use each emblem an' kit once when ye create the piece, 'owever I dinnae be goin' anywhere soon! Just venture back when ye need another an' dinnae ferget the coin!");
		end
	elseif(e.message:findi("chain")) then
		e.self:Say("Ahhhhh " .. e.other:GetCleanName() .. "! Chain armors, while not as sturdy as plate, provide so much more mobility if constructed properly. T'construct a piece o'chain armor, ye need t'combine a chain pattern, an emblem, various amounts of ethereal metal rings an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal ring construction is another matter. Ye will need to combine a brick o'ethereal energy, an ethereal temper an' a file within a Tanaan forge. I would seek a skilled craftsperson t'make the rings fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
	elseif(e.message:findi("silk")) then
		e.self:Say("Har! It be quite funny that we be referin' t'silk as armor, fer the amount o'protection it provides be miniscule at best. The planar armor made from strands o'ether can still be quite useful fer its magical properties, 'owever. Ye will need t'take up a Tanaan embroidery needle, a pattern, an emblem an' various amounts o'ether silk swatches t'create a piece. Craft it all within a sewing kit boilin' with magical energy.");
	elseif(e.message:findi("leather")) then
		e.self:Say("Leather armor provides little protection due t'the make-up o'the materials. We shall do our best, 'owever, t'see ye make a quality piece. T'do so, ye must combine a pattern, an emblem, various pieces o'cured ethereal energy an' a Tanaan embroidery needle all within a sewing kit boilin' with magical energy. The cured energy may be problematic fer an unskilled craftsman, 'owever. Just sew two silk ethereal swatches together using a Tanaan embroidery needle within a Tanaan loom. I can just imagine yer next question t'be about swatches, aye?");
	elseif(e.message:findi("plate")) then
		e.self:Say("Ahhhhh " .. e.other:GetCleanName() .. "! The fine rigid armor that can stop a shaft from piercing yer heart! Too bad it be so cumbersome an' difficult t'move about in. To construct a piece o'plate armor, ye need t'combine a plate mold, an emblem, various amounts o'sheet metal an' use one o'those crafty Tanaan smithin' 'ammers all within a furnace touched by Ro. Ethereal metal sheet construction is another matter. Ye will need t'combine two bricks o'ethereal energy, an ethereal temper an' a Tanaan smithin' 'ammer within a Tanaan forge. I would seek a skilled craftsperson t'make the metal sheets fer ye; the emblem will enable ye t'craft the final armor piece no matter what yer skill be.");
	elseif(e.message:findi("swatch")) then
		e.self:Say("T'make a swatch, ye need t'combine two strands o'ether along with a curing agent in a Tanaan loom. Ye will need t'seek a skilled brew master t'make the curing agent fer ye. Just 'ave them create it by using two celestial essences, soda an' paeala sap");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetLevel() > 54 and item_lib.check_turn_in(e.self, e.trade, {platinum = 500}, 0)) then -- Must be level 55 or higher
		if((e.other:GetClass() >= 1 and e.other:GetClass() <= 5) or (e.other:GetClass() >= 8 and e.other:GetClass() <= 10)) then
			e.other:SummonCursorItem(17184);
		else
			e.other:SummonCursorItem(17185);
		end

		if (e.other:GetClass() == 1) then
			e.other:SummonCursorItem(16267); -- Mystical Furnace of Ro, Warrior Emblem
		elseif (e.other:GetClass() == 2) then
			e.other:SummonCursorItem(16271); -- Mystical Furnace of Ro, Cleric Emblem
		elseif (e.other:GetClass() == 3) then
			e.other:SummonCursorItem(16269); -- Mystical Furnace of Ro, Paladin Emblem
		elseif (e.other:GetClass() == 4) then
			e.other:SummonCursorItem(16272); -- Mystical Furnace of Ro, Ranger Emblem
		elseif (e.other:GetClass() == 5) then
			e.other:SummonCursorItem(16270); -- Mystical Furnace of Ro, Shadowknight Emblem
		elseif (e.other:GetClass() == 6) then
			e.other:SummonCursorItem(16276); -- Druzzil's Mystical Sewing Kit, Druid Emblem
		elseif (e.other:GetClass() == 7) then
			e.other:SummonCursorItem(16275); -- Druzzil's Mystical Sewing Kit, Monk Emblem
		elseif (e.other:GetClass() == 8) then
			e.other:SummonCursorItem(16268); -- Mystical Furnace of Ro, Bard Emblem
		elseif (e.other:GetClass() == 9) then
			e.other:SummonCursorItem(16273); -- Mystical Furnace of Ro, Rogue Emblem
		elseif (e.other:GetClass() == 10) then
			e.other:SummonCursorItem(16274); -- Mystical Furnace of Ro, Shaman Emblem
		elseif (e.other:GetClass() == 11) then
			e.other:SummonCursorItem(16278); -- Druzzil's Mystical Sewing Kit, Necromancer Emblem
		elseif (e.other:GetClass() == 12) then
			e.other:SummonCursorItem(16279); -- Druzzil's Mystical Sewing Kit, Wizard Emblem
		elseif (e.other:GetClass() == 13) then
			e.other:SummonCursorItem(16280); -- Druzzil's Mystical Sewing Kit, Magician Emblem
		elseif (e.other:GetClass() == 14) then
			e.other:SummonCursorItem(16281); -- Druzzil's Mystical Sewing Kit, Enchanter Emblem
		elseif (e.other:GetClass() == 15) then
			e.other:SummonCursorItem(16277); -- Druzzil's Mystical Sewing Kit, Beastlord Emblem
		end
		e.self:Say("Wonderful! This coin will go towards me fines with the Myrist library. They charge quite a bit fer overdue volumes! 'ere be yer emblem an' a kit in which ye may craft planar armor. The kit only 'as enough magical energy t'craft one piece before the energies expire, be sure ye understand. May the armor ye make with it provide ye with much protection.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
	if(e.other:GetLevel() < 55) then
		 e.self:Say("Ye look mighty inexperienced t'be in this area. " .. e.other:GetCleanName() .. ". Come an' seek me out when ye 'ave more knowledge o'the planes!");
	end
end
