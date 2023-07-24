function event_say(e)
	if(e.message:findi("hail")) then
        e.self:Say("Hello " .. e.other:GetCleanName() .. ". I do not have much time to chat. I must concentrate on the portal that is due to open soon. If you wish to [journey to Luclin], tell me so."); 
    elseif(e.message:findi("journey to Luclin")) then
        e.self:Say("Take this, " .. e.other:GetCleanName() .. ".  You must stay  inside the circle of the Spires, and keep this shard on your person.  Should you need another, simply ask me.  I do not think we will run out of shards any time soon!  If you do NOT wish to travel to Luclin, destroy that which I gave you, or step well away from the Spires lest you be caught up in the portal. It will open soon.");
        e.other:SummonCursorItem(19720); -- Item: Spire Stone  
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end