function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetCleanName() .. "!  You look like you could use some new footwear.");
	elseif(e.message:findi("treant wood")) then
		e.self:Say("What is all this talk of Treant Wood? I can get you some. In about two months, I shall have a new stock. Perhaps I may have some to trade... if you do me a [favor]...");
	elseif(e.message:findi("favor")) then
		e.self:Say("I will be glad to part with some Treant Wood for an Odus Pearl from the waters surrounding Erudin. On second thought... make that four Odus Pearls.");
	elseif(e.message:findi("donate") or e.message:findi("donation")) then
		e.self:Say("Donate!? Ha! With the taxes imposed by Antonius Bayle, I have no coins to donate to ANY guild!");							
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "You know the deal!! Four Odus Pearls and you get the Treant Wood.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13878,item2 = 13878,item3 = 13878,item4 = 13878},1,text)) then -- Pearl of Odus
		e.self:Say("Wonderful!! I am sure that was a lot safer than battling a treant.");
		-- Confirmed Live Factions
		e.other:Faction(e.self,291,2,0); -- +Merchants of Qeynos
		e.other:Faction(e.self,223,-1,0); -- -Circle Of Unseen Hands
		e.other:Faction(e.self,219,1,0); -- +Antonius Bayle
		e.other:Faction(e.self,229,1,0); -- +Coalition of Tradefolk
		e.other:Faction(e.self,262,1,0); -- +Guards of Qeynos
		e.other:QuestReward(e.self,0,0,0,0,13824,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
