function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I... umm... I was caught by a band of giants roaming outside Thurgadin last week and they brought me here... Honest!");
		eq.set_timer("read",24000);
	elseif(e.message:findi("rescue")) then
		e.self:Emote("laughs as he vanishes into the shadows, 'You have my eternal gratitude outlander! Lotta good that'll do ya! Farewell meddling fools... May you fall with the Dain!");
		eq.depop();
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18172}, 0)) then
		e.self:Say("I was just following orders! I swear it! Here, this is proof! Take it and be gone. If you continue harassing me I'll call for help and you'll never make it out of here alive.");
		e.other:QuestReward(e.self,0,0,0,0,1464,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	e.self:Say("Hiya Peff... err... uhh... outlander? I have heard tales of your deeds, please tell me you've come to rescue me from these heathens. The Dain would certainly reward you for such a noble act.");
	eq.stop_timer("read");
end