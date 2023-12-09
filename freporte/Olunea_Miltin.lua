function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is good to meet you. Try not to scare the fish away. This is a good spot I supply fish to the Grub N' Grog. The patrons there love me!");
	elseif(e.message:findi("fish")) then
		e.self:Say("I am doing exceptionally well. This harbor is filled with fish. After an hour I have enough to feed myself and my family for a week.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13922})) then -- Snapped Pole
		e.self:Say("Great! Thank you stranger. The rogues must have broken it. At least I could repair it. It would be seasons before I could afford another pole.");
		e.other:Faction(e.self,330,5,0); -- Freeport Militia
		e.other:Faction(e.self,336,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,281,-1,0); -- Knights of Truth
		e.other:Faction(e.self,362,-1,0); -- Priests of Marr
		e.other:QuestReward(e.self,math.random(5),math.random(5),0,0,13100,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end


