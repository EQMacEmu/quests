function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:Race() .. "! I'm afraid I am quite busy with all the transactions that occur and shipments that come and go from the city but if you have an official request form for some information from our library of records I will gladly assist you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31753}, 0)) then
		e.self:Say("So you were sent by the Magistrates of Katta Castellum I see. It isn't very often we get requests for records as old as these.  'Ajar shuffles through several books on a cluttered shelf and a few minutes later procures the records and begins writing down the requested information.'  Here are the names that have been requested by Magistrate Dionicas. You can assure him when you deliver this record that it is quite accurate.");
		e.other:QuestReward(e.self,0,0,0,0,18352,10000); -- Old Merchant Records
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
