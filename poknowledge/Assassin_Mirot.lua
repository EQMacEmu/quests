--Rogue Tome Handins/Planar Armor Exchange
---- Added update for Training Day - mrhodes
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("gives a sharply raised brow and cruelly wicked smirk, his comely features contorted in a sinister mask of disgust and amusement. 'Well, how charming of you to find it within your heart to visit Kartis, my dear pathetic " .. e.other:GetCleanName() .. ". Do not think that you will be received in the manner you had hoped, for we are in the city of knowledge where tolerance for all beings to one extent or another is mandatory. Aaaah, yes, we will tolerate your existence among us, but only for the amusement of watching you squirm uncomfortably when presented with the truth of our purpose. Even further the amusement would stretch is if you would have the audacity to train from one of our adepts -- who are, I assure you, most eager to lend their dark arts to you, for it only fuels the shadow, despite your intent on learning from us.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local count = item_lib.count_handed_item(e.self, e.trade, {4901, 4902, 4903, 4904, 4905, 4906, 4907}); --Woven Shadow Armor
	if(count > 0) then
		repeat
			e.self:Say("Thank you, " .. e.other:GetCleanName() .. "."); --Text made up
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
