function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Thurgadin, " .. e.other:GetCleanName() .. ". I am Chamberlain Krystorf and it is my duty to assist the Dain in the management of Icewell Keep and the Royal Court. One could say that Seneschal Aldikar is the Sword of the Dain while I am the Shield, protecting all of his interests and those of the kingdom.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "For storage reasons I'm afraid I can only accept four of these at once for the bounty."
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29062,item2 = 29062,item3 = 29062,item4 = 29062}, 1, text)) then
		e.self:Say("Well done, " .. e.other:GetCleanName() .. ", the Dain is pleased with your efforts. With a few more brave allies like you, we'll soon be tearing down the halls of Kael Drakkel.");
		-- Confirmed Live Faction and Experience
		e.other:Faction(e.self,405, 50); -- Faction: Dain Frostreaver IV
		e.other:Faction(e.self,406, 50); -- Faction: Coldain
		e.other:Faction(e.self,429, -25); -- Faction: King Tormax
		e.other:QuestReward(e.self,0,0,0,math.random(20),eq.ChooseRandom(30215,30219,30212,30263),5000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 1199}, 0)) then
		e.self:Say("One moment the Dain has been waiting for you. I will call for him.. oh here he is now, show your shawl to him.");
		e.other:QuestReward(e.self,0,0,0,0,8895);
		if(not e.other:HasItem(17651)) then
			e.other:QuestReward(e.self,{itemid = 17651}); -- Item: Empty Coldain Issue Kit
		end
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(129003) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(129101) == false) then
			eq.spawn_condition("thurgadinb",3,0);
			eq.spawn_condition("thurgadinb",3,1);
		end
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 8895}, 0)) then
		e.self:Say("As I stated previously, you should show this to the Dain.");
		e.other:QuestReward(e.self,{itemid = 8895}); -- Item: Runed Coldain Prayer Shawl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
