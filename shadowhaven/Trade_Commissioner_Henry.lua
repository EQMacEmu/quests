function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, traveler. I don't believe that I have seen you around these parts before- then again, I could have and simply forgotten since there have been so many new faces around here. However, if you are a newcomer to Shadowhaven, please make sure that you [register for trading] in the Haven. Registering with the Traders of the Haven will legitimize you in the eyes of local merchants and customers.");
	elseif(e.message:findi("register for trading")) then
		e.self:Say("It's great that you are interested " .. e.other:GetCleanName() .. ", you will surely be glad you did. I have some simple deliveries that I need completed if you wish to be a registered trader in Shadowhaven.");
	elseif(e.message:findi("deliveries")) then
		e.self:Say("The deliveries are simple enough, I just need you to bring some letters to some merchants of the Haven that are currently working in other locations. Will you [deliver these letters]?");
	elseif(e.message:findi("deliver these letter")) then
		e.self:Say("I surely do appreciate the help, " .. e.other:GetCleanName() .. "- clearly you understand the value of solid relations with the locals. First, I will need you to take this newsletter to Sateal. He is currently on assignment in the Bazaar and has been out of the loop on the happenings of Shadowhaven because of his heavy workload. Bring this to him and then return to me with his sales report. I look forward to seeing you soon.");
		e.other:SummonCursorItem(26055); -- Tattered Newsletter
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 26056}, 0)) then -- Sateals Economy Report
		e.self:Say("Great to see you back so soon " .. e.other:GetCleanName() .. ", you looked like a dependable person from the start. The next thing I need you to do is a bit more dangerous, but by the looks of you I doubt it will be a problem. Go to the Shadowhaven outpost in Fungusgrove and give Thar this book. Thar is a great merchant but I have seen his sales steadily declining, so I figured this book full of selling tips will help him regain his confidence and help him produce the kinds of numbers I know he is capable of. If his economy report is ready please, bring that back to me when you return.");
		e.other:QuestReward(e.self,0,0,0,0,26057,5000); -- Book of Sales Secrets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 26058}, 0)) then -- Thars Sales Report
		e.self:Say("Excellent work " .. e.other:GetCleanName() .. ", I knew that you were someone that I could trust to get the job done. The trader's union of Shadowhaven will hear of your solid work ethic. Perhaps a courier job is in your future, I couldn't have expected anyone to make these deliveries as fast as you did! Please take this amulet as a symbol of your dedication to Shadowhaven's booming economy. While wearing this you are sure to get all the greatest deals from the merchants of the Haven both here and in the bazaar. It was a pleasure meeting, you and thanks for all of your help.");
		e.other:Faction(e.self,1508, 200); -- Traders of the Haven
		e.other:Faction(e.self,1510, 20); -- House of Fordel
		e.other:Faction(e.self,1511, 20); -- House of Midst
		e.other:Faction(e.self,1512, 20); -- House of Stout
		e.other:QuestReward(e.self,0,0,0,0,26054,5000); -- Amulet of the Haven
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
