function event_timer(e)
	if(e.timer == "lenyadepop") then
		eq.depop();
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Are not you a little short for a Highpass Guard?");
	elseif(e.message:findi("highpass guard")) then
		e.self:Say("Of course not. You are far too puny. Then what is your business here in my cell?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13108})) then
		e.self:Say("So you are a member of the Silent Watch!! They are accepting anyone these days. I shall leave then. Here is your bracer back. Thank you for unlocking the door. ");
		e.other:Faction(e.self,226,25); -- Faction: Clerics of Tunare
		e.other:Faction(e.self,279,25); -- Faction: King Tearis Thex
		e.other:Faction(e.self,5002,18); -- Faction: Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,13112,50); -- Item: Tearon's Bracer (returned)
		eq.set_timer("lenyadepop",150000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end