function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you, my friend?  You must be a [new scout of Kelethin].  I would hope so.  We dearly need more recruits.  Most of the Fier'Dal choose the path of the ranger.");
	elseif(e.message:findi("new scout of kelethin")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("Good. I have an easy, but very important, task for you. We require all young members to cleanse these woods of the troublesome pixie tricksters. Take this pouch, fill it with pixie dust, and when it is combined, return it to me. I just may have some used armor lying around for you.");
			e.other:SummonCursorItem(17957); -- Empty Pouch
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Scouts of Tunare have no quarrel with you, but perhaps a few less Crushbone Orcs would prove your worth. Then we shall speak.")
		else
			e.self:Say("You dare to speak with a loyal member of the Scouts of Tunare?!  You are truly foolish!  Run away, while you still can.");
		end
	elseif(e.message:findi("dark assassin")) then
		e.self:Emote("squints at you and says, 'So you have heard about him as well? I had heard of him through the rogue grapevine, so I was wary when the home guard spoke of the arrival of a dark stranger. I was approaching him from behind and some loud ranger clompipng about in the bushes must of spooked him, for off he ran. As he was running I took the liberty to swipe a piece of paper protruding from his pocket.' Expin mumbles to himself, 'Now where did I put that note?'");
	elseif(e.message:findi("not satisfied")) then
		e.self:Say("I told you not to tell me.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(e.other:GetFactionValue(e.self) >= 100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 12109})) then -- Pouch of Pixie Dust
		e.self:Say("Good work, scout!!  You have earned this reward.  It is all we have at the time.  I am certain you are satisfied.  If not, then do not let me hear of it.");
		e.other:Faction(e.self,316,15); -- Scouts of Tunare
		e.other:QuestReward(e.self,math.random(10),math.random(20),0,0,eq.ChooseRandom(2104, 2106, 2108, 2111, 2112),800); -- Patchwork
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 16390})) then -- Crumpled Piece of Paper
		e.self:Say("Ahhh! You found it! Here let me make you a copy and put this in a secure spot so I don't lose it again.");
		e.other:QuestReward(e.self,0,0,0,0,24098,50); -- Remiss Sketch
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54024 -- Expin 
