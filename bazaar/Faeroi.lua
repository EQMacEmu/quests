function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi there " .. e.other:GetCleanName() .. ". It's nice to meet ye. Many great deals here today if I don't say so myself.");
	elseif(e.message:findi("piece")) then
		e.self:Say("I'm waiting to have a rhino beetle horn delivered to me to finish off Hardam's helm. I do not want to present it to him with one horn, you know. If you wanted to be a big help, any rhino beetles horn would do fine. Bring one to me and I can then finish Hardam's helm and send it back to his shop in your hands.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4757})) then -- Hardams Box of Goods
		e.self:Say("Ah Hardam sent you eh. Fair enough then, please let him know I will get to selling these goods as soon as possible and please let him know that the helm will be done soon. All I need is a certain [piece].");
		e.other:Faction(e.self,1512,5); -- House of Stout
		e.other:Faction(e.self,1508,1); -- Traders of the Haven
		e.other:QuestReward(e.self,0,0,0,0,0,500);

	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5985})) then -- Rhino Beetle Horn
		e.self:Say("Its good to see you again so soon " .. e.other:GetCleanName() .. ". I knew that you would be able to assist me in this task. As I said, here is Hardams finished helm. Please return it to him for me as I cannot leave my booth here.");
		e.other:Faction(e.self,1512,5); 	-- House of Stout
		e.other:Faction(e.self,1508,1); 	-- Traders of the Haven
		e.other:QuestReward(e.self,0,0,0,0,5986,550); -- Hardams Custom Helm
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
