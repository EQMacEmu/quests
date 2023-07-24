function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings to you " .. e.other:GetCleanName() .. ". I welcome you to the Scouts of Tunare training halls. I have seen many scouts pass through my halls with unimaginable abilities and daggers guided by Tunare herself. I cannot say for certain what the future has in store for you. But I can say that wherever your adventures may take you it is always wise to have the proper [training].");
	elseif(e.message:findi("training")) then
		e.self:Say("The training that I speak of is only intended for rogues of Tunare that wish to develop skills that will mold them into the most deadly assassins in all of the lands. If you are a [rogue of Tunare] then I will be happy to explain the training exercises to you. However. if you are not a rogue I suggest you seek training from another house.");
	elseif(e.message:findi("i am a rogue of tunare")) then
		e.self:Say("Excellent " .. e.other:GetCleanName() .. ". let us get started then. Your training will test your fighting and gathering skills respectively. because of the items you will be required to gather all over the Faydark for [magical armor materials].");
	elseif(e.message:findi("magical armor materials")) then
		e.self:Say("First things first. here is your Assassins Mail Assembly Kit. Inside this kit you will combine different magical items. which in certain quantities in your mail kit can create armor materials for specific pieces of Tunarean Scouts Armor. Once you have completed a specific armor material you can then place it in a forge with the applicable pattern to create your piece of armor.[continue]");
		e.other:SummonCursorItem(17365)
	elseif(e.message:findi("continue")) then
		e.self:Say("Simply tell me what armor piece you [want] to craft and I can provide you with the material recipes and armor patterns for [Coifs][Bracers][Sleeves][Boots][Legplates][Gauntlets] and [Tunics].");
	elseif(e.message:findi("coif")) then
		e.self:Say("To create your coif material you will need to combine 2 Bricks of Crude Bronze. 1 Pixie Wing . 1 Ruined Wolf Pelt and 1 Bottle in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Coif of the Tunarean Scout.");
		e.other:SummonCursorItem(22671); -- Item: An Enchanted Coif Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Bronze. 2 Wasp Wings. 1 Faerie Wing and 1 Cask in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Bracer of the Tunarean Scout.");
		e.other:SummonCursorItem(22672); -- Item: An Enchanted Bracer Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze. 1 Fairy Dust and 1 Royal Jelly and 1 Elven Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Sleeves of the Tunarean Scout.");
		e.other:SummonCursorItem(22673); -- Item: An Enchanted Sleeves Pattern
	elseif(e.message:findi("boot")) then
		e.self:Say("To create your boots material you will need to combine 3 Bricks of Crude Bronze. 1 Basilisk Hatchling Hide. 1 Orc Hatchet and 1 Bottle of Milk in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Boots of the Tunarean Scout.");
		e.other:SummonCursorItem(22674); -- Item: An Enchanted Boots Pattern
	elseif(e.message:findi("legplate")) then
		e.self:Say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze. 2 Orc Eyes. 1 Orc Scalp and 1 Raw Bamboo in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Legplates of the Tunarean Scout.");
		e.other:SummonCursorItem(22675); -- Item: An Enchanted Legplates Pattern
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze. 1 Orc Head. 1 Orc Skull . and 2 Bat Wings in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Gauntlets of the Tunarean Scout.");
		e.other:SummonCursorItem(22676); -- Item: An Enchanted Gauntlets Pattern
	elseif(e.message:findi("tunic")) then
		e.self:Say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze. 1 Coyote Skull. 1 Orc Ribcage. 1 Pristine Forest Drakeling Scale. 1 Crushbone Shoulderpads and 1 Golden Bandit Tooth in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Tunic of the Tunarean Scout. Please return to me after you have completed your tunic. for I have one final [favor] to ask of you.");
		e.other:SummonCursorItem(22677); -- Item: An Enchanted Tunic Pattern
	elseif(e.message:findi("favor")) then
		e.self:Say("I have recently been trying my hand at weaponcrafting and I can say that it is going quite well. Before I can practice my skills however I need some [specific items] that will enable me to begin crafting daggers for our young scouts like yourself that have completed the training exercises.");
	elseif(e.message:findi("specific item")) then
		e.self:Say("In order to craft some more daggers I am in need of 1 Preserved Orc Hide and 2 Rotting Orc Teeth. You can most likely find these items on the vile orcs that inhabit the Faydark and Clan Crushbone of course. Bring me these items and I will reward you with a training dagger of the finest quality.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27535,item2 =  27536,item3 =  27536})) then
		e.self:Say("Excllent!  Here's your reward."); -- text made up
		e.other:QuestReward(e.self,0,0,0,0,27530,500);
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54069 -- Tilania_Shadowwalker