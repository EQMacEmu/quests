function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Praise to the ancients, my friend! There is much suffering to be given unto the world. I am the Prime Hierophant of the Temple of Terror.  Through me and my fellow priests flows the wisdom of our ancestors.");
	end
	if(e.message:findi("unique weapon")) then
		e.self:Say("This goblin is known as a pit fighter. Though they are small, weak, and unintelligent, they still maintain a level of ferocity that surpasses that of most wild animals. This, along with a disgusting and perverse imagination, has allowed these pit fighters to reach heights of physical power most Iksar never see. This paticular fighter uses his tongue liberally while fighting. He has ingested many deadly contagions and licked things from the slimy surfaces of the darkest and dankest crevasses imaginable. His tongue will do well to further our cause in pain and suffering.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "Aren't you forgetting something, dear " .. e.other:GetCleanName() .. "?'  He stands still for a moment, sneering, then suddenly screeches at the top of his lungs, 'DO NOT RETURN UNLESS YOU HAVE ALL THAT I ASKED FOR!";	
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18206})) then --guild summon
		e.self:Say("Welcome, young petitioner. You have been summoned to this temple to join with the Scaled Mystics. Ours is the way of pain and suffering. Here is the weapon of a petitioner. Through you the power of our ancestors shall flow. As your wisdom grows, so shall your power. Someday you may be a vessel for the supreme might of the ancients. Seek knowldege within this temple. The hierophants are here to guide you.");
		e.other:Faction(e.self,445,100); 	--Scaled Mystics
		e.other:Faction(e.self,441,25); 	--Legion of Cabilis
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,5140,500); 	--Iron Cudgel of the Petitioner
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18462, item2 = 22917})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,1); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 18359, item2 = 22916})) then
		e.self:Emote("smiles at your dedication to Cazic Thule and hands you a small gem.");
		e.other:Faction(e.self,444,1); -- Faction: Swift Tails
		e.other:Faction(e.self,441,1); -- Faction: Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,7881,20000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14795})) then
		e.self:Emote("takes the note without even a glance in your direction and begins reading. After a long silence, he lets his arms drop to his sides and says quietly, 'We kill, " .. e.other:GetCleanName() .. ". That is our job, our duty in life. Our targets are chosen for us. We merely listen. Right now I am being told there is a traitor right here in our city. You must make this potion made of Spine Poison Extract and Willow Moss.  You must give this to one of our slave and bring me the goo from it along with two Fire Emeralds. As you do this, try hard to listen to our Lord's instruction. If you hear even a whisper, you will know more righteousness than most of this city.'"); -- text made up
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14790})) then
		e.self:Emote("stares down at the note, confused, until he recognizes the writing and gasps in shock! 'You spoke to the Brothers? You, a simple Legionnaire? Well, no matter, you are here to test your virtue of sacrifice and we will take pleasure in it as we have for generations even before the Fallen Brothers. One of our greatest allies in pain is disease. In the woods outside our fair city is a small tribe of goblins. There is a certain goblin famed for his [unique weapon]. Take this knife and use it to cut this from the goblin. Then return his weapon, the knife, a sapphire, and an opal to me.'");
		e.other:QuestReward(e.self,0,0,0,0,14784);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14784, item2 = 14785, item3 = 10034, item4 = 10030},1,text)) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,14786,10000);
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 10033, item2 = 10033, item3 = 14805},1,text)) then
		e.self:Say("Well done");
		e.other:QuestReward(e.self,0,0,0,0,14787,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills, with thanks to BWStripes
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
