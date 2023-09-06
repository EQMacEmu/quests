function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Mmmph!!  Who you?  Oh. you " .. e.other:GetCleanName() .. ".  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
	elseif(e.message:findi("what crakneks")) then
		e.self:Say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
	elseif(e.message:findi("bash")) then
		e.self:Say("OK!! Me bash!!  You hurt!!");
		eq.attack(e.other:GetName());
	elseif(e.message:findi("help crakneks")) then
		if(e.other:GetFactionValue(e.self) >= 0) then	
			e.self:Say("Go to swamps. Find noble hunters of humans and elves. All have house crests. Return to me and I give things. If you find special item says where hunters sleep, give to me. If meat founded then give to Clurg's cook. She make fine stew and give coins for meat.");
		else
			e.self:Say("Me smell the blood of Craknek enemy. Hey! It you!");	
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18787})) then
		e.self:Say("Ahh..  good..  good..  here. take..  Now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods.");
		e.other:Faction(e.self,232,100);  	-- Craknek Warrior
		e.other:Faction(e.self,228,15);  	-- Clurg
		e.other:Faction(e.self,261,-15); 	-- Green Blood Knight
		e.other:QuestReward(e.self,0,0,0,0,13525,20);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13361})) then
		e.self:Say("One less trouble. Hunhuh!! You do good work. Keep up. Remember to bring any special things to Guntrik. Here junk for good work. Go away now.");
		e.other:Faction(e.self,232,15);  	-- Craknek Warrior
		e.other:Faction(e.self,228,2);  	-- Clurg
		e.other:Faction(e.self,261,-2); 	-- Green Blood Knight
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(5030,5037,6021),500);
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18883})) then
		e.self:Say("Ooh! This where hunters stay. You must go to Rathe Mountains and find Drinn's Inn. Kill all. Bring owners' scalps back and me give good junk. You get more warriors to help. Say Guntrik command them. You will need all help you get.");
		e.other:Faction(e.self,232,2);  	-- Craknek Warrior
		e.other:Faction(e.self,228,1);  	-- Clurg
		e.other:Faction(e.self,261,-1); 	-- Green Blood Knight
		e.other:QuestReward(e.self,0,0,0,0,0,1000); -- Need rewards from live
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
