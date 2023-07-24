function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, adventurer! Kwinn's the name. Hunting is my game. I have been all over this continent. Seen many things and found [odd trinkets]. I have no quarrel with any race. I judge a person or critter by their actions. Heck, my best friend is a troll!!");
	elseif(e.message:findi("odd trinkets")) then
		e.self:Say("Blast!! I found some strange thingamajigs!! Most of it I toss or sell to vendors and crazy sages. I am on my way to sell this [iron tail] to a tinkerer.");
	elseif(e.message:findi("iron tail")) then
		e.self:Say("Found the thing washed up on the shore in Timorous Deep. Looks like a metal lizardman tail. It is all rusted and covered with barnacles. Probably can't get much for it, but I'll try. Why do you ask? Are you looking to [trade for the mechanical thing]?");
	elseif(e.message:findi("trade for the mechanical thing")) then
		e.self:Emote("takes out an extra pack. 'Thought you might be interested. I don't want to take a loss and I only trade for things I am hunting, so here!! Inside this pack you need to combine the following items; a sabertooth tiger mane, a pair of pygmy brute choppers, a lime plume and a war bone fist. Return the full sack to me and the tail is yours.'");
		e.other:SummonCursorItem(17038); -- Item: Empty Pack from Kwinn
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12828})) then
		e.self:Say("Kackling Quellious!! This will bring a fortune on the black market!! Well, a deal is a deal. Here is the tail.");
		e.other:QuestReward(e.self,0,0,0,0,12822,25000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
