function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day to ye! Ye look a wee bit hungrry. I sell many fine foods. Please have a look. Might I suggest the [lion roast]? It is a wee bit expensive, but well worth it.");
	elseif(e.message:findi("lion roast")) then
		e.self:Say("The lion roast is quite good. Tis me specialty. Ah marinate the lion meat in mammoth fat fer two days before roasting it. Lion meat isn't common around here. I'll purchase what I can from strangers but I rely mostly on shipments from the Plains o' Karana. I'm presently searching fer someone to [pick up me lion meat shipment].");
	elseif(e.message:findi("lion meat shipment")) then
		e.self:Say("It'd be grand o' ye to pick up me lion meat shipment. Ye must travel to the Plains o' Karana. Search fer a Northman fishing village. It should be Clan McMannus. Speak with the chieftain, Einhorst. Tell him ye're there to [pick up the lion meat shipment for Halas]. When ye return, I'll pay ye at least three gold. I look forward to yer return.");
	elseif(e.message:findi("lion delight")) then
		e.self:Say("Lion Delight is a trade secret and brings me much praise. I'll allow only one per customer. I'll also honor all as will [pick up the lion meat shipment] with a fine portion."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13961})) then 	--Lion Meat Shipment
		e.self:Say("Ye've returned!! How wonderful! The people o' Halas thank ye! It isn't often we get to indulge ourselves in the delicacies o' warmer climates. Here ye go, me friend. Ye've completed the delivery in good time. I hope ye deliver more often. Here, try some of me new creation.. [Lion Delight].");
		-- Confirmed Live Factions
		e.other:Faction(e.self,328,10); 								--Merchants of Halas
		e.other:Faction(e.self,320,7); 								--Wolves of the North
		e.other:Faction(e.self,327,7);									--Shamen of Justice
		e.other:QuestReward(e.self,0,0,3,0,12221,1000); --Lion Delight
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
