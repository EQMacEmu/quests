function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up from her teary handkerchief, the deepest sadness visible in her eyes, 'I am very sorry, but I am not very good company at the moment. I fear my love will never return.'");
	elseif(e.message:findi("love")) then
		e.self:Emote(", recalling joyful memories that bring sadness to her eyes, chokes on her words, 'It is not easy for me to talk about, perhaps someday... I began writing of us, thinking that it would help lift my sinking heart, but I could not finish even that.' As she speaks, she lazily flips through her diary where a story of true love has been recorded.");
	elseif(e.message:findi("story")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Emote("considers you for a moment, 'I do not suppose I could ever bear to finish it. It is a story I wish had a happy ending, but I do not have it in my heart to create such a thing. If you would like to read it, I suppose you may. It is probably best that I try to distance myself from this experience,' she says half-heartedly.");
			e.other:SummonCursorItem(18324); -- Item: Kalilaa Diary
		else
			e.self:Say("You need to prove your dedication to our cause before I can discuss such matters with you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5996})) then
		e.self:Emote("gasps at the sight of what you have handed her, 'mother's locket! Have you found...' She looks into your eyes and sees the answer to her unspoken question. 'I... I thank you,' is all that she can manage.'");
		e.self:Say("At least now we know. You have gone to such lengths, please take this, it was my gift from the city upon obtaining full Khala Dun honors. You have earned it my friend.");
		e.other:QuestReward(e.self,0,0,0,0,5995);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
