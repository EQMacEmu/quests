--Iksar low- to mid-level armor quests.  This is for the Shadowknight.

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("hisses at you loudly. 'So, you bear the [mantle of a crusader], yes?  I am known as Sarth and shall reward you, provided you prove your worthiness to our cause, child of Rile.'");
	elseif(e.message:findi("mantle of a crusader")) then
		e.self:Say("We shall see if you are worthy of that. I shall make [armor] for you, to aid you in your service to our Father. I specialize in the forging of [bracers], [greaves], [masks], and [breastplates]. Sirtha makes the other items of armor. Take care when you address her, hatchling. It would not be the first time a hatchling has left here with scars.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Yes, I shall make [armor] for you, to aid you in your service to our Father. I specialize in the forging of [bracers], [greaves], [masks], and [breastplates]. Sirtha makes the other items of armor. Take care when you address her, hatchling.  It would not be the first time a hatchling has left here with scars.");
	elseif(e.message:findi("bracers")) then
		e.self:Say("Have you ever seen Bloodgills? I hear they will devour a broodling in seconds and that their scales are tough as iron. Bring me some of these scales, a banded bracer, and a sapphire as blue as the sky. Only then will I give the bracer to you, broodling.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("Do you know the beasts that call themselves sarnaks? One such beast who calls itself Zorash attacked an envoy of merchants who were to deliver a pair of special boots to me. It taunts us by wearing them as a trophy. Bring them back and the skull of Grachnist, his goblin ally. Return them to me along with a star ruby and your banded greaves, and I shall craft you an excellent pair of greaves.");
	elseif(e.message:findi("mask")) then
		e.self:Say("Have you ever encountered a drixie before? I crush every one I see. They are an annoyance beyond mere words! Kill the Queen and bring me her wings as a trophy along with an emerald of fire and a banded mask.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("Ahhhh....a breastplate you want, is it? Well, they are not easy to come by. Fetch me a scorpion chitin. Intact, mind you! They are extremely fragile and must be treated before they can protect your carcass. Also, fetch me a war braid from a sarnak to connect the pieces. I also require a ruby and your banded tunic. Do this and I shall make it for you, hatchling. Now, go!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Dreadscale Bracer for:  Scale=14824  Bracer=3061  Sapphire=10034
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14824, item2 = 3061, item3 = 10034})) then
		e.self:Say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4971,10000); -- Item: Dreadscale Bracer
	end
	--Dreadscale Greaves for:  Boots=14829  Head=14820  Greaves=3063  StarRuby=10032
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14829, item2 = 14820, item3 = 3063, item4 = 10032})) then
		e.self:Say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4973,10000); -- Item: Dreadscale Greaves
	end
	--Dreadscale Mask for:  Wings=14827  Mask=3054  FireEmerald=10033
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14827, item2 = 3054, item3 = 10033})) then
		e.self:Say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4975,10000); -- Item: Dreadscale Mask
	end
	--Dreadscale Breastplate for:  Braid=12982  Chitin=14821  Breastplate=3056  Ruby=10035
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12982, item2 = 14821, item3 = 3056, item4 = 10035})) then
		e.self:Say("Well done!  Here is the item we agreed upon.  May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4969,10000); -- Item: Dreadscale Breastplate
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
