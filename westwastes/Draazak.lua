function event_say(e)
	if(e.message:findi("hail")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Greetings, " .. e.other:GetCleanName() .. ". It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I thank you for your inquiry, however you have not earned my trust yet.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("rune")) then	
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("There are many that wish to gain our power through knowledge of the magic that we practice. I am afraid that I cannot simply give this treasure to just anyone. I must wait for the chosen that Jualicn speaks of only then can I release the rune I still carry from the great Relinar.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I thank you for your inquiry, however you have not earned my trust yet.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	elseif(e.message:findi("jualicn")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("If you are truly sent from Jualicn then he must have surely given you something to present me.");	
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I thank you for your inquiry, however you have not earned my trust yet.");
		else
			e.self:Say("We do have many living enemies.  Let me correct this oversight.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:HasItem(1896) == false and item_lib.check_turn_in(e.self, e.trade, {item1 = 1908}, 0)) then -- Jualicn's Token
		e.self:Say("" .. e.other:GetCleanName() .. ", whom Relinar found to be necessary for the success of the magic against those foul giants. I present this Rune of Concentration to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions.");
		e.other:Faction(e.self,430,5);   -- Claws of Veeshan
		e.other:Faction(e.self,436,1);  -- Yelinak
		e.other:Faction(e.self,448,-2); -- Kromzek
		e.other:QuestReward(e.self,{items = {1896,1908},exp = 1000}); -- Rune of Concentration
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
