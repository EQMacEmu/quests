function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Hello " .. e.other:GetCleanName() .. ". It is good to see that you have traveled so far to be in my presence. I do believe that you are the one chosen to aid us in our fight against the giants. If you are then I am sure that you will need my rune for your research.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("jualicn")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("You are the one that Jualicn speaks of?  Surely you must have something to symbolize your dediciation to our cause.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("rune")) then	
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("I see. Many seek this rune that I keep for whatever magics they practice, however I can only release it to the one that aids Jualicn.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:HasItem(1894) == false and item_lib.check_turn_in(e.self, e.trade, {item1 = 1908}, 0)) then
		e.self:Say("Take this Rune of Revenge, " .. e.other:GetCleanName() .. ". You will need it to extract retribution in remembrance of our dear Hsagra. I thank you for your contributions to our cause. It is good to have you amongst our ranks.");
		e.other:Faction(e.self,430,5);   -- Claws of Veeshan
		e.other:Faction(e.self,436,1);  -- Yelinak
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:QuestReward(e.self,{items = {1908,1894},exp = 1000}); -- Jualicn's Token, Rune of Revenge
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
