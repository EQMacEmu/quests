-- Duke Norfin's Delivery

function event_say(e)
	if (e.other:GetFaction(e.self) <= 5) then
		if(e.message:findi("hail")) then
			e.self:Say("Can't you see I'm, eh, busy here? Leave me be.");
		elseif(e.message:findi("the good")) then
			e.self:Say("You will, will you. That would be great. Make sure the guards don't stop you while you have this stuff. And if you get caught, I'll deny any knowledge of you. Now get out of here.");
			e.other:SummonCursorItem(19840); -- Item: Smuggled Goods
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 19841}, 0)) then
		e.self:Emote("glances nervously about, 'So you're here on 'official' business eh? Well, there's not much I can do right now. I have the goods but someone caught scent of what I've been doing and there are too many people watching me to leave right now. You can tell our mutual friend that he needs to wait for things to calm down or send someone else to bring back the goods.'");
		e.other:Faction(e.self,1605,25); -- haven smuggler association
		e.other:Faction(e.self,1542,25); -- haven smugglers
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
