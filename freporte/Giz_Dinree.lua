function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Excuse me! I came here in hopes of being alone!");
	elseif(e.message:findi("sent by tani")) then
		if(e.other:GetFaction(e.self) <= 4) then
			e.self:Say("You're a new rogue, then! Your mission is to kill the young daughter of the owner of the Seafarer's Roost. Wait for the right time. Why? You don't need to know. Do it and return Lyda's head to Tani in Neriak. I hope you can make it back to Neriak alive. Good hunting!");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("You have done nothing to upset the Ebon Mask, but there is much more which you must do before we do business.  Perhaps a task from Master Hekzin shall set things right.");
		else
			e.self:Say("You are quite bold to approach a member of the Ebon Mask. Now be smart and run away.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18844})) then -- Sealed Letter
		e.self:Say("I am glad to see you. We have a problem. The last runner and I attempted to carry the chest from a boat. It fell overboard! He went in after it, but the sharks made a meal of him. If you want to try and get it, it is down below in the water in the harbor. Be careful.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end