-- fifth coldain prayer shawl

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmmm, ye be one o them offlanders, don't ye? I've heard some strange tales o yer kind so don't be tryin' any funny business with me. I know the value of a platinum piece and I'll not get cheated by yer foreign coin.");
	elseif(e.message:findi("prayer shawl")) then
		e.self:Say("Gather five strands of crystalline silk thread and combine them in a sewing kit to make a crystalline silk fiber. Take this container and combine a glowing shardwurm bile with three of the fibers to form a piece of glowing crystalline silk. Five pieces of glowing crystalline silk sewn to your fur-lined shawl will yield a beautiful silk shawl. Become a master in the art of tailoring before risking all you've worked for and be sure to let me inspect your work when it's complete.");
		e.other:SummonCursorItem(17879); -- Item: Glowing Bile Soaker
	elseif(e.message:findi("worthy")) then
		e.self:Say("To ensure your worthiness you must continue to refine your prayer shawl. Speak with my wife Betti regarding the embroidered shawl and listen carefully to her words. Hurry now, there seems to be a sense of urgency about.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1179}, 0)) then
		e.self:Say("Splendid, " .. e.other:GetCleanName() .. ", this is beautiful workmanship! As the Grand Historian may have mentioned, our esteemed Dain Frostreaver the fourth is making some important plans with his council. These plans will doubtlessly include you if the Dain deems you worthy.");
		e.other:QuestReward(e.self,{itemid = 1179}); -- Item: Silk Coldain Prayer Shawl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
