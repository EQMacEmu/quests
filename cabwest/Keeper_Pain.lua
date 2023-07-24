function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("raises his gaze from his tomes to greet you. 'Ahh!! Welcome, seeker of knowledge! Come to fill your brains, have you? Look closer, adventurer. I have scribed some very powerful spells.");
	elseif(e.message:findi("wand of pain")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Emote("drops his tome and monocle and looks at you sharply. 'What?!! Have you seen Revenant Vytrix? I let him borrow my wand for a quest. That was half a season ago!! I fear he is dust and my precious wand is lost.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("No Iksar resident will have anything to do with you!");
		else
			e.self:Say("No Iksar resident will have anything to do with you!   Away from here before you find yourself dead.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12869})) then
		e.self:Emote("begins jumping for joy. 'Yoohoo!! My wand!! Thank you. You must be some powerful adventurer. You can help me collect a few components. Fill this chest with a frost crystal, a cockatrice egg, a giant hornet egg and a plains pebble. Return the full chest to me and I shall offer you a spell I recently researched.");
		e.other:Faction(e.self,443,5); 		--Brood of Kotiz
		e.other:Faction(e.self,441,1); 	--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,math.random(5),0,17041,100); -- Item: Component Chest
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12885})) then
		e.self:Say("Yes this is exactly what I wanted. Here is your spell.");
		e.other:Faction(e.self,443,5); 		--Brood of Kotiz
		e.other:Faction(e.self,441,1); 	--Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,15444); 	--Spell Renew Bones
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
