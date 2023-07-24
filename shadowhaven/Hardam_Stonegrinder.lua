-- Hardam's Goods

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("In need of some ores or other mining supplies? Well step right up, I got everything ye could possibly need! Also I'll have more supplies coming in as soon as I can get some dern time to deliver my [payment] to the commissioner.");
	elseif(e.message:findi("payment")) then
		e.self:Say("Well ya see mate I have a representative of me great mining business here that is currently in the bazaar, however I got some new things I need him to sell but I can't leave me shop! I just need to get these new [items] to him so that he can sell them.");
	elseif(e.message:findi("item")) then
		e.self:Say("Well da usual items ya know. I gets a lot of different goods in here every day and it is important that I move em out as fast as possible when they worth more ya knows? If ye lewkin for a [task] I've heard about ye around town and ye seem to be a trustworthy person.");
	elseif(e.message:findi("task")) then
		e.self:Say("I'm simply lookin for someone to take me box of [goods] here to my friend in the bazaar, his name is Faeroi and he will know what to do with them.");
	elseif(e.message:findi("good")) then
		e.self:Say("I thank ya for your willingness to help, " .. e.other:GetCleanName() .. ". Here is the box of the different things I need taken to Faeroi. When I spoke to him before he left for the bazaar this morning he told me that the helm that I had been having customized was ready. I have enclosed a note for him to give that to you to return to me. I look forward to seeing you soon.");
		e.other:SummonCursorItem(4757); -- Hardams Box of Goods
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5986}, 0)) then -- Hardams Custom Helm
 		e.self:Say("Ah, what a pleasant surprise indeed it seems my Helm is done! Many thanks for all your help once again " .. e.other:GetCleanName() .. ", and safe travels to you.");
		e.other:Faction(e.self,1512,5); -- House of Stout
		e.other:Faction(e.self,1508,1); -- Traders of the Haven
		e.other:QuestReward(e.self,0,0,0,0,0,500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
