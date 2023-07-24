-- Wage War Upon The Coldain

function event_say(e)
	if(e.other:GetFaction(e.self) < 6) then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings, little thing.  You have entered into the great city of Kael Drakkel, home of the Kromzek as well as a few of my kind, the Kromrif.  If you are to walk among my people as a peer you must prove yourself as a friend, not a foe.");
		elseif(e.message:findi("prove")) then
			e.self:Say("Leave this place then and return when you have waged war upon the Coldain.  Remove their heads from their bodies and return them to me.  I will spread the word of your deeds amongst my people if you do so, " .. e.other:Race() .. ".");
		elseif(e.message:findi("coldain")) then
			e.self:Say("The Coldain are the ice dwarves who dwell in the city of Thurgadin.  They are a blight upon the land known as Velious, speaking the word of their god, Brell.");
		end
	else
		e.self:Say("I will do nothing to help beings like you!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local head = 0;
	
	if(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30081, item2 = 30081, item3 = 30081, item4 = 30081}, 0)) then
		head = 4;
	elseif(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30081, item2 = 30081, item3 = 30081}, 0)) then
		head = 3;
	elseif(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30081, item2 = 30081}, 0)) then
		head = 2;
	elseif(e.other:GetFaction(e.self) < 6 and item_lib.check_turn_in(e.self, e.trade, {item1 = 30081}, 0)) then
		head = 1;
	end

	if(head > 0) then	
		for i = 1, head do
			e.self:Say("Very good, " .. e.other:Race() .. ".  Slay more of the beasts and your name will be known by all of the Kromrif!");
			e.other:Faction(e.self,419,35); -- Kromrif
			e.other:Faction(e.self,448,8); -- Kromzek
			e.other:Faction(e.self,406,-17); -- Coldain
			e.other:Faction(e.self,430,-3); -- Claws of Veeshan
			e.other:QuestReward(e.self,0,0,0,0,0,5000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

