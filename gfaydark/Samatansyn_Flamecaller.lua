function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is a pleasure to meet you " .. e.other:GetCleanName() .. ", I am Samatansyn Flamecaller, Warder of Tunare and Guildmaster of Faydarks Champions. I have studied here for many of my years until recently when I took up teaching. I have many pupils that undergo my vigorous [training exercises].");
	elseif(e.message:findi("training exercises")) then
		e.self:Say("I have a series of tests that all new rangers of Kelethin are suggested to participate in. These tests will help you develop many of your skills including hunting and gathering and will also provide you with a chance to fashion your own Trueshot Chainmail. If you are a [ranger of Tunare] and are willing to begin your training I will be happy to explain to you how the tests work.");
	elseif(e.message:findi("ranger of tunare")) then
		e.self:Say("Excellent " .. e.other:GetCleanName() .. ", then lets get started! Here is your Trueshot Assembly Kit. You will collect various items from the Faydark and Clan Crushbone that will be necessary for creating your armor materials in your assembly kit. Once you have fashioned together a specific armor material you can then take it to a forge along with the applicable pattern to create your Trueshot Chainmail armor piece. Simply tell me what armor piece you [want] to craft and I can provide you with the material recipes and patterns for Trueshot Chainmail [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
		e.other:SummonCursorItem(17367); -- Item: Trueshot Assembly Kit
	elseif(e.message:findi("coif")) then
		e.self:Say("To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Royal Jelly, 1 Spiderling Eye and 1 Ration in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Coif.");
		e.other:SummonCursorItem(22671); -- Item: An Enchanted Coif Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To create your bracer material you will need to combine 1 Brick of Crude Bronze, 1 Skeleton Tibia, 1 Pixie Wing and 1 Gypsy Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Bracer.");
		e.other:SummonCursorItem(22672); -- Item: An Enchanted Bracer Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Wasp Venom Sacs, 1 Large Widow Abdomen and 1 White Wine in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Sleeves.");
		e.other:SummonCursorItem(22673); -- Item: An Enchanted Sleeves Pattern
	elseif(e.message:findi("boot")) then
		e.self:Say("To create your boots material you will need to combine 3 Bricks of Crude Bronze, 1 Severed Orc Foot, 2 Spider Legs in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Boots.");
		e.other:SummonCursorItem(22674); -- Item: An Enchanted Boots Pattern
	elseif(e.message:findi("legplates")) then
		e.self:Say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze, 1 Orc Fibula, 1 Orc Clavicle, and 1 Lightstone in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Legplates.");
		e.other:SummonCursorItem(22675); -- Item: An Enchanted Legplates Pattern
	elseif(e.message:findi("gauntlet")) then
		e.self:Say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Orc Ulna, 1 Orc Tibia, and 2 Orc Finger Bones in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Gauntlets.");
		e.other:SummonCursorItem(22676); -- Item: An Enchanted Gauntlets Pattern
	elseif(e.message:findi("tunic")) then
		e.self:Say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Orc Fibula, 1 Golden Bandit Tooth, 1 Pristine Forest Drakeling Scale, 1 Orc Ribcage and 1 Orc Eye in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Trueshot Chainmail Tunic. Please return to me after you have completed your tunic, for I have one final [favor] to ask of you.");
		e.other:SummonCursorItem(22677); -- Item: An Enchanted Tunic Pattern
	elseif(e.message:findi("favor")) then
		e.self:Say("I have received word that there are numerous elves being held hostage in the confines of Clan Crushbone, beaten and forced to perform slave work under horrible conditions. There is believed to be a specific Orc that patrols the jail cells that has a master key in his possession for all of the elven hostages. If you were to retrieve this master key for me I would possibly be able to make copies of it and distribute them to my task force so that we may attempt to rescue our helpless bretheren. Will you [retrieve the master key]?");
	elseif(e.message:findi("retrieve the master key")) then
		e.self:Say("Excellent news, I was afraid I would not be able to find someone willing to help. Please bring me the master key along with 2 Orc Eyes and I shall craft you a long sword worthy of your great deeds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27539,item2 = 13266,item3 = 13266})) then -- Faydark Champions Long Sword, from Cb Cell Key
		e.self:Say("Well done, " .. e.other:GetCleanName() .. "! Now we will be able to free more of our brothers and sisters from the orcs! Take this, as promised, a fine weapon with which to slay more orcs!!");
		e.other:QuestReward(e.self,0,0,0,0,27532,7000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54071 -- Samatansyn Flamecaller