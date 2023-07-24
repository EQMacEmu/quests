function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	local questState = tonumber(qglobals.pov_orb_quest or 0);

	if ( e.other:HasItem(25596) and e.message:findi("hail") ) then -- A Crystalline Globe
		e.self:Say("I knew you'd come through for us "..e.other:GetName()..". I knew from the very beginning. The Battalion salutes you.");
		return;
	end
	if ( questState >= 5 ) then
		return;
	
	elseif ( questState == 4 ) then
	
		if ( e.message:findi("hail") ) then
			e.self:Say("I'm sorry the Master Sergeant was unable to help you. Perhaps you should [prove] yourself before you attempt to jump 'into the fire' so to speak.");
			
		elseif ( e.message:findi("prove") ) then
			e.self:Say("We've been running into a lot of problems lately with the razorfiends and the planarian larvae. Many soldiers have been getting sick because of the infestations that they cause. Capture the hearts of a razorfiend, a crystalline spider and a planarian larvae and bring them back to me. Our squad had enough problems capturing this small razorfiend here. This will become your first so called 'Trial' " .. e.other:GetCleanName() .. ". It should be enough to prove your worth.");
		end
	
	elseif ( questState == 2 or questState == 3 ) then
	
		if ( e.message:findi("hail") ) then
			e.self:Say("You're either [brave], or you're [stupid].");
		
		elseif ( e.message:findi("brave") ) then
			e.self:Say("That you are. Perhaps you'd be interested in helping our [company].");
	
		elseif ( e.message:findi("stupid") ) then
		
			-- was unable to get this response
			--e.self:Say("");
		
		elseif ( e.message:findi("company") ) then
		
			e.self:Say("We're a part of the Battalion of Marr. We're soldiers from Che Virtuson. We were dispatched to this part of the Plane of Valor to eliminate an age old target. Unfortunately, due to some recent events our mission has been placed on hold and our [squad] has been asked to remain behind.");
		
		elseif ( e.message:findi("squad") ) then
		
			e.self:Say("We are apart of Ducee Tapferson. Our squad is known for our bravery. We were successful in capturing this [razorfiend] earlier today. You've shown some bravery as well my friend and that is the reason I request your [assistance].");
		
		elseif ( e.message:findi("assistance") ) then
		
			e.self:Say("Many of us here are anxious to leave. Many wish to regroup with the rest of our company. Other wish to go back to the Halls to complete the [Trials].");
		
		elseif ( e.message:findi("razorfiend") ) then
		
			e.self:Say("These vile beasts live in the caves west of here.");
		
		elseif ( e.message:findi("trials") ) then
		
			e.self:Say("The Trials are overseen by the Heroes of Marr. It's these Trials that allow us to rise in rank. Only those who have passed the trials are able to enter the Temple of Marr. Now if you wish to aid us I must ask you to do a few [things].");
		
		elseif ( e.message:findi("things") ) then
		
			e.self:Say("You must find the Master Sergeant and tell him that you are here to aid the cause.");
			eq.set_global("pov_orb_quest", "3", 1, "H6");
		end
	else
		if ( e.message:findi("hail") ) then
			e.self:Emote("nods in your direction.");
		end
	end
end

function event_trade(e)
	local questState = tonumber(eq.get_qglobals(e.other).pov_orb_quest or 0);
	local item_lib = require("items");
	
	if ( item_lib.check_turn_in(e.self, e.trade, { item1 = 25597, item2 = 25598, item3 = 25599 }) ) then -- hearts
	
		if ( questState >= 4 ) then
		
			e.self:Emote("looks at you with surprise. 'Very good my friend. You've definitely proven yourself. Find the Master Sergeant. He should be able to help you this time.'");
			-- Confirmed Live Experience
			e.other:QuestReward(e.self, {exp = 1});
			if ( questState == 4 ) then
				eq.set_global("pov_orb_quest", "5", 1, "H24");
			end
		else
			e.self:Emote("looks at you in disgust and wonders why you did that.");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
