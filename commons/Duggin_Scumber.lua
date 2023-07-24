function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		e.self:Emote("runs up and steals the note. 'Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note and now I shall take it to my superior!! Just try and catch me!!'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
