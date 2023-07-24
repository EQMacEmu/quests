function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Why come you to the home of the kin? Seek a home amongst the kin perhaps? Perhaps if you wish to prove yourself I may have a task for you.");
	elseif(e.message:findi("prove")) then
		e.self:Say("Very well, it is a minor task, but I am sure you are quite capable. Lately the food supply in the guards' galley has been dwindling. I fear that there are spiders amongst us who are pilfering our food when we do not see. I would ask of you to please seek out and eliminate these vermin for us. Bring their legs back to me and I shall reward you for your effort.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local ringrew = 0;
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29080,item2 = 29080,item3 = 29080,item4 = 29080})) then
		e.self:Say("Excellent work, " .. e.other:GetCleanName() .. ". Here is your payment. I will also reward you for any more you bring.");
		e.other:Faction(e.self,430,5);  	--CoV
		e.other:Faction(e.self,436,1);  	-- Yelinak
		e.other:Faction(e.self,448,-2); 	-- Kromzek
		if(math.random(5) == 1) then
			ringrew = 29063; -- Item: Ring of the Chameleon
		end
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(0,10),ringrew,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
