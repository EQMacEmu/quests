function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("It is not often that I see strangers in these dangerous lands. Perhaps you are the chosen that Jualicn speaks of that will aid us in our battle against the foul giants. I do not believe you would be here if you were not in need of my sacred rune.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("rune")) then	
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Although I can see that you would surely put the rune to use in some way, I can only release it to the one that Jualicn speaks of. I am sorry, but I am quite protective to what ties I still have to the great Relinar.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("jualicn")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("I understand that you may know of Jualicn, but I can only deal with those that he would trust with something dear to him.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local token = 0;
	
	if(e.other:HasItem(1895) == false and item_lib.check_turn_in(e.self, e.trade, {item1 = 1908}, 0)) then -- Jualicn's Token
		e.self:Say("I have given you the Rune of Bleve, to assist you in your research for the once lost magic against the Kromzek. I hope that you can make good use of it, for it is very sacred to me. May Veeshan guide your path!");
		e.other:Faction(e.self,430,5);   -- Claws of Veeshan
		e.other:Faction(e.self,436,1);  -- Yelinak
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:QuestReward(e.self,{items = {1908,1895},exp = 1000}); -- Rune of Bleve, Jualicn's Token
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
