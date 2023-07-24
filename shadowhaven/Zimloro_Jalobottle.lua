function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oi there, " .. e.other:GetCleanName() .. ". If you are lookin for a potion or an antidote I got just what the doctor ordered. Step right up! I also have many other special potions but sadly I do not have the correct [components] for them.");
	elseif(e.message:findi("retrieve.* component")) then
		e.self:Say("Fantastic, " .. e.other:GetCleanName() .. "! Elefan, my apprentice, is currently studying under my wing. He had been collecting samples in Shadeweaver lately and he probably has the items that I need. If you could go and speak with him and present him with this ingredient list, hopefully he will have what I need. Please bring the components back to me as soon as possible!");
		e.other:SummonCursorItem(4758); -- Item: Zimloro Ingredient List
	elseif(e.message:findi("components")) then
		e.self:Say("Well you see I can make some very magnificent potions. Unfortunately, I am in need of a few [ingredients] that I lost in a lab accident a few days back.");
	elseif(e.message:findi("ingredient")) then
		e.self:Say("You sure seem interested in my work there, " .. e.other:GetCleanName() .. ". So interested that I think you would be willing to go fetch the components I require for my studies for me! Am I correct? Will you [retrieve these components] for me?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4759}, 0)) then
		e.self:Say("You did it, " .. e.other:GetCleanName() .. "! Finally I can finish these potions that I have been working on for such a long time. I will surely tell all of my friends of your willingness to help me!");
		e.other:Faction(e.self,1512,5); -- house of stout
		e.other:Faction(e.self,1508,1); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4765}, 0)) then
		e.self:Say("Ah, of course, the antidote supplies I have been waiting for from Daksins. I hope he is ok, we all told him it was not wise to go out to the cursed mountains alone. I thank you for bringing me these supplies because Daksins was unable too. There have been many reports lately of people receiving the disease carried by the beasts you encountered. Should you come across these extracts in the future bring them to me if you like. Thank you again, your actions will not go unnoticed.");
		-- confirmed faction from live.
		e.other:Faction(e.self,1512,25); -- house of stout
		e.other:Faction(e.self,1508,2); -- trader of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
