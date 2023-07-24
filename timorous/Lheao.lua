function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("jumps at your voice and begins laughing at his skittishness. 'Ahh, hello there. Not many people know of this place, so visitors are quite rare. Hehehe. Its a very beautiful place indeed, so.. ummm, dont go telling everyone you know about it. Heheh. Thanks, Friend.'");
	elseif(e.message:findi("immortals")) then
		-- Monk Epic 1.0
		e.self:Emote("looks up at you, eyes wide in astonishment. 'My god, you found Immortals?! Where did you find it? Nevermind, that is unimportant. I have in my possession a book that explains more of these individuals. Its value is unimaginable as well as the impact it is capable of. As you can see, I grow old. I need an individual to watch over this book and make sure it is protected. Would you be willing to take this [responsibility]?'");
	elseif(e.message:findi("responsibility")) then
		-- Monk Epic 1.0
		e.self:Say("Im sorry, " .. e.other:GetCleanName() .. ", but I could only give this book to a true master, such as a member of the Whistling Fists Order. And unless you can give me proof that you are one, in addition to Danls reference, which is very unlikely, there is no way I'll let you take charge of the [Celestial Fists].");
	elseif(e.message:findi("celestial fists")) then
		-- Monk Epic 1.0
		e.self:Say("The Celestial Fists is the title of a book written by an unknown author. His writing is sub par but the legend is interesting from a biographical standpoint alone. Its rarity commands top dollar in the scholarly community but the secrets revealed in the book are what truely makes it dangerous. I hope Im able to find someone to watch over it soon.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Handin: Robe of the Whistling Fists & Danl's Reference
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12970, item2 = 1682})) then
		-- Monk Epic 1.0
		e.self:Say("Astonishing! To think that you are a master of an order thought to be lost in our world. Forgive my earlier doubts. I believe you are indeed worthy to be given the responsibility of watching over this book. Take great care that it does not fall into the wrong hands as it would be truly disatrous.");
		-- Summon: Celestial Fists (Book)
		e.other:QuestReward(e.self,0,0,0,0,1683);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
