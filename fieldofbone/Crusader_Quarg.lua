--Quests covered in this file:
--Shaman Skull Quest 3
--Shaman Skull Quest 4
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stands at attention and salutes you.  It would seem that he takes his job quite seriously.  'Do not fear, feeble soul.  The Crusaders of Greenmist are on duty.");
	elseif(e.message:findi("collect.* rok nilok")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Take this chest.  Inside, you shall combine the skull of their leader and at least five of the caste members.  You must then go to the swamp garrison and deliver the full chest along with your iron cudgel of the mystic to Mystic Dovan.  Go to him now and inquire of the crusaders of Rok Nilok.");
			e.other:SummonCursorItem(17035);
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("Show greater devotion to the Crusaders of Greenmist and you will obtain that which you seek.");
		else
			e.self:Emote("eye's glare red and gnashes his teeth.  'You had best avoid all members of the Temple of Terror.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	--give Crusader Quarg the note that Hierphant Zand gave to you
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18054})) then
		e.self:Say("Ah, i see you have proven yourself to Zand and he wishes to see more of your prowess.  go to the Tower of Kurn and bring him the Skulls of the Caste of Bone Brethren, a caste of powerful shamans who perished fighting undead in the Field of Bone several decades ago.");
		e.other:Faction(e.self,445, 10); --Scaled Mystics
		e.other:Faction(e.self,441, 10); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,17034,10000); --Give the player a six slot container to combine the 5 skulls with an "X" in
	--turn in the Full C.O.B.B. Chest and your Iron Cudgel of the Seer
	elseif(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12735, item2 = 5142})) then
		e.self:Say("The temple shall be pleased. As instructed by the Hierophants, here is your Iron Cudgel of the Mystic. You have done well that I must ask you to [collect the Crusaders of Rok Nilok].");
		e.other:Faction(e.self,445, 10); --Scaled Mystics
		e.other:Faction(e.self,441, 10); --Legion of Cabilis
		e.other:QuestReward(e.self,0,0,0,0,5143,20000); --Give the player the Iron Cudgel of the Mystic and  A Skull Chest (C.O.R.N. Chest) to combine Tiny Glowing Skulls in
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
