function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and welcome to the Broken Glacier, " .. e.other:GetCleanName() .. ". Ye'll find the bar downstairs and comfortable rooms up top. Can I interest you in one of our signature mugs, only a platinum piece they are!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {platinum = 1}, 0)) then
		e.self:Emote("Thank ye and enjoy it. All the bars here in Thurgadin have their own mugs, just ask the barkeep if'n yer interested.");
		e.other:QuestReward(e.self,0,0,0,0,30146,5);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end