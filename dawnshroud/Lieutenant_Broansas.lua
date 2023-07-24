function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, stranger. Is there something I can help you with? I would love to chat with you but I'm afraid I have to stay focused on the [case] I am investigating.");
	elseif(e.message:findi("case")) then
		e.self:Say("Well, " .. e.other:GetCleanName() .. ". I'm monitoring a possible smugglers ring down there ahead of us in the distance. That group down there sure has a large shipment of goods and I intend to find out why.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4760}, 0)) then
		e.self:Say("You are sent from Lady Mistala I see? Ah of course she needs my reports. I trust you will return these documents to Mistala at once. Here you are, and thank you for your help. I shall have more reports soon.");
		e.other:Faction(e.self,1510,5); -- house of fordel
		e.other:Faction(e.self,1509,5); -- haven defenders
		e.other:Faction(e.self,1508,1); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,4761,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
