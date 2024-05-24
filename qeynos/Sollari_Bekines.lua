function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Hello, there! I am Sollari Bekines of the League of Antonican Bards. I am at your service to train you as best I can. There have been a number of young bards entering our concert halls lately seeking guidance. If you are a [young bard in search of training]. I might have some work for you.");
		elseif(e.message:findi("young bard in search of training")) then
			e.self:Say("You need to look no further then. I can surely provide you with the knowledge you will need to make it in this world as a songweaver. The exercises that you will need to complete will test your gathering and fighting skills. Once you have completed your training you will be outfitted with a suit of your very own armor! When you are [ready to begin] I will explain to you how the training will work.");
		elseif(e.message:findi("begin")) then
			e.self:Say("Here is your Wind Spirits Assembly Kit. In this kit you will collect a different items that will be combined in certain quantities to create infused armor materials. These armor materials that you create can then be taken to a forge along with the applicable armor mold to fashion together a piece of Wind Spirits Armor. When you would like to craft an armor piece you must simply tell me what piece you [want] to craft. I will then provide you with the recipe and mold necessary for creating Wind Spirits [Helms], [Bracers], [Armguards], [Boots], [Greaves], [Gauntlets] and [Breastplates].");
			e.other:SummonCursorItem(17269); -- Item: Wind Spirits Assembly Kit
		elseif(e.message:findi("helm")) then
			e.self:Say("To create your helm material you will need to combine 2 Bricks of Crude Iron, 1 Coyote Skull, 1 Bat Fur and 1 Honey Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Helm.");
			e.other:SummonCursorItem(22610); -- Item: An Enchanted Helm Mold
		elseif(e.message:findi("bracer")) then
			e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Iron, 1 Gnoll Backbone, 1 Gnoll Scoutsmans Documents and 1 Throwing Spear in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Bracer.");
			e.other:SummonCursorItem(22611); -- Item: An Enchanted Bracer Mold
		elseif(e.message:findi("armguard")) then
			e.self:Say("To create your armguards material you will need to combine 2 Bricks of Crude Iron, 2 Ruined Wolf Pelts, 1 Diseased Wolf Pelt and 1 Arrow in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Armguards.");
			e.other:SummonCursorItem(22613); -- Item: An Enchanted Armguard Mold
		elseif(e.message:findi("boot")) then
			e.self:Say("To create your boot material you will need to combine 3 Bricks of Crude Iron, 1 Brown Bear Femur and 2 Blackburrow Gnoll Pelts in your assembly kit, Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Boots.");
			e.other:SummonCursorItem(22612); -- Item: An Enchanted Boot Mold
		elseif(e.message:findi("greave")) then
			e.self:Say("To create your greaves material you will need to combine 4 Bricks of Crude Iron, 1 Giant Spider Egg Sack, 1 Black Wolf Tooth, 1 Bottle and 1 Young Puma Skin in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Greaves.");
			e.other:SummonCursorItem(22614); -- Item: An Enchanted Greaves Mold
		elseif(e.message:findi("gauntlet")) then
			e.self:Say("To create your gauntlet material you will need to combine 3 Bricks of Crude Iron, 1 Giant Fire Beetle Carapace, 1 Lion Tooth, and 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Gauntlets.");
			e.other:SummonCursorItem(22615); -- Item: An Enchanted Gauntlet Mold
		elseif(e.message:findi("breastplate")) then
			e.self:Say("To create your breastplate material you will need to combine 5 Bricks of Crude Iron, 1 Low Quality Bear Skin, 1 Woven Spider Silk, 1 Lock of Scarecrow Straw, 1 Matted Lion Pelt and 1 Bandit Sash in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Wind Spirits Breastplate. When you are finished with your Breastplate and have completed your armor set please come see me for one [final exercise].");
			e.other:SummonCursorItem(22616); -- Item: An Enchanted Breastplate Mold
		elseif(e.message:findi("final exercise")) then
			e.self:Say("I need your help with ridding the hills of some of the most vile creatures, the gnolls of course! My resident alchemist has instructed me that he needs some items from these furballs for a antidote he is working on. I need you to bring me 2 Vials of Gnoll Blood and 2 Gnoll Pelvises. Once you have returned with these items I will reward you with a weapon worthy of the finest Qeynos Songweaver. I look forward to seeing you soon.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Hello, there! I am Sollari Bekines of the League of Antonican Bards. I am at your service to train you as best I can. There have been a number of young bards entering our concert halls lately seeking guidance."); -- made up text		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27423, item2 = 27423, item3 = 27424,item4 = 27424})) then
		e.self:Say("I will get this to my friend at once so that he can finish his antidote. I appreciate all you have done for me and you have surely proven yourself as a worth songweaver! Please take this blade I have forged for all graduates of my tests. May it lead you to unforeseen treasures and guard you always.");
		-- Confirmed Live Experience and Factions.
		e.other:Faction(e.self,284,10,0); -- league of antonican bards
		e.other:Faction(e.self,281,1,0); -- knights of truth
		e.other:Faction(e.self,262,1,0); -- guards of qeynos
		e.other:Faction(e.self,304,-1,0); -- ring of scale
		e.other:Faction(e.self,285,-1,0); -- mayong mistmoore
		e.other:QuestReward(e.self,{itemid = 27493,exp = 500}); -- Item: Wind Spirits Longsword
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1050 -- Sollari_Bekines
