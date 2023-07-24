function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("rune")) then	
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("This rune is very powerful and I will not release it to just anyone. Are you the one that Jualicn sends?");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("jualicn")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("That is excellent. Jualicn is very wise indeed however he does not send just anyone on such an important task. If you are the one that he has informed me will come I am sure he must have given you something to present to me.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:HasItem(1893) == false and item_lib.check_turn_in(e.self, e.trade, {item1 = 1908}, 0)) then -- Jualicn's Token
		e.self:Say("Ah of course, " .. e.other:GetCleanName() .. ". You will need a Rune of Eradication for your lexicon. We are counting on your loyalty. Remember that you will need to bring the teachings of Relinar to Lawyla for further instructions, as she requires them to pass on the magic to those worthy of it. I bid you farewell, " .. e.other:GetCleanName() .. ".");
		e.other:Faction(e.self,430,5);   -- Claws of Veeshan
		e.other:Faction(e.self,436,1);  -- Yelinak
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:QuestReward(e.self,{items = {1908,1893},exp = 1000}); -- Jualicn's Token, Rune of Eradication
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
