-- part of 7th coldain prayer shawl

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A ring or necklace for yer sweetheart, traveler? It'll be sure ta brighten their day and ye'll not find finer craftmanship this side o' the Gretespeign.");
	elseif(e.message:findi("casing")) then
		e.self:Say("Combine two platinum bars, a small piece of velium and the casing pattern in a Jeweler's kit. Take the completed casing and the rune and combine them in the same kit. When this is done all that's left is to tailor the rune to the shawl with the pattern. Take the finished product to Borannin, I'm sure he's eager to speak with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1859}, 0)) then-- Item: Velium etched rune
		e.self:Say("I've heard of your mission, " .. e.other:GetCleanName() .. ". I must admit that I had my doubts you'd make it this far. The rune's creation is nearly impossible for even the most skilled of Coldain craftsmen. You should be exceedingly proud. Many have attempted this feat and nearly all have lacked the skill, faith, patience and persistence that is prerequisite for what destiny holds in store for you. You are now ready to use this pattern to construct the sacred rune's casing and complete the runed shawl.");
		e.other:QuestReward(e.self,{items = {1859,2040}});
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
