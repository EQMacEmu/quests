function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Gud to meet ye there " .. e.other:GetCleanName() .. ". Me names Crovsar Dirkbringer and I run dis here mining operation. Anyone else that tell ye different simply aint telling da truth! I like to spend most of me time minin but I also like to help our young miners pick dere way to glory as a great rogue! Er I mean a great miner! Aye, dats it. If ye are a young minin [rogue] of Kaladim den I might just have some things for ye to do.");
	elseif(e.message:findi("rogue")) then
		e.self:Say("A young rogue ye say ye is eh Gilborn? Well den If`n yer ready to git your hands dirty and yer pockets full I will be happy to explain to you the [training] exercises dat I have our new recruits all undergo to earn dere keep in dese here mines!");
	elseif(e.message:findi("training")) then
		e.self:Say("Well den it must be obvious that not just any young miner can git his things and venture out into da world without the proper armor to protect dem Aye? Dis is why I have developed training exercises dat will test both yer fightin and collectin skills and will in da end yield you a full set of Apprentice Miners Chainmail! Now makin da armor will nat be hard at all because I will be able to give you the tools necessary too craft da armor pieces once you have created da correct armor [materials].");
	elseif(e.message:findi("materials")) then
		e.self:Say("Now were talkin! I can see dat ye are very interested in carving yer way into da Kaladim history books so lets git started. First off you will use this Dusty Mail Assembly Kit to collect various magical items that can be combined in da kit to create the armor materials that I spoke of earlier. You will then take the material to a forge along with patterns that I will present ye with to create da specific armor piece ye asked for. When ye are ready simply say what armor piece ye want to craft and I can provide ye with the armor material recipes and patterns for Apprentice Miners [Coifs], [Bracers], [Sleeves], [Boots], [Legplates], [Gauntlets] and [Tunics].");
		--Summon: Dusty Mail Assembly Kit
		e.other:SummonCursorItem(17247)
	elseif(e.message:findi("boots")) then
		e.self:Say("To create your boots material you will need to combine 3 Bricks of Crude Bronze, 1 Cracked Giant Scarab Carapace, 2 Runny Eye Warbeads and 1 Snake Scale and 1 Spiderling Silk in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Boots.");
		--Summon: Crude Boots Mold
		e.other:SummonCursorItem(19634); -- Item: Crude Boot Mold
	elseif(e.message:findi("bracers")) then
		e.self:Say("To create your bracer material you will need to combine 1 Bricks of Crude Bronze, 1 Orc Scoutsmans Wrist Pouch, 1 Towering Brute War Helm and 1 Bandage in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Bracer.");
		--Summon: Crude Bracer Mold
		e.other:SummonCursorItem(19632); -- Item: Crude Bracer Mold
	elseif(e.message:findi("coifs")) then
		e.self:Say("To create your coif material you will need to combine 2 Bricks of Crude Bronze, 1 Skunk Scent Gland, 1 Snake Scale and 1 Mead in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Coif.");
		--Summon: Crude Helm Mold
		e.other:SummonCursorItem(19631); -- Item: Crude Helm Mold
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("To create your gauntlets material you will need to combine 3 Bricks of Crude Bronze, 1 Barmas Tongue, 1 Aqua Goblin Headdress, 1 Goblin Parts and 1 Dwarven Bandit Coinpurse in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Gauntlets.");
		--Summon: Crude Gauntlets Mold
		e.other:SummonCursorItem(19633); -- Item: Crude Gauntlets Mold
	elseif(e.message:findi("legplates")) then
		e.self:Say("To create your legplates material you will need to combine 4 Bricks of Crude Bronze, 1 Symbol of Hatred, 1 Aqua Goblin Tongue and 1 Severed Greenblood Finger in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Legplates.");
		--Summon: Crude Greaves Mold
		e.other:SummonCursorItem(19636); -- Item: Crude Greaves Mold
	elseif(e.message:findi("sleeves")) then
		e.self:Say("To create your sleeves material you will need to combine 2 Bricks of Crude Bronze, 2 Giant Bat Fur, 1 Spider Legs and 1 Giant Scarab Egg Sack in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Sleeves.");
		--Summon: Crude Vambraces Mold
		e.other:SummonCursorItem(19635); -- Item: Crude Vambrace Mold
	elseif(e.message:findi("tunics")) then
		e.self:Say("To create your tunic material you will need to combine 5 Bricks of Crude Bronze, 1 Enraged Goblin Beads, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Basilisk Tongue and 1 Goblin Parts in your assembly kit. Once you have created the proper material take it to a forge along with this mold to fashion your very own Apprentice Miners Tunic. When ye finish yer tunic come on back fer I got one more [assignment] for a miner that I know I can trust!");
		--Summon: Crude Breastplate Mold
		e.other:SummonCursorItem(19637); -- Item: Crude Breastplate Mold
	elseif(e.message:findi("assignment")) then
		e.self:Say("Well da assignment is simple " .. e.other:GetCleanName() .. ". I jess simply need ye to fetch me some items that I need to create a minin pick dat I plan on distributing to all da new miners around dese parts dat pass my exercises, much like yerself. If you would like to help me [collect] the items I need I could perhaps fix ye up one of dese first minin picks. Whatta ya say dere " .. e.other:GetCleanName() .. "?");
	elseif(e.message:findi("collect")) then
		e.self:Say("Das great news to hear indeed! Please seek out 1 Aqua Goblin Backbone and 2 Pristine Skunk Claws and I will surely reward ye for yer trouble. I hope to see ye soon!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28067, item2 = 28068, item3 = 28068})) then
		e.self:Say("Ah thank ye " .. e.other:GetCleanName() .. ". Here is yer minin pick.");
		--Summon: Sharpened Mining Pick
		e.other:QuestReward(e.self,0,0,0,0,26078); -- Item: Sharpened Mining Pick
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
