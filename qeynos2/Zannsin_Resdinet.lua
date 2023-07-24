function event_waypoint_arrive(e)
	if(e.wp == 10) then
		e.self:Say("Hey Hanns.. Have you gotten word from Prak about the spy in Carson's guards?");
		eq.signal(2074,1); -- NPC: Hanns_Krieghor
	end
end

function event_signal(e)
	if(e.signal == 1 and e.self:GetX() == 163 and e.self:GetY() == 144) then
		e.self:Say("Yeah, whatever, Knarg. If I were you, I wouldn't mess around with [Renux]. She's in tight with [Hanns], and you know how he is.");
	elseif(e.signal == 2) then
		e.self:Say("[Rujahn] Tahslek, huh? I've never heard of him, but those bandits seem to have a new leader every month or so.");
	elseif(e.signal == 3) then
		e.self:Say("I'll send one of our best men to Highpass and eliminate [Rujahn]'s spy.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey..  My name's Zannsin, but you can call me [Zan].");
	elseif(e.message:findi("zan")) then
		e.self:Say("That's what they call me. Now quit bugging me, I have work to do.");
	elseif(e.message:findi("renux")) then
		e.self:Say("She is second in command around here. She and [Hanns] go way back, from what I hear...  Renux is probably the only person Hanns trusts.");
	elseif(e.message:findi("hanns")) then
		e.self:Say("Hanns, he runs things around here. Years ago, Hanns took over Ghil's old ring and started up the Circle of Unseen Hands. The Circle quickly took any market opposition out of Qeynos. We currently have connections in Erudin, Highpass and even Freeport.");
	elseif(e.message:findi("prak")) then
		e.self:Say("Prak owns a small casino out in Highpass.  He helps us keep tabs on what Carson and his men are up to.");
	elseif(e.message:findi("knargon")) then
		e.self:Say("That kid's just looking for trouble. He better get it together and start proving that he's worth something.");
	elseif(e.message:findi("kane")) then
		e.self:Say("You sure are nosey...  [Crow] will tell you everything you need to know about Kane.");
	elseif(e.message:findi("crow")) then
		e.self:Say("Crow owns the bar upstairs...let's just say he's really close friends with [Hanns], so do whatever he asks you...got it?");
	elseif(e.message:findi("rujahn")) then
		if(e.other:GetFaction(e.self) < 4) then
			e.self:Say("Hmm, I see. Maybe you can help us out with this, " .. e.other:GetCleanName() .. ", huh? I think it'd be a perfect opportunity for you to prove just how valuable you are to our little organization. Take this letter to Prak at Golden Rooster in Highpass, and see what you can do to help him out.");
			e.other:SummonCursorItem(18795); -- Item: Letter for Prak
		else
			e.self:Say("The Circle has recognized your deeds and contributions, but I think you need to prove your worth to us a little more.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 18028})) then
		e.self:Say("Great work, " .. e.other:GetCleanName() .. "... The Circle is very pleased with your performance of late, and as a small reward for our more trusted members, I give you this... the cloak of the Unseen Hands. It's good to know that we can count on you to get the job done... here, " .. e.other:GetCleanName() .. ", go relax and have some wine, on me.");
		e.other:Faction(e.self,223,125,0); -- Circle of Unseen Hands
		e.other:Faction(e.self,291,-18,0); -- Merchants of Qeynos
		e.other:Faction(e.self,230,18,0); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,262,-18,0); -- Guards of Qeynos
		e.other:Faction(e.self,273,12,0); -- Kane Bayle
		e.other:QuestReward(e.self,0,6,3,2,1048,10000); -- Item: Black Leather Cloak
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet