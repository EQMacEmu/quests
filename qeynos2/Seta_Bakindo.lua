function event_say(e)
	if(eq.is_the_shadows_of_luclin_enabled()) then
		if(e.message:findi("hail")) then
			e.self:Say("Ah... Welcome friend. I am Master Seta, of the Silent Fist Clan. We know that true strength lies inside your soul. Once you have found and mastered it, your fists will be deadlier than any blade.  I am also currently in charge of training our new recruits. If you are new monk of the Silent Fist I  have some [tests] for you to complete.");
		elseif(e.message:findi("what test")) then
			e.self:Say("I pride myself on passing some of the finest monks in all of the lands through my testing halls. I mainly attribute this fact to my training program that all young monks must undergo. When you are [ready to begin the tests] I will present you with your Silent Fist Assembly Kit and explain to you how the tests work.");
		elseif(e.message:findi("ready") or e.message:findi("begin")) then
			e.self:Say("Be mindful of your surroundings " .. e.other:GetCleanName() .. ", it is here in Qeynos and in the adventuring areas surround it that you will find all the necessary items for creating Armor of the Silent Fist. You will place a number of items in this kit to create infused armor materials. These magical armor materials can then be combined in a loom with a magical pattern to create different Armor of the Silent Fist pieces. When you are ready to collect the items for a specific armor piece please tell me what armor piece you want to craft. I can present you with the patterns for Silent Fist [Cap], [Bracers], [Sleeves], [Sandals], [Trousers], [Gloves] and [Robes].");
			e.other:SummonCursorItem(17270); -- Silent Fist Assembly Kit ID-17270
		elseif(e.message:findi("cap")) then
			e.self:Say("To create your cap material you will need to combine 2 Woven Spider Silks, 1 Skeleton Tibia, 1 Field Rat Skull and a Cloth Cap in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Cap of the Silent Fist.");
			e.other:SummonCursorItem(22583); -- An Enchanted Cap Pattern ID-22583
		elseif(e.message:findi("bracer")) then
			e.self:Say("To create your bracer material you will need to combine 1 Woven Spider Silk, 2 Rat Whiskers, 1 Gnoll Jawbone and a Cloth Wristband in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Bracer of the Silent Fist.");
			e.other:SummonCursorItem(22584); -- An Enchanted Bracer Pattern ID-22584
		elseif(e.message:findi("sleeve")) then
			e.self:Say("To create your sleeves material you will need to combine 2 Woven Spider Silks, 2 Rabid Wolf Hides, and Cloth Sleeves in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sleeves of the Silent Fist.");
			e.other:SummonCursorItem(22586); -- An Enchanted Sleeves Pattern ID-22586
		elseif(e.message:findi("sandal")) then
			e.self:Say("To create your boot material you will need to combine 3 Woven Spider Silks, 1 Severed Gnoll Foot, 1 Gnoll Backbone, 1 Bone Chip and Cloth Sandals in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Sandals of the Silent Fist.");
			e.other:SummonCursorItem(22585); -- An Enchanted Sandals Pattern ID-22585
		elseif(e.message:findi("trouser")) then
			e.self:Say("To create your trouser material you will need to combine 4 Woven Spider Silks, 1 Bandit Sash, 1 Matted Lion Pelt and 1 Giant Spider Egg Sack in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Trousers of the Silent Fist.");
			e.other:SummonCursorItem(22587); -- An Enchanted Trousers Pattern ID-22587
		elseif(e.message:findi("glove")) then
			e.self:Say("To create your glove material you will need to combine 3 Woven Spider Silks, 1 Giant Fire Beetle Eye, 1 Chunk of Meat, 1 Ale and 1 Young Puma Skin in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Gloves of the Silent Fist.");
			e.other:SummonCursorItem(22588); -- An Enchanted Gloves Pattern ID-22588
		elseif(e.message:findi("robe")) then
			e.self:Say("To create your robe material you will need to combine 5 Woven Spider Silks, 1 High Quality Cat Pelt, 1 Shadow Wolf Paw, 1 Severed Gnoll Foot, 1 Matted Lion Pelt and 1 Cloth Shirt in your assembly kit. Once you have created the proper material take it to a loom along with this pattern to fashion your very own Robe of the Silent Fist. Please come see me after you have completed your robe. I need to see you for some help with a [problem] our clan has been having.");
			e.other:SummonCursorItem(22589); -- An Enchanted Robe Pattern ID-22589
		elseif(e.message:findi("problem")) then
			e.self:Say("There have been numerous muggings lately in Qeynos by corrupt guards. These guards are sworn to protect, server and uphold law in the city but all the do is break the law ten fold themselves. These corrupt individuals must be stopped. I have a [Silent Fist clan member] that I feel may be in trouble.");
		elseif(e.message:findi("silent fist clan member")) then
			e.self:Say("Konem Matse is my friend and mentor, he resides in Qeynos Hills providing security for the Sayers there. Lately though I have heard reports of guards demanding he pay them tax or else. This tax they speak of does not exist. I need you to go to the hills and help Konem. Rid the lands of these corrupt guards and bring me their heads as proof. I will also need 1 High Quality Gnoll Fur for a tailoring project I have been working on. Return to me with these items and you will be rewarded for your troubles.");
		elseif(e.message:findi("who.* tomer")) then
			e.self:Say("Oh, Tomer? We haven't heard from him in days, I'm really starting to worry. . . We need to have someone go [find him].");
		elseif(e.message:findi("find him")) then
			if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
				e.self:Say("One of our clan brothers has not reported back in over three days. He was sent to help defend the Qeynos Gates, and we haven't heard from him since. We need you to find him, if he is still alive. Tell him that Seta has sent you to find him, and escort him back to our guild. Good luck.");
			else
				e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
			end			
		elseif(e.message:findi("found tomer") or e.message:findi("brought tomer")) then
			e.self:Say("Great work " .. e.other:GetCleanName() .. ", we thought that was the last we'd seen of young Tomer.");
			eq.signal(2030,1);
		end
	else
		if(e.message:findi("hail")) then
			e.self:Say("Ah... Welcome friend. I am Master Seta, of the Silent Fist Clan. We know that true strength lies inside your soul. Once you have found and mastered it, your fists will be deadlier than any blade.  I am also currently in charge of training our new recruits."); -- text made up
		elseif(e.message:findi("problem")) then
			e.self:Say("There have been numerous muggings lately in Qeynos by corrupt guards. These guards are sworn to protect, server and uphold law in the city but all the do is break the law ten fold themselves. These corrupt individuals must be stopped. I have a [Silent Fist clan member] that I feel may be in trouble.");
		elseif(e.message:findi("silent fist clan member")) then
			e.self:Say("Konem Matse is my friend and mentor, he resides in Qeynos Hills providing security for the Sayers there. Lately though I have heard reports of guards demanding he pay them tax or else. This tax they speak of does not exist. I need you to go to the hills and help Konem. Rid the lands of these corrupt guards and bring me their heads as proof. I will also need 1 High Quality Gnoll Fur for a tailoring project I have been working on. Return to me with these items and you will be rewarded for your troubles.");
		elseif(e.message:findi("who.* tomer")) then
			e.self:Say("Oh, Tomer? We haven't heard from him in days, I'm really starting to worry. . . We need to have someone go [find him].");
		elseif(e.message:findi("find him")) then
			if(e.other:GetFaction(e.self) <= 5) then -- requires indifferent faction
				e.self:Say("One of our clan brothers has not reported back in over three days. He was sent to help defend the Qeynos Gates, and we haven't heard from him since. We need you to find him, if he is still alive. Tell him that Seta has sent you to find him, and escort him back to our guild. Good luck.");
			else
				e.self:Say("Your previous actions disgust me. Our guild will have nothing to do with the likes of you. Now, please, leave us be!");
			end			
		elseif(e.message:findi("found tomer") or e.message:findi("brought tomer")) then
			e.self:Say("Great work " .. e.other:GetCleanName() .. ", we thought that was the last we'd seen of young Tomer.");
			eq.signal(2030,1);
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- Silent Fist Clansman Hand Wraps require Sironans Head ID-27425, Yalroens Head ID-27426, and 1 High Quality Gnoll Fur ID-27427
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 27425, item2 = 27426, item3 = 27427})) then
		e.self:Say("There are many more corrupt guards. I am sure this is just the beginning. You have helped Konem and for that I thank you . You are well on your way to enlightenment and tranquility. I bid you farewell and wish you well where ever your travels may take you.");
		-- Confirmed Live Experience and Faction
		e.other:Faction(e.self,309,10); -- Silent Fist Clan faction
		e.other:Faction(e.self,262,1); -- Guards of Qeynos faction
		e.other:Faction(e.self,361,1); -- Ashen Order faction
		e.other:QuestReward(e.self,{itemid = 27494,exp = 500}); -- Silent Fist Clansman Hand Wraps ID-27494
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
