function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, good day, friend. My name's Leanon Ruksey, loyal member of the League of Antonican Bards. Qeynos Chapter, of course. It's part of my job to keep up with the goings-on of the city, who's coming and going and all that. So we usually keep a man here and one at the docks. Anyway, nice chatting with you. Be careful out there!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18020})) then
		e.self:Say("Ah, hello there, " .. e.other:GetCleanName() .. ". It's such a fine day out, wouldn't you say? Ah, reports are due in. Very well, here you go. Say hello to the fellows back at the Wind Spirit's Song for me. May you have many safe travels, my friend.");
		e.other:Faction(e.self,284,10,0); -- live confirmed text + faction
		e.other:Faction(e.self,281,1,0); -- Faction: Knights of Truth
		e.other:Faction(e.self,262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(e.self,304,-1,0); -- Faction: Ring of Scale
		e.other:Faction(e.self,285,-1,0); -- Faction: Mayong Mistmoore
		e.other:QuestReward(e.self,0,0,0,0,18024,200); -- Item: Leanons Report
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
