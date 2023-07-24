local count = 0;
function event_spawn(e)
	eq.set_timer("karim",175000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("Maintain your focus on the attack. Let the Taruun dance around the enemies while you keep them distracted. Working together like this will be to your advantage.");
	end
	if(count == 2) then
		e.self:Say("Do not let the enemy attack your unarmored companions. Your heavy armor will protect you much more efficiently than cloth or leather.");
	end
	if(count == 3) then
		e.self:Say("Try to lure your enemy to a strategic location for battle. Your are at a disadvantage when you attack them in their lair.");
	end
	if(count == 4) then
		e.self:Say("You there! Pay attention! Do not lose focus. Losing focus in battle can result in the death of your comrades. Be aware of your surroundings at all times. You never know when an enemy will leap at you from behind.");
	end
	if(count == 5) then
		e.self:Say("If the enemy mutters mystical words, a swift bash in the face with your shield is likely to shut its yap. Remember this young ones, for this advice will one day save your lives.");
	end
	if(count == 6) then
		e.self:Say("Be sure to stock yourself with plenty of food and water before forming a battle group. It is not wise to leave your companions without your aid while you return home for more supplies. There is plenty of time to relax at the tavern when your mission is accomplished.");
	end
	if(count == 7) then
		e.self:Say("They raid our trade routes even as I speak. We cannot afford to let the Gor Taku supply them with even more aid!");
	end
	if(count == 8) then
		e.self:Say("It is our duty to protect the roads. We need to maintain a steady flow of supplies from the furless ones.");
	end
	if(count == 9) then
		e.self:Say("It is wise to make use of your enemy's equipment. Our supply is short as it is.");
	end
	if(count == 10) then
		e.self:Say("Kick your enemy to throw them off balance. Then strike with your blade. It is important to stay on your toes.");
		count = 0;
		eq.set_timer("karim",175000);
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings, adventurer. Pay no heed to Captain Koldar should you see him. Our true enemy are the Gor Taku. It is very apparent that they are in league with the Loda Kai Brigands. We need to show the Shak Dratha that we are not their enemy. Help me destroy the Gor Taku clan, return to me with four of their earthcaller stones and I will help you however I can.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30835,item2 = 30835,item3 = 30835,item4 = 30835})) then
		e.self:Say("Well done " .. e.other:GetName() .. ", your efforts are invaluable. Perhaps we can convince the Shak Dratha that we are not their enemy after all. Alas, with the turmoil in these parts I am afraid that I cannot part with any military supplies as they are needed by my troops. I can, however, at least send you off with a bit of coin and my thanks. Take care my friend!");
		e.other:Faction(e.self,1513,2);
		e.other:QuestReward(e.self,0,0,0,5,0,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
