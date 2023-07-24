--The other NPC for the Iksar Shadowknight low- to mid-level armors.

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("eyes you intently. 'So, yet another hatchling approaches us. I am known as Sirtha and that is Sarth. We are of [Rile's] children. Who do you call your father, broodling?'");
	elseif(e.message:findi("Rile")) then
		e.self:Say("Very good. We are smiths for the Crusaders of the Greenmist and I shall make [armor] for you, provided you prove your worth. Fail these simple tasks, and you shall not be worthy to bear the title of crusader!");
	elseif(e.message:findi("armor")) then
		e.self:Say("I will make [helms], [gauntlets], [boots], and [vambraces]. My broodmate shall make the bracers, greaves, masks, and breastplate.");
	elseif(e.message:findi("helm")) then
		e.self:Say("The sarnak are a mockery of the Iksar. They are nothing more than beasts fit only to do our bidding! I require you to bring me the sword of one of their Order of Knights and the head of a sarnak berserker. These beasts have been attacking our patrols of late. I also require a stone called a ruby and a banded helm. Do this and I shall make a helm for you.");
	elseif(e.message:findi("boots")) then
		e.self:Say("Cactus quills can be very lethal. I seek to work them into my new boots. Find me these quills, a pair of skeletal feet, an emerald of fire, and some banded boots so that I may start working on them. Why are you still here?! Begone!");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("I currently have need of a complete skeletal hand for the research I am conducting. I wish to study its properties and form so that I can make gauntlets befitting our station. I also require two rubies that holds stars within and some banded gauntlets to complete my ritual. Do that and the gauntlets are yours to keep.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("The hideous Golra are hardy creatures. The tales indicate their ferocity almost matches our own. I wish to gain a trophy of one of these beasts. Bring me the skin of one, two blue sapphires, and banded sleeves. Then I shall give you these fine vambraces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Dreadscale Helm for:  Head=14822  Sword=14826  Helm=3053  Ruby=10035
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14822, item2 = 14826, item3 = 3053, item4 = 10035})) then
		e.self:Say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4968,10000); -- Item: Dreadscale Helm
	end
	--Dreadscale Boots for:  Quills=14828  Boots=3064  Feet=14823  FireEmerald=10033
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14828, item2 = 14823, item3 = 3064, item4 = 10033})) then
		e.self:Say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4974,10000); -- Item: Dreadscale Boots
	end
	--Dreadscale Gauntlets for:  Hand=14825  Gauntlets=3062  StarRuby=10032
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14825, item2 = 3062, item3 = 10032, item4 = 10032})) then
		e.self:Say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4972,10000); -- Item: Dreadscale Gauntlets
	end
	--Dreadscale Vambraces for:  Hide=14830  Vambraces=3060  Sapphire=10034
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14830, item2 = 3060, item3 = 10034, item4 = 10034})) then
		e.self:Say("Well done! Here is the item we agreed upon. May Cazic's glorious curses flow through you!");
		e.other:QuestReward(e.self,0,0,0,0,4970,10000); -- Item: Dreadscale Vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
