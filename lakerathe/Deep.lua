-- Monk Epic 1.0

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1686},0)) then --Trunt's Head
		e.self:Emote("slowly opens her eyes and looks up at you. She stares at you a long while and then closes her eyes and lowers her head again.");
		e.self:Say("Very well, " .. e.other:GetCleanName() .. ", if you wish death so greatly, we will be happy to oblige. My master projects part of himself in the wilder lands known as the Overthere. He has granted you an audience. Find him and show him the head of our earth brother. At that point, we will discuss how we will end your life.");
		e.other:QuestReward(e.self,0,0,0,0,1686); --Trunt's Head
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
