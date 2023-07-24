--Planar Armor Exchange
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("raises a brow sharply, his beautiful features contorting into a flawless mask of regal superiority and a meager amusement in disdain toward " .. e.other:GetCleanName() .. ". 'I see that the ranting of Selia's zealous crusaders of 'passion and honor' have become even too much for those who once believed themselves of the same cause. Indeed, how marvelously intriguing. Perhaps now you reside in Kartis to bathe in the cold embrace of the shadow -- a promise of power has beckoned you, and your spirit heeds the call hungrily. Perhaps consciously, you do not see it -- or you are ashamed to admit the tantalizing, unbearable lure of guaranteed power, but you do feel it in your dreams, in the deepest recesses of your 'pure' soul. The hate. . . the glorious hate thrives in your eyes like blooming nightshade in the cold winter sun as they gaze upon me now. Aaaah. . . how beautiful it is. . . how truly beautiful you could be. Yes, I believe that you do indeed have a home here, in Kartis, among the shadows and the true power of this universe. Ha!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4881, 4882, 4883, 4884, 4885, 4886, 4887}); --Ethereal Mist Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
			e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(10028, 10037, 22503, 15981),300000); --Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
			count = count - 1;
		until count == 0;
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Imported from original file
function event_spawn(e)
	x = e.self:GetX();
	y = e.self:GetY();
	eq.set_proximity(x - 90, x + 90, y - 90, y + 90);
end

function event_enter(e)
	eq.signal(202273,5); --Qadar
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
