--BeginFile: Auhrik_Siet`ka.pl
--Quest for Paineel - Auhrik Siet`ka: Neonate Cowardice
function event_say(e)
	if(e.message:findi("understand common")) then
		e.self:Say("Of course you do. Now, listen carefully. It may be too much for your feeble mind to gather all at once, and I hate to repeat myself. Bring me one bat wing, one rat ear, one snake egg, and one fire beetle eye. Take this bag, and make sure it's sealed before you return it to me. Snake eggs spoil. Now, quit staring at me with your jaw hanging open like a dead codfish. I would have mistaken you for one, but dead codfish smell better. Haha!");
		e.other:SummonCursorItem(17802); --Small Sealable Bag
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14041})) then --A Rolled Up Note
		e.self:Say("Why are you giving this to me? Oh I see. I forgot that rats don't know how to read. Haha! Well, then. I shall read it for you. You do [understand common] don't you? Haha.");
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 12993})) then --Small Sealed Bag
		e.self:Say("Well, that wasn't so hard, was it? I suppose I must now thank you for your services. Now, leave me to my studies. I would tell you what I needed the items for, but that would just cloud your fragile little mind. Off with thee!");
		e.other:Faction(e.self,265,5);  --Heretics
		e.other:Faction(e.self,242,-5);  --Deepwater Knights
		e.other:Faction(e.self,254,-5); --Gate Callers
		e.other:Faction(e.self,231,-5);  --Craftkeepers
		e.other:Faction(e.self,233,-5);  --Crimson Hands
		e.other:QuestReward(e.self,8,0,0,0,0,2000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--EndFile: Auhrik_Siet`ka.pl
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
