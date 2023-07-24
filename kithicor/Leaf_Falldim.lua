function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. " .. e.other:GetCleanName() .. "!  Respect the woods and all its inhabitants or face the wrath of the rangers.  Do not end up like [Maldyn Greenburn].");
	elseif(e.message:findi("maldyn greenburn")) then
		e.self:Say("Maldyn was once one of us.  He was the finest of archers.  Everyone aspired to be like him.  He soon was tempted to hunt.  The animals of these woods found themselves nothing more than moving targets for Maldyn's training.  We held a trial and exiled him to parts unknown.  He would take with him Morin's [Bow of Kithicor].  I was asked to find a worthy ranger to [retrieve the bow].");
	elseif(e.message:findi("bow of kithicor")) then
		e.self:Say("The Bow of Kithicor was carved from an ancient tree. It has great powers which were but a portion of the tree's mana. I seek a brave ranger to [retrieve the bow].");
	elseif(e.message:findi("retrieve the bow")) then
		e.self:Say("Search the lands of the Unkempt Druids in the Rathe Mountains.  I have heard of his arrows being found inside its territories and  of his death wish to hunt down its leader.  Retrieve the bow and return it to me and I shall give you the ivy etched gauntlets.");
	elseif(e.message:findi("ivy etched legging")) then
		e.self:Say("'I will make you an offer. If you be a ranger, as they are made for only a ranger, you must venture to Faydwer. There you shall seek out Lieutenant Leafstalker of the Kelethin army. He sent a message of his retrieval of the Quiver of Kithicor. Tell him you want it and return it to me. Oh... and one more [small item].");
	elseif(e.message:findi("small item")) then
		e.self:Say("Along with the quiver you shall journey to Erudin and purchase a Star of Odus gem to add to the quiver. Consider the coins you shall spend an offering to the woods.");
	elseif(e.message:findi("ivy etched boot")) then
		e.self:Say("'If you wish the ivy etched boots, you shall do me a favor. I am testing new arrow tips and wish a few of the hardest minerals I know of. From the mines of the Temple of Solusek Ro, ronium. From the land of Mistmoore, fetch me Mistmoore granite. Return these to me along with a guild offering of 2000 gold pieces.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text1 = "I asked for a guild donation of 2000 gold coins, Mistmoore granite and a bar of ronium.";	
	local text2 = "This is but a portion of the bow. I must have the other part.";
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12321,item2 = 12320},1,text2)) then
		e.self:Say("You have performed well, brave ranger. Put these upon your hands. Protection from the strongest of bowstring and magic are their greatest power. I do believe we have another mission which may yield you the [ivy etched leggings].");
		e.other:Faction(e.self,269,10); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3190,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 10059,item2 = 12328})) then
		e.self:Say("Wonderful!! I see he did find it. How lucky we are that he did all the hard work. My thanks to you are embodied in these ivy etched leggings. Now you may [earn the ivy etched boots] to go along with them.");
		e.other:Faction(e.self,269,10); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3191,10000);
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12305,item2 = 12306,gold = 1000},1,text1)) then
		e.self:Say("You have succeeded!! I believe I owe you the ivy etched boots.");
		e.other:Faction(e.self,269,10); -- kithicor residence
		e.other:Faction(e.self,302,1); -- protectors of the pine
		e.other:Faction(e.self,272,1); -- jaggedpine treefolk
		e.other:Faction(e.self,324,-1); -- unkempt druids
		e.other:QuestReward(e.self,0,0,0,0,3192,10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:kithicor  ID:20077 -- Leaf_Falldim
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
