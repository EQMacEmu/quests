function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("turns his frown around and begins to smile. 'Oh!! Hello. It has been quite some time that someone has been polite and greeted me. Most adventurers are quite rude. To think I gave up my [hobby] to work day and night here!!");	
	elseif(e.message:findi("hobby")) then
		e.self:Say("I used to collect rare coins and gems. I came to Firiona Vie just to do that, but I never have the time to [collect rare coins] when I am always here at the bank.");
	elseif(e.message:findi("collect rare coins")) then
		e.self:Say("If you want to help, you can begin by replacing my prized Star of Odus which was taken from my vault when I stepped out to dine. Do so, and I may trust you to collect coins. I will also reward you with an item a composer left here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- You can purchase a Star of Odus for about 115pp in the jewel shop under the Erudin palace.
	-- Giving it to Wellford Fargin results in a "Tin Box" with 6 slots.
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10059})) then
		e.self:Say("Thank you!! I never could have gone to Odus to replace this. Perhaps now you can collect some rare coins.");
		e.other:QuestReward(e.self,0,0,0,0,17045);
	end
	-- put the 6 coins into the tin box, combine, and return it to Wellford Fargin, get Nostrolo Tambourine
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12829})) then
		e.self:Say("Wow!! I never thought I would ever see these in my entire life.  Please take this and Thank you!!!!"); -- text made up
		e.other:QuestReward(e.self,0,0,0,0,12940);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
