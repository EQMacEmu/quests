function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, the strangers, I have heard word of you. Why come you to the Skyshrine? Do you wish to be of assistance to the kin? If so, I may have a task, if you are willing.");
	elseif(e.message:findi("willing")) then
		e.self:Say("Very well, should you complete this task you will be doing a great service to the kin. As of late our supplies of velium ore have been growing short. We need to restock this supply but our normal source has run dry for the most part.  Word has come to us that the Coldain are sitting on a large source of this ore and while we have no love for these Coldain, we have arranged a deal with one of their velium miners. Deliver this note along with a payment of 50 platinum to Ungdin, in the Coldain mines. Bring the velium shipment back to me and I will see about a reward.");
		e.other:SummonCursorItem(1725); -- Item: Velium Delivery Note
	end
end

function event_trade(e)
	local item_lib = require("items");
	local hammerrew = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29064},0)) then
		e.self:Say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude. This velium is badly needed, thank you, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,430,5);  	--CoV
		e.other:Faction(e.self,436,1);  	-- Yelinak
		e.other:Faction(e.self,448,-2); 	-- Kromzek
		if(math.random(3) == 1) then
			hammerrew = 1727; -- bracer of the hammerfall
		end
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(0,10),hammerrew,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
