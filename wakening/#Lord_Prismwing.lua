function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("flutters his wings rapidly sending shimmering dust through the air around you. Although he speaks in high pitched chirps you somehow understand his meaning. Hello " .. e.other:GetCleanName() .. ", I am the Count of the Tunarean Drixies. Are you a friend of the Tunarean Court?");
	elseif(e.message:findi("friend")) then
		e.self:Say("I am in need of some help. One of my heralds was sent to deliver a message to the Othmir in the Cobalt Scar some time ago and has not returned. I fear for his safety, if your travels should lead you in that direction please attempt to find news of my missing herald.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 24876}, 0)) then
		e.self:Say("This is sad news you have returned to the court, but now his body may be laid to rest in the soil of Tunares land.");
		e.other:Faction(e.self,449, 10); -- Tunarean Court
		e.other:QuestReward(e.self,0,0,0,0,24867,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
