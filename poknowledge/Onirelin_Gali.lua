--Willamina's Needles
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("peers you over carefully, studying you.  'Welcome and come in, stranger.  Are you here to simply look around or have you come to speak to my superior, Gunyth?  If so, you may find him upstairs. Watch your step, now.'");
	elseif(e.message:findi("artifact")) then
		e.self:Emote("pauses for a moment and continues, 'I am aware of that which Cador desires. Be wary of his ways for they are not always as they appear. Nevertheless, if he thinks this artifact will bring him greater peace, he may have it for a price. Certainly I have no use for it but what do I get in return? I'll tell you. Narik and I used to be good friends, until he became jealous of my relationship with his former companion Elisha. During our fight, he marched off with one of my finest jewels, and I believe still has it. Find him and ask for my jewel back. If you bring it to me, Cador may get want he wants as well.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 28088})) then--Onirelin's Jewel
		e.self:Say("How did you get this away from Narik? Oh never mind, I'm just happy to have it back. I shall give you what Cador desires now, keep it secure and deliver it to him.");
		-- Confirmed Live Experience
		e.other:QuestReward(e.self,0,0,0,0,28089,100);--Cador's Artifact
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
