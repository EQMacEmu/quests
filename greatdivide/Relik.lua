function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Huh? What are ya needin'? Speak up! I ain't got all day. Are you here to help out or just eat up valuable time chatting?");
	elseif(e.message:findi("help")) then
		e.self:Say("Ah, good. That's what I wanted to hear. We be needin' help with supplies. I been needin' pickheads for a while now but the minin' guild hasn't had the stock ta send 'em. We're gonna need ta improvise. I've seen the gashes left in rock after a shardwurm crawled over it and I think that be the thing we need. If ya can bring me four shardwurm claws, maybe I can rig 'em up into enough picks to keep us runnin' on time with our crystal mining.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30262,item2 = 30262,item3 = 30262,item4 = 30262}, 0)) then
		e.self:Say("Oh, yeah. That's strong, very strong. With these, we can make our shipment for this month. I gotta be thankin' ya properly. This be one of our best tools. Here, ya can swing a pick with us anytime, " .. e.other:GetCleanName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,30263,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
