function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Shhh... listen. Can you hear them?  They are very close.");
	elseif(e.message:findi("close")) then
		e.self:Say("What?!? You mean you...");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(121026)) then
			eq.get_entity_list():GetMobByNpcTypeID(121026):Say("Now don't get all in an up roar Slacey. These visitors have no clue what it is like down here. Unless of course, they have talked to the Captain!");
			e.self:Say("You are right, Evercold. You should go see the Captain to fully understand what is going on here.");
		end
	end
end

function event_signal(e)
	e.self:Emote("blushes. Be nice Evercold.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end