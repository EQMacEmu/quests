function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Lo there wanderer. Something is amiss within the region, have you not felt it? I sense a [whisperling] nearby.");
	elseif(e.message:findi("whisperling")) then
		e.self:Say("A whisperling, who brings us dreams, you cannot see them. They do no harm, but I sense anger in them. They have made an enemy. If you are willing to aid us in our research, please seek Groo McManus in the shadeweavers thicket, he has some insight on these whisperlings.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30961})) then
		e.self:Say("Oh " .. e.other:GetCleanName() .. "! This is a whisperling. and she is beautiful! You must find a way to free her of this anchor. Take her to Ragnar. he may know what to do. Let me put her in this bag to keep her safe for now.");
		e.other:Faction(e.self,1513,1); --Guardian of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30962,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
