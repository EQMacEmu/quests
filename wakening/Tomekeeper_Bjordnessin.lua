function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, weak one. What brings you to me? Are you just here to disturb me or do you have a question? Speak! You are using the King's time now, so spit it out... I have books that weigh more than you!");
	elseif(e.message:findi("herb that harms dragon")) then
		e.self:Say("An herb that harms dragons, you say? I do believe that I know of such a thing. I am a Tomekeeper after all... and we are very, very... um, very wise. The giant's brow furrows a bit as he thinks hard. 'Are you speaking of the dragonbane plant?' The giant asks.");
	elseif(e.message:findi("dragonbane")) then
		e.self:Say("The giant's face reddens as it shifts to a scowl. 'How did you hear about the existence of such an herb? Who sent you?', the giant growls.");
	elseif(e.message:findi("sage")) then
		e.self:Say("You say the Dragon Sage sent you, wretch? You have come here to mock me with a thousand year old legend? How do you plan to prove this absur... err... wild claim? It may be best that you show me some proof now, before I crush you!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 1782}, 0)) then -- a Giant Loyalist Token
		e.self:Say("Amazing! Simply Amazing! The legends must be true! This item was said to have been given to the Dragon Sage as a sign of friendship and trust, but I have always considered it to be legend. The discovery of this artifact will work wonders for my status! I have discovered a legend! Oh... Oh yes. You sought information on that herb. Take this back to the sage. Maybe he can decipher it.");
		e.other:QuestReward(e.self,0,0,0,0,1783); -- Giant Scalebound Tome
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
