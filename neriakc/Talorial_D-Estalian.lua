function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("On what grounds do you think you are welcome to address me like that vermin? I am afraid you will have to prove yourself to me before I can treat you with any respect. Do you feel that you are [worthy] to stand before me?");
	elseif(e.message:findi("worthy")) then
		e.self:Say("Very well then, you are lucky that I have been looking for some sort of an apprentice to help me out in gathering some hides from those nasty halflings. I did have a young one as yourself working for me before but unfortunately they didn't work out as you can see by looking at this autopsy table. I would hope that you will complete my [tasks]. for your sake.");
	elseif(e.message:findi("task")) then
		e.self:Say("If you are willing to [gather some items] that are needed for specific halfling hides I can offer you with the resources necessary to fashion your own armor.");
	elseif(e.message:findi("gather some item")) then
		e.self:Say("Excellent " .. e.other:GetCleanName() .. ". Please take this Old Enchanted Tailors Kit. It contains magical power that is able to fashion specific components into a magical version of whatever the core material is. If you are a Necromancer you will need to gather halfling hides that have been infused with many different elements that you will collect and combine in this box. Simply tell me what pattern you want and I will present you with the recipe necessary for [Gloves], [Robe], [Trousers], [Sleeves], [Skullcap], [Bracers] and [slippers]. I  would recommend you fashion your Robe last due to the difficulty and complex nature that is involved with finding the items necessary.");
		e.other:SummonCursorItem(17244); -- Item: Old Enchanted Box
	elseif(e.message:findi("glove")) then
		e.self:Say("If you are interested in making your own Unholy Silk Gloves you will need to gather 3 Halfling Hides, 2 Snake Eggs, 2 Spiderling Silks and a Cask which can be found in town. Once you have collected these items combine them in the Old Enchanted box to fashion your Infused halfling hide. Please make sure that you have prepared the correct halfling hide before you approach a loom with the pattern I have given you.");
		e.other:SummonCursorItem(22588); -- Item: An Enchanted Gloves Pattern
	elseif(e.message:findi("bracer")) then
		e.self:Say("To make your own Unholy Silk Bracer you will need to gather 1 Halfling Hide, 1 Deathfist Scouts Scalp and 2 Snake Eggs. Once you have collected these items combine them in the Old Enchanted box to fashion your Infused halfling hide. Please make sure that you have prepared the correct halfling hide before you approach a loom with the pattern I have given you.");
		e.other:SummonCursorItem(22584); -- Item: An Enchanted Bracer Pattern
	elseif(e.message:findi("trouser")) then
		e.self:Say("To make your own Unholy Silk Trousers you will need to collect many items in the forest along with a few in town. The halfling hide that you will need along with a pattern to craft together these Trousers will need to be infused with 4 Halfling Hides, 2 Bone Chips, 3 Spiderling Silks and 1 Raw Bamboo. All of these items will be collected in the field with the exception of the Raw Bamboo which can be bought in town. Please make sure that you have prepared the correct halfling hide before you approach a loom with the pattern I have given you.");
		e.other:SummonCursorItem(22587); -- Item: An Enchanted Trousers Pattern
	elseif(e.message:findi("slipper")) then
		e.self:Say("If you are interested in making your own Unholy Silk Slipper you will need to gather 2 Halfling Hides, 2 Malachites, and 2 fire beetle eyes. Once you have collected these items combine them in the Old Enchanted box to fashion your Infused halfling hide. Please make sure that you have prepared the correct halfling hide before you approach a loom with the pattern I have given you.");
		e.other:SummonCursorItem(22630); -- Item: An Enchanted Slippers Pattern
	elseif(e.message:findi("sleeve")) then
		e.self:Say("If you wish to fashion together your own Unholy Silk Sleeves you will need to gather 3 Halfling Hides, 1 Fire Beetle Leg, 4 Bone Chips and 2 bandages. Once you have collected these items combine them in the Old Enchanted box to fashion your Infused halfling hide. Please make sure that you have prepared the correct halfling hide before you approach a loom with the pattern I have given you.");
		e.other:SummonCursorItem(22586); -- Item: An Enchanted Sleeves Pattern
	elseif(e.message:findi("skullcap")) then
		e.self:Say("In order to fashion your own Unholy Silk Skullcap you will need to collect a few things and then combine them in the kit I presented you with earlier. Gather 1 Halfling Hide, 2 Deathfist Scouts Scalp and a bottle of Red Wine. After you have done this you will receive an Infused Halfling Hide. Please make sure that you have prepared the correct halfling hide to be combined with this Skullcap pattern because others will not work. Seek out a loom and reap the rewards of your hard work.");
		e.other:SummonCursorItem(22583); -- Item: An Enchanted Cap Pattern
	elseif(e.message:findi("robe")) then
		e.self:Say("Your Unholy Silk Gown is your most important and symbolic item you that will be able to craft on your own. I would recommend that you have already gone through the steps of crafting your other pieces before your Gown. If you think that you are ready you will need to collect 4 Halfling Hides, 1 Black Wolf Pelt, 2 Embalming Dusts, 1 Halfling Toe, 1 Bear Meat and 1 Fish Wine. Combine all of these in your box to create the Infused hide then use this Robe pattern along with your Infused hide on the nearest loom to reap the rewards of your hard work.  Please come back after you have fashioned your robe. I may have a [final test] for you.");
		e.other:SummonCursorItem(22589); -- Item: An Enchanted Robe Pattern
	elseif(e.message:findi("final test")) then
		e.self:Say("The final test that I require one to complete before I am content with them being knowledgable in the early ways of Necromancy is one that will test your determination. Are you ready to be tested?");
	elseif(e.message:findi("ready to be test")) then
		e.self:Say("Very well child. There is an ancient tome of Necromancy called the Writ of the Fallen. I have kept the binding of this sacred tome for a very long time however I have never searched for the pages that form the writ. If you are able to recover the 4 pages of the writ I have faith that you posses the power to bind them to this empty tome that I carry. Seek out these pages and bind them to this tome. I assure you that you will learn much from this writ shall you construct it once again. I believe the pages were in the hands of spirits that haunt the Ultricle still to this day. Good luck and excellent work.");
		e.other:SummonCursorItem(17243); -- Item: An Ancient Book Binding
	end
end
