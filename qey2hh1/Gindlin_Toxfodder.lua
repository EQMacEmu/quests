-- Gindlin's Poison

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Enough with the formalities. I don't make it to these parts often and I only plan on being here a couple days. My time is precious. You must be a rogue in search of the [death juice].");
	elseif(e.message:findi("death juice")) then
		e.self:Say("Spider venom. You can't mix it yourself. If you want, I can do it. I'll need two spider venom sacs from the giant spiders. There should be some around these plains. I also demand a fee of 20 gold pieces, oh yeah!... I have been banished from Qeynos... I also want a bottle of my favorite brew, Crow's special brew, purchased from Crow himself in North Qeynos.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You did hear me, didn't you? I want two spider venom sacs, a bottle of Crow's special brew and 20 gold pieces.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14018, item2 = 14018, item3 = 13799, gold = 20},1,text)) then
		e.self:Say("Here. I could care less what you do with this. Hopefully you'll lay some on the Circle of Unseen Hands.");
		e.other:QuestReward(e.self,0,0,0,0,14015,500); -- Item: Spider Venom
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
