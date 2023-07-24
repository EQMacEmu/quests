-- Xanthe's earring of nature and earring of the solstice - spell: protection of the cabbage

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("seems lost in thought and looks up only briefly from her work. 'Oh, hello " .. e.other:GetCleanName() .. ", welcome to the New Thicket Inn! If you'll excuse me, I'm a bit busy copying this [scroll]. I'll be with you in a moment to chat, or to trade if you've come about the [earring]'");
	elseif(e.message:findi("scroll")) then
		e.self:Emote("looks up again with a quiet smile, 'I'm making a copy of a new Protection spell, it's very exciting! The druids of Norrath have just completed an important ritual, and the gods have blessed us with this new spell! I'd be happy to scribe you a copy, if you were to fetch me the [ingredients].'");
	elseif(e.message:findi("ingredients")) then
		e.self:Say("Oh, let me see... I'll need a sheet of fancy Blessed parchment, a small flask of Dark Root ink, and of course a large quill. I think a Stormraven's quill would be best, certainly better than this one I've been using so far. Bring those items to me and I'll be happy to make you a copy for yourself. I'm not sure where you'll find all of those, I seem to have bought up the last of the stock in several places. Someone's bound to have them for sale, good luck with it!");
	elseif(e.message:findi("earring")) then
		e.self:Emote("looks up again, 'Oh, have you come about the earring then? That's wonderful! As you probably know, the druids have recently completed an ancient ceremony, and some delightful people who weren't druids were able to participate. Sadly though, only druid's were able to use the Earrings of Nature that were created with the ceremony. I've been collecting spare earrings of Nature from those who can't use them, and giving an Earring of the Solstice in return. It's a good deal all around, as we both can benefit from the trade. If you have an earring of Nature to trade, just give it to me and I'll happily swap you, and if you don't like it, you can give it back.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5761,item2 = 5762,item3 = 5766})) then -- turn in for spell only
		e.self:Emote("smiles warmly, 'Brilliant, you've brought me some more supplies! Here, please take this last copy I've made. I'd planned to use it for myself, but I'll let you use it so you don't have to wait for me to make a new one. I do hope you enjoy it!'");
		e.other:QuestReward(e.self,0,0,0,0,9722);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 9721}, 0)) then
		e.self:Say("Here you are friend, an earring of the Solstice. I'll see that your old earring goes to a druid who can make better use of it. Safe travels, friend!");
		e.other:QuestReward(e.self,0,0,0,0,28771);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 28771}, 0)) then
		e.self:Say("Here you are friend, Xanthe's Earring of Nature. I'll see that your old earring goes to someone who can make better use of it. Safe travels, friend!");
		e.other:QuestReward(e.self,0,0,0,0,9721);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

