-- Mistala's Report

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there, " .. e.other:GetCleanName() .. "! I am Lady Mistala Glimmerblade of the House of Fordel.  I preside over this great city of Shadowhaven along with my husband Daloran. I take great pride in knowing that our city has come so far and become a place of free trade and freedom for all of its inhabitants. We also are lucky to have some of the finest guardspersons in the land. Which reminds me, I need to collect my [report].");
	elseif(e.message:findi("retrieve.* daily.* reports")) then
		e.self:Say("Many thanks, " .. e.other:GetCleanName() .. ". The last I heard from Broansas he was heading for the Dawnshroud peaks. Please seek him out there and present him with this notarized letter so that he will know that I sent you. Return to me with his report as soon as you can. I await your return.");
		e.other:SummonCursorItem(4760); -- Item: A Notorized Letter
	elseif(e.message:findi("report")) then
		e.self:Say("I have a report that I collect every few days from my first Lieutenant Broansas. This report contains information about each guard, his performance, and usually suggestions upon how to limit the number of smugglers passing through our town. However, Lieutenant Broansas is currently on assignment investigating a smugglers ring. I need someone to retrieve his reports of the latest information that he gathered for me. Will you [retrieve the daily reports]?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4761}, 0)) then
		e.self:Say("It's nice to see that Broansas is doing well. I would not have been able to retrieve this information without your assistance, " .. e.other:GetCleanName() .. ". I thank you for your help and will be sure to tell the council members of your good deeds. I often need reports retrieved so please check back if you would like to help to the House of Fordel.");
		e.other:Faction(e.self,1510,30); -- house of fordel
		e.other:Faction(e.self,1509,30); -- haven defenders
		e.other:Faction(e.self,1508,3); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,2500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
