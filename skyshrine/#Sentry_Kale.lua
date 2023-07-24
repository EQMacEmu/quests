function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, outsiders, I have heard word of your travel here. Perhaps you wish to become a friend of the kin?");
	elseif(e.message:findi("friend")) then
		e.self:Say("Good, then you would not mind assisting us with a matter of grave importance. We have received news of an alarming sort. There walks amongst us a spy of the storm giants, who feeds our every move to them and their accursed strategist. For the life of us, we cannot deduce whom the traitor is, however we have received word from Wenglawks of Kael, an associate of ours, that he has information concerning this. For a measly sum of 100 platinum, he has offered to give us the information to rid ourselves of this traitor. If you are indeed friend to the kin, take this note to Wenglawks and rid us of this traitor.");
		e.other:SummonCursorItem(29068); -- Item: Note to Wenglawks
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29065},0)) then
		e.self:Say("You have done us a great service, " .. e.other:GetCleanName() .. " . I cannot believe a mere child of Zek could infiltrate our society, this whole encounter has been very frightening. Soon a time will come when we can no longer cut ourselves off from the rest of the world. Soon we will be forced to fight every day of our lives to defend our heritage and way of life. Hopefully we shall have allies such as yourself when that time comes. I would like you to have this small token of our gratitude. A venerable wurm allowed us to grace this piece of armor with his teeth when he passed on, wear it well.");
		e.other:Faction(e.self,430,5);  	--CoV
		e.other:Faction(e.self,436,1);  	-- Yelinak
		e.other:Faction(e.self,448,-2); 	-- Kromzek
		e.other:QuestReward(e.self,math.random(10),math.random(10),math.random(10),math.random(0,10),29050,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
