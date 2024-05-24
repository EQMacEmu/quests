-- leafrunners quest 

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Pleased to meet you, " .. e.other:GetCleanName() .. ". I am Aliafya Mistrunner Preserver of Nature and loyal servant of Tunare. I have resided in this guild house for many of my years. I pride myself on being a mentor to many young druids of Tunare that come up through our ranks. If you are a [druid of Tunare] then I might have some work for you.");
	elseif(e.message:findi("druid of Tunare")) then
		e.self:Say("I am always pleased to see new faces amongst us indeed " .. e.other:GetCleanName() .. ". However, I must learn if you are loyal to your house and your god by asking you to complete a series of training exercises. These tests will enable you to learn your way around this great land we call home and to pick up some very valuable hunting skills that will aid you in all of your battles to come. When you are [ready to begin your training] I will present you with your Leafrunners Assembly Kit.");
	elseif(e.message:findi("ready to begin")) then
		e.other:SummonCursorItem(17366); -- Item: Leafrunners Assembly Kit
		e.self:Say("Here is your Leafrunners Assembly Kit, " .. e.other:GetCleanName() .. ". In this kit you will place a number of [magical components] that will be infused together to create armor materials used to crafting Leafrunners Leather Armor. Once you have created the armor materials you will then take them to a loom along with the correct pattern to fashion together your armor piece.");
	elseif(e.message:findi("magical components")) then
		e.self:Say("The components you will need to collect for your armor will take you to all parts of the faydark. These items can be found on some of the deadliest creatures and also on some of our most trust worthy merchants. Once you are ready to begin creating your armor pieces simply tell me what piece you [want] to craft. I can provide you with the material recipes and patterns for Leafrunners [Caps], [Bracers], [Sleeves], [Boots], [Leggings], [Gloves] and [Tunics].");
	elseif(e.message:findi("boot")) then
		e.other:SummonCursorItem(22674); -- An Enchanted Boots Pattern
		e.self:Say("To create your boots material you will need to combine 3 Woven Spider Silks, 1 Burned Out Lightstone, 1 Water Flask in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Boots of the Leafrunner.");
	elseif(e.message:findi("bracer")) then
		e.other:SummonCursorItem(22672); -- An Enchanted Bracer Pattern
		e.self:Say("To create your bracer material you will need to combine 1 Woven Spider Silks, 1 Wasp Wing, 1 Coyote Skull and 1 White Wine in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Bracer of the Leafrunner.");
	elseif(e.message:findi("cap")) then
		e.other:SummonCursorItem(22628); -- An Enchanted Cap Pattern
		e.self:Say("To create your cap material you will need to combine 2 Woven Spider Silks, 1 Spiderling Legs, 1 Fairy Dust and 1 Fishing Bait in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Cap of the Leafrunner.");
	elseif(e.message:findi("glove")) then
		e.other:SummonCursorItem(22633); -- An Enchanted Gloves Pattern
		e.self:Say("To create your gloves material you will need to combine 3 Woven Spider Silks, 1 Orc Tibia, 1 Orc Pelvis Bone, and 1 Crushbone Belt in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Gloves of the Leafrunner.");
	elseif(e.message:findi("legging")) then
		e.other:SummonCursorItem(27570); -- An Enchanted Leggings Pattern
		e.self:Say("To create your leggings material you will need to combine 4 Woven Spider Silks, 1 Orc Finger Bones , 1 Orc Foot Bones, 1 Small Lantern in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Leggings of the Leafrunner.");
	elseif(e.message:findi("sleeve")) then
		e.other:SummonCursorItem(22631); -- An Enchanted Sleeves Pattern
		e.self:Say("To create your sleeves material you will need to combine 2 Woven Spider Silks, 2 Pixie Wings, and 1 Torch in your assembly kit. Once you have created the proper material, place the pattern and the Sleeves of the Leafrunner material in to a sewing kit and combine it. You will now have Sleeves of the Leafrunner.");
	elseif(e.message:findi("tunic")) then
		e.other:SummonCursorItem(22677); -- An Enchanted Tunic Pattern
		e.self:Say("To create your tunic material you will need to combine 5 Woven Spider Silks, 1 Pristine Forest Drakeling Scale, 1 Golden Bandit Tooth, 1 Orc Ribcage and 1 Legionnaires Bracer in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Tunic of the Leafrunner. When you have completed all of your armor pieces please return to me when you are [ready to complete the test of loyalty].");
	elseif(e.message:findi("ready to complete the test of loyalty")) then
		e.self:Say("There have been numerous attacks mounted lately by the orcs of Clan Crushbone. With their stronghold ever so close to us it is feared that a full-scale attack could level our city and at the very least, leave many of our bretheren dead by the hands of the filthy orcs. What I ask is that you bring me the detailed battle plans that only the highest ranking orcs could be carrying. Bring me these battle plans along with 2 pairs of Crushbone Battle Beads and I will surely reward you for your trouble.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27537,item2 = 27537,item3 = 27538})) then
		e.self:Say("There was no doubt in my mind that you could be counted on for this important mission. I will see that our tacticians get these battle plans so that they can be studied at once. Please take this Scimitar as a symbol of your dedication to your house and your god. You have done well, young Kiliak, may Tunare guide you always.");
		e.other:Faction(e.self,310,5); -- soldier of Tunare
		e.other:Faction(e.self,279,1); -- King Tearis Thex
		e.other:Faction(e.self,246,1);  -- Faydark's Champions
		e.other:QuestReward(e.self,0,0,0,0,27531,200); -- Item: Scimitar of the Leafrunner
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54072 -- Aliafya_Mistrunner
