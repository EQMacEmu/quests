function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Emote("hums while he sorts through the books that rest on the various shelves.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail citizen, may I help you find a book or are you looking for assistance with something else? ");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9049})) then
		e.self:Say("It is a pleasure to meet you, " .. e.other:GetCleanName() .. ". The Animists mentioned that someone would be by, but for me not to wait, so I sent the information that they requested to Weapons Master Rahoul. He is having a master smith finish the blades.");
		e.self:Say("Take him this receipt and I'm sure that he'll get you the weapons as soon as possible. Take care. It appears that a lot of people are relying on you in this matter. You may be the only person that can do this.");
		e.other:QuestReward(e.self,0,0,0,0,9050);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
