function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, hello, you must be the strangers that call yourselves friend to the Kin. Perhaps you would be interested in proving your worth?");
	elseif(e.message:findi("interest")) then
		e.self:Say("Good, then perhaps you wouldn't mind performing a small task then? With the betrayal of Kragen Morshire, the kin retreated from the Skyshrine and have taken up residence in the Tunare Court. Before I was called to guard the gate, I had been assigned to deliver a report to them. If you indeed wish to be friend to the kin, take this report to the Wakening. Eysa Florawhisper. She will give you a token indicating that she has received the message, return this to me and we may see a reward.");
		e.other:SummonCursorItem(29067); -- Item: Note to Tunares Court
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 29623}, 0)) then
		e.self:Say("Your service is appreciated, " .. e.other:GetCleanName() .. ". I cannot reward you well at this point but you have come closer to the kin, the citizens of Skyshrine.  Continue to prove your loyalty and greater rewards you may see, perhaps the greatest of all.. in time.  I must go now and report this to my superiors.  Farewell.");
		e.other:Faction(e.self,430,1);  	--CoV
		e.other:Faction(e.self,436,1);  	-- Yelinak
		e.other:Faction(e.self,448,-1); 	-- Kromzek
		e.other:QuestReward(e.self,7,7,8,0,0,1000);
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
