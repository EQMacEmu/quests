function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Hail and well met " .. e.other:GetCleanName() .. ". I am Shana Liskia, Enchantress of Freeport. I have studied my art for years here in our wonderful academy. I am also delighted to meet and teach those that come here to gain knowledge. My specialty however lies in Beguiling so I like to train young newcomers to our academy. Are you studying the ways of a [Magician] an [Enchanter] or a [Wizard]??");
		elseif(e.message:findi("magician") or e.message:findi("enchanter") or e.message:findi("wizard")) then
			e.self:Say("Wonderful! Let me be the first to tell you that your training here will be top notch and you will learn all that is to be known about being an enchanter should you put forth the willingness to learn. I will walk you through your early training and assist you in your hunting and gathering skills. I have created a [special sewing kit] that I present to all of the new initiates.");
		elseif(e.message:findi("special sewing kit")) then
			e.self:Say("This kit that I speak of is one that is able to magically infuse different components into materials used for creating Arcane Scientists Armor. The components that you use will be collected from numerous different areas and shops in Freeport. You will use these materials along with patterns that I will present you with to create your armor. Once you are [ready to begin] I will present you with your Enchanted Sewing Kit.");
		elseif(e.message:findi("ready to begin")) then
			e.self:Say("Very well. Here you are " .. e.other:GetCleanName() .. ", in this box you will combine specific component recipes as I mentioned before. When you are ready to attempt a specific piece you must tell me what piece you [want] to craft. For example if you had intent on crafting a cap you would say. [I want to craft a cap]. I can offer you the recipes for Arcane Scientists [Caps], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes]. I must also suggest that you attempt your robe last due to the difficult nature of collecting the correct components.");
			e.other:SummonCursorItem(17260); -- Enchanted Sewing Kit
		elseif(e.message:findi("sleeve")) then
			e.self:Say("Sleeves will be a great and necessary addition to your armor. To create your sleeve material you will need to combine 2 Woven Spider Silks, 2 Bone Chips, 1 Spider Legs and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sleeves.");
			e.other:SummonCursorItem(22586); -- An Enchanted Sleeves Pattern
		elseif(e.message:findi("bracer")) then
			e.self:Say("A wise choice indeed, having the correct wrist protection is very important in spell channeling. To create your bracer material you will need to combine 1 Woven Spider Silk, 1 Desert Tarantula Chitin, 1 Armadillo Tooth and a Cloth wristband in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Bracer.");
			e.other:SummonCursorItem(22584); -- An Enchanted Bracer Pattern
		elseif(e.message:findi("cap")) then
			e.self:Say("A cap will keep you safe from any attackers as well as the elements. To create your cap material you will need to combine 2 Woven Spider Silks, 1 Snake Fang, 1 Chunk of Meat and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Cap.");
			e.other:SummonCursorItem(22583); -- An Enchanted Cap Pattern
		elseif(e.message:findi("glove")) then
			e.self:Say("Gloves are very important for your early training especially Isola. While you are learning your first set of incantations you should not have to worry about any injuries to your hands. To create your glove material you will need to combine 3 Woven Spider Silks, 1 Giant Scarab Brain, 1 High Quality Cat Pelt 1 Zombie Skin and 1 Large Leaf Scarab Leg in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Gloves.");
			e.other:SummonCursorItem(22588); -- An Enchanted Gloves Pattern
		elseif(e.message:findi("sandal")) then
			e.self:Say("Sandals will keep you save from any harmful things you may walk in, it is a good idea to have them. To create your sandal material you will need to combine 3 Woven Spider Silks, 1 Coyote Pelt, 2 Black Bear Paws, 1 Urticating Hairs and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Sandals.");
			e.other:SummonCursorItem(22585); -- An Enchanted Sandals Pattern
		elseif(e.message:findi("trouser")) then
			e.self:Say("I would always recommend pants to all my new students since they are a very important part of your armor set. To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Embalming Dust, 1 Rotting Zombie Skull and 1 Armadillo Tail in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Trousers.");
			e.other:SummonCursorItem(22587); -- An Enchanted Trousers Pattern
		elseif(e.message:findi("robe")) then
			e.self:Say("I am very pleased to see that you have progressed through your armor pieces so quickly. I am also proud to see that you are ready to attempt your robe! To create your robe material you will need to combine 5 Woven Spider Silks, 1 Snake Bile, 1 Cutthroat Golden Tooth, 1 Shadow Wolf Tibia, 1 Orc Prayer Beads and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this mold to fashion your very own Arcane Scientists Robe. Be sure to come back to see me for a [final assignment] after you have completed your robe.");
			e.other:SummonCursorItem(22589); -- An Enchanted Robe Pattern
		elseif(e.message:findi("final assignment")) then
			e.self:Say("I have a trinket that was given to me by my mother a long time ago. Before she died I told her I would always keep it close to me. Recently, some militia officers came in to our academy and confiscated anything that appeared to be valuable. Fearing for my life I did not fight to keep the necklace my mother gave me. The officer that took it was named Teridsan. If you should find him you have my permission to kill him if that's what it takes to get my necklace back. Return to me when you have my necklace along with 2 Lion Teeth.");
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Hail and well met " .. e.other:GetCleanName() .. ". I am Shana Liskia, Enchantress of Freeport. I have studied my art for years here in our wonderful academy. I am also delighted to meet and teach those that come here to gain knowledge.");	-- text made up
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 9917,item2 = 9917,item3 = 9933})) then -- Lion Tooth x 2, Shana's Necklace
		e.self:Say("I am so happy to have my necklace back! I cannot begin to tell you how much this means to me " .. e.other:GetCleanName() .. ". Please take this dagger as a symbol of my sincere thanks. It was presented to me by the academy for my years of teaching but I hope you will take it. Good luck to you and come back to visit us soon!");
		e.other:Faction(e.self,220,25); -- Arcane Scientists
		e.other:Faction(e.self,281,6); -- Knights of Truth
		e.other:Faction(e.self,296,-3); -- Opal Dark Briar
		e.other:Faction(e.self,330,-3); -- The Freeport Militia
		e.other:QuestReward(e.self,0,0,0,0,9938,100); -- Dagger of the Academy
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Shana_Liskia
