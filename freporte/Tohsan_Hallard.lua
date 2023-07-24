function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings and welcome to Hallard's!  You will find many aged weapons begging you to shine them up and make them great once more.  We will gladly pay you top dollar for any rusty weapons you may have found littering the Commonlands.  I have a [special offer] for those who have obtained orc pawn picks.");
	elseif(e.message:findi("special offer")) then
		e.self:Say("I will pay some silver pieces for every four orc pawn picks returned to me.  I shall also throw in a ticket to the Highpass Hold lottery.  It could be a winner!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "There will be no silver nor lottery ticket until I receive four orc pawn picks.";

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13885,item2 = 13885,item3 = 13885,item4 = 13885},1,text)) then -- Orc Pawn Pick
		e.self:Say("As I promised, some silver and of course, the Highpass lottery ticket. Oh yes, I forgot to mention the ticket was for last season's lottery. Ha Ha!! You now own a losing Highpass lottery ticket, lucky you! Ha!!");
		e.other:Faction(e.self,229,4); -- Coalition of Tradefolk
		e.other:Faction(e.self,281,4); -- Knights of Truth 
		e.other:Faction(e.self,291,3); -- Merchants of Qeynos
		e.other:Faction(e.self,336,4); -- Coalition of Tradesfolk Underground 
		e.other:QuestReward(e.self,0,math.random(10),0,0,eq.ChooseRandom(12264, 12265, 12261, 12262, 12263,12266),200); -- Item(s): Lottery Ticket # 14350 (12264), Lottery Ticket # 16568 (12266)
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Tohsan_Hallard.pl


