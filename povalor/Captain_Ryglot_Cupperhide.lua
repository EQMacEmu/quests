function event_say(e)

	local questState = tonumber(eq.get_qglobals(e.other).pov_orb_quest or 0);
	
	if ( questState == 6 ) then

		if ( e.message:findi("hail") ) then
			e.self:Say("I am very [busy] at the moment. Perhaps you should come back at another time "..e.other:GetName());
			
		elseif ( e.message:findi("busy") ) then
			e.self:Say("I can't go into any great detail, but the Crystalline Globe was taken from our command structure. Its believed to have been separated into three pieces. Unfortunately, we're having a lot of trouble relocating it. Perhaps you'd like to [help].");
			
		elseif ( e.message:findi("help") ) then
			e.self:Say("That's good to hear "..e.other:GetName()..". I wish we had more soldiers like yourself willing to help. I'm going to need you to locate the missing pieces of the globe and bring them back to me. After you've acquired the pieces perhaps you'd be able to rally enough people to lend us a hand with another [mission] objective we've been unable to fulfill do to our diminished numbers.");
			
		elseif ( e.message:findi("mission") ) then
			e.self:Say("Well, I can't go into any details as to our main purpose is, but one of our missions was to exterminate the crystalline dragon. However, due to our company being split we are unable to go forward with this part of the operation. It has been placed on hold, pending the outcome of the [war].");
			
		elseif ( e.message:findi("war") ) then
			e.self:Say("Unfortunately, that is one of the things that I'm unable to speak of at this time. However, if you are [willing] to help rally some people together I may be able to release some more information to you.");
			
		elseif ( e.message:findi("willing") ) then
			e.self:Say("Well, that's good to hear. Bring me back what I've requested and we'll talk then.");
		end
	else
		if ( e.message:findi("hail") ) then
			e.self:Say("Please leave. I am extremely busy at the moment.");
		end
	end
end

function event_trade(e)
	local questState = tonumber(eq.get_qglobals(e.other).pov_orb_quest or 0);
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 25796, item2 = 25797, item3 = 25798 }) ) then -- globe pieces
	
		if ( questState == 6 ) then
			e.self:Emote("looks up at you in surprise. 'I can't believe you brought the missing pieces back to me so quickly. I have a team of men who have been looking for these pieces for weeks now. That's quite a feat. Unfortunately, I will be unable to make use of the Crystalline Globe at this time. A message has been dispatched to my platoon asking us to return to the Halls of Honor. It looks as if we'll be joining up with the rest of our company fairly soon. Keep the globe. If you're able to rally enough people together to take on Aerin`Dar then perhaps you'll be able accomplish an objective that our platoon was unable to do. I must go now. Good luck to you "..e.other:GetName()..".'");
			-- Confirmed Live Experience
			e.other:QuestReward(e.self, { itemid = 25596, exp = 1 }); -- A Crystalline Globe
		else
			e.self:Say("Thanks for the gift."); -- This text is a guess.  The quest was changed to not eat items well after AK's time, so can't get the real text
		end
	end	
	item_lib.return_items(e.self, e.other, e.trade);
end
