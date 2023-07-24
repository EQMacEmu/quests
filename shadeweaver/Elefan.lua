function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello, " .. e.other:GetCleanName() .. ". It's a pleasure to meet you as I do not see many visitors while I am working in the field gathering research.");
	elseif(e.message:findi("research")) then
		e.self:Say("Oh I have some different berries and antidote ingredients that I gathered not too long ago. I would imagine these are what he needs. Will you [take the Antidote ingredients] to Zimloro?");
	elseif(e.message:findi("ingredient")) then
		e.self:Say("Here you are, " .. e.other:GetCleanName() .. ". Please bring them to him at once so they do not spoil and thank you for your help.");
		e.other:SummonCursorItem(4759); -- Item: Antidote Ingredients
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4758})) then
		e.self:Say("Ah I see you are sent from master Zimloro eh, " .. e.other:GetCleanName() .. ". This note reads that he needs some specific items at once. Perhaps he could find some use out of all of this research I have recently collected.");
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
