--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		if(e.other:Race() == "Dark Elf" or e.other:Race() == "Iksar" or e.other:Race() == "Troll" or e.other:Race() == "Ogre" or e.other:Class() == "Shadowknight" or e.other:Class() == "Necromancer") then
			e.self:DoAnim(48)
			e.self:Emote("gives a soft, though polite nod of greetings. 'You stand within the district of Tanaan -- one of neutrality, free of the constraints of zealous purpose and philosophies. We tolerate all in our midst, though I must warn you that your presence here may be challenged in question by the residents of this place. We do not hold your kind in a high regard, for we understand that your purpose in this universe is one of corruption and evil, despite your rational. Even if you have hopes of ascending beyond the preconceived judgment of your lineage, we shall not place trust in you. In any case, we of Tanaan shall uphold the law of this fair astral city and the knowledge that we have to offer is at your disposal should you be in need of it. However, I would suggest that you make way to the district of Kartis, where one of your kind would be received more warmly.'");
		else
			e.self:DoAnim(70);
			e.self:Emote("gives a deep, sweeping bow of proper and formal greetings. 'Welcome, Heiggan, to the district of Tanaan -- the true soul and core of the city of New Tanaan. We uphold a strict and fervent belief in neutrality; where corruption is viewed in ill regard and the unwavering iron belief of superiority and self-imposed justice is equally disliked in our midst. Though we of Tanaan are not like the scholars of Myrist, who have thrown down their mortal heritage in favor of the pursuit of inner-enlightenment and power beyond their mortal coils, we have not abandoned the true purpose of this city and offer our guidance and knowledge to all who we deem worthy of it from our own attentions. As a former enchanter in my existence upon Norrath, I am more than capable of mentoring those who practice my art if they should desire my guidance.'");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {1246, 1247, 1248, 1249, 1250, 1251, 1252}); --Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
	if(count > 0) then
		repeat
			e.self:Say("This looks good, thank you " .. e.other:GetCleanName() .. ".");
			-- Confirmed Live Experience: 300000
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
