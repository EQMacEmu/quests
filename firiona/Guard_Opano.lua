function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("has large scars on the right side of his face.  He is missing one eye and wears no patch.  'Another adventurer?  If you think you will find fame and fortune in this land, you are sadly mistaken.  Only death awaits you out there in the wilds of Kunark.  Just when you think you are raiding a [tomb], you will find it becomes your own final resting place.'");
	elseif(e.message:findi("tomb")) then
		e.self:Say("Do not contemplate raiding tombs.  I was once sent with a unit to find a relative of a human noble lost in Kunark.  With the help of the Fier'Dal trackers, we found them in a hidden tomb.  It was filled with [great evil] and [great deceit].");
	elseif(e.message:findi("great deceit")) then
		e.self:Say("Within that tomb laid a pitfall to doom.  We found ourselves trapped.  We had to creep through dark halls, fearing death.  Every time hope sprang forth, we would find ourselves trapped again.  Be it by pitfall, hidden passage or locked door...  hope mocked us at every turn.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end