-- Rogue Epic NPC -- Eldreth

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Go away! I'm busy! I don't have time for scoundrels like you! Leave me alone or I shall, um..turn you into, er, a fish or something! That is what us powerful wizards do to those who annoy us! Yes, that is it. A fish! Did that sound scary enough?");
	elseif(e.message:findi("that was scary")) then
		e.self:Say("Ha! I knew it. I could see you trembling! Everyone fears an angry wizard and nobody wants to be a fish. I know I detest fish, it is always fish fish fish around here. Fish cakes, fish stew, fish wine, I am sick of fish. But alas, while I am a powerful wizard, I am also a poor one. Oh well, good things come to those who wait. So, why are you here, " .. e.other:Race() .. "?");
	elseif(e.message:findi("stanos sent me")) then
		e.self:Say("Stanos? Stanos Herkanor? I thought he was long dead. He nearly got me killed, in any case. What does the old fool want of me now?");
	elseif(e.message:findi("translate")) then
		e.self:Say("Ah, codes are my specialty! It's what I did for the Circle before Hanns took over. But the Fox is wrong. I owe him nothing! As a fact, he owes me! He wants this translated - he will have to pay!");
	elseif(e.message:findi("pay")) then
		e.self:Say("Aye, pay, and pay you must. I need 100 platinum pieces to begin my work. This tower is old and drafty and it will take that much to make it bearable. And while you're at it, I need something else. I am very busy here and have no time to shop, so bring me back a couple bottles of milk along with your very large bag of platinum, and I will translate anything you wish at that time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "looks at you, obviously expecting more. Did you forget the milk?";	
	
		if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13087, item2 = 13087, item3 = 28012, platinum = 100},1,nil,text)) then
			e.self:Say("Hmm, interesting. This document is not only encoded, but written in a very obscure language. From what I can gather, it's a variant of elder Teir'Dal, but not one I've encountered. I can not fully translate this, but I know one who can. Find Yendar and give him this.");
			e.other:Faction(e.self,342,400);--Order of Three
			e.other:Faction(e.self,221,-100);--Bloood Sabers
			e.other:Faction(e.self,262,60);--Guards of Qeynos
			e.other:Faction(e.self,296,-60);--Opal Dark Briar
			e.other:QuestReward(e.self,0,0,0,0,28053,500);
			eq.depop_with_timer();
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Zone: lakerathe ID:51025 -- Eldreth
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
