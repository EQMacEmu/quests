--Merri's Artifact Collection/The Collector's Box

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("beams a smile as you approach. 'Welcome " .. e.other:GetCleanName() .. ". This building will be the site of New Tanaan's greatest museum ever. I realize it looks a bit empty now, but just imagine how beautiful it will look after we fill it with rare and exotic treasures from all over. It's a very exciting time, no? Of course, we still need to obtain a few more [artifacts].'");
	elseif(e.message:findi("artifacts")) then
		e.self:Say("Each of the people you see working here has their own exhibit to build and maintain. If you speak to them, they can tell you about which items they are looking for to add to their collection. Any items you collect will need to be placed inside one of my storage containers. If you [need a Collector's Box] at any time, just ask me. Also know I could use some help in retrieving some [special items] for my own exhibit.");
	elseif(e.message:findi("special items")) then
		e.self:Say("My display will showcase the many interesting religious idols and artifacts from Norrath's history. Most of my gallery is complete, but I still need a few more items. I am looking for a Forlorn Totem of Rolfron Zek, Idol of Woven Grass, Coldain Fetish, and a Petrified Totem. Once you have these holy artifacts, close them up inside a Collector's Box and return it to me. Good luck.");
	elseif(e.message:findi("collector's box") or e.message:findi("collectors box")) then
		e.self:Say("Here you go, good luck on your hunt.");
		e.other:SummonCursorItem(17769);--Collector's Box
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28082})) then--Collection of Idols
		e.self:Say("Thank you very much " .. e.other:GetCleanName() .. "!  Here, please accept this as a reward for the fine work you've done.");--Text made up, can't find a reference
		e.other:QuestReward(e.self,0,0,0,0,28241);--Fine Antique Velvet Rose
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
