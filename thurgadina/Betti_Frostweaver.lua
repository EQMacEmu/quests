-- sixth coldain prayer shawl

 function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well, hello there, dear.  It sure gets cold here, doesn't it? Perhaps I can interest you in a sewing pattern to pass the time and keep you warm.");
	elseif(e.message:findi("embroidered")) then
		e.self:Say("It will be an honor to assist you in fashioning an embroidered shawl. It is a very demanding product and I can see from the look in your eyes that you desire to burn your sewing kit in our furnace, but if you persevere, your efforts will be richly rewarded. When you are ready you must carefully weave a spool of sacred Coldain thread. Take the thread, this pattern, and the silk shawl and carefully embroider the pattern. The result will be most exquisite. Please show me if you manage to create one.");
		e.other:SummonCursorItem(1833); -- Item: Embroidered Shawl Pattern
	elseif(e.message:findi("pattern")) then
		e.self:Say("Let me have another look at the Embroidered shawl please, " .. e.other:GetCleanName() .. ".");
	elseif(e.message:findi("sacred coldain thread")) then
		e.self:Say("Take a woven frost giant beard, two siren's hairs, two manticore manes and two drakkel dire wolf whiskers, and combine them in a sewing kit. The resulting thread will enhance your shawl's power when embroidered in a special pattern.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1198}, 0)) then
		e.self:Say("Spectacular artistry! I doubt I could have done better myself. You'll have to forgive me, I know time is short and I tend to carry on. This is the pattern for the making of a rune sacred to our people. It will be our final test of your craftsmanship and will put many of your skills to the test, but I trust you'll find the finished product to be more than worth the effort. Show Gilthan the embroidered shawl, he will set you on the path. May Brell always be with you outlander.");
		e.other:QuestReward(e.self,{items = {1198,1849}}); -- Item: Embroidered Coldain Prayer Shawl
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
