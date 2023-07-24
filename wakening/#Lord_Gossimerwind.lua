function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("blinks at you a few times then speaks in a strangely musical draconic voice. 'You vish to azzizt ze count of ze Tunarean Faerie Dragons?'");
	elseif(e.message:findi("assist")) then
		e.self:Say("I vish to ztop ze Kromzek Foreman from continuing ta deztroy thiz land. Iv you vish to azzizt you can zlay ze Foreman and bring me hiz helm az proof.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24873}, 0)) then
		e.self:Emote("takes the helm in his claws and crushes it with seeming ease. 'Yeez hav eernd ta reezpect ov my peoplez, here iz ze crezt ov ze faerie dragons'");
		e.other:Faction(e.self,449, 20); -- Tunarean Court
		e.other:QuestReward(e.self,0,0,0,0,24868,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
