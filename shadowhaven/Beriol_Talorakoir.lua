-- Beriol's Research

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetCleanName() .. ". And good day to you. What brings you to my quarters today?  Do you wish to learn more about the [magic] that we study in our hallowed section of the Shadowhaven?");
	elseif(e.message:findi("magic")) then
		e.self:Say("It's always a pleasure to meet someone that shows interest in the magic that we practice here. Our magic studies consist mostly of teleportation and the arts of elemental mastery. I'm actually conducting a study now, but I'm missing a few [books].");
	elseif(e.message:findi("books")) then
		e.self:Say("Well, I have an old student that is now serving as an advisor to one of the most respected residents of Katta Castelleum. He has some specific books that I need to further my research, but I cannot take the time to travel so far away from my home to retrieve them. I seek out one who will [bring my research] to me from Dersino.");
	elseif(e.message:findi("bring your research")) then
		e.self:Say("You are exactly the one I am looking for. After presenting this seal to Dersino, inform him that you wish to take the research and I am sure that he will know I have sent you. I look forward to seeing you soon.");
		e.other:SummonCursorItem(4769); -- Item: Seal of Beriol
	elseif(e.message:findi("exodus")) then
		e.self:Say("Ahh, the event that started it all it was the strife between Seru and Tsaph Katta that ultimately brought us here to Luclin.  Those must have been interesting times but, being over twenty generations Luclin born, I could only guess.  One of these days I would like to read up on the subject, but what little we do have about it is always checked out.  If that's what you came looking for, good luck- check with Rianna, she is usually up on those things.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4770}, 0)) then
		e.self:Say("This is exactly the research book that I was in need of. I am very thankful for you getting these for me. Should you ever feel up to it again in the future Dersino always is getting new books in that could be very helpful in my studies. Again, I thank you and wish you the best of luck.");
		e.other:Faction(e.self,1511,25); -- house of midst
		e.other:Faction(e.self,1508,2); -- traders of the haven
		e.other:QuestReward(e.self,0,0,0,0,0,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
