-- Councilor_Juliah_Lockheart 
-- Part of the Coldain 9th Ring 

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, my what a nice looking " .. e.other:Race() .. " you are, not that I've seen many of your kind mind you. I am Councilor Lockheart, representing the people of Thurgadin. Here is where we aid the Dain by presenting the peoples' will to him in the hopes that laws are made with the good interest of all our people in mind."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1464}, 0)) then -- Ring of the coldain council
		eq.unique_spawn(129063,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
