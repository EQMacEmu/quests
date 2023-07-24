function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well met wanderer. Pay heed to the road you chose to travel on, for there are many [hazards] you may come across no matter which direction you chose.");
	elseif(e.message:findi("hazards")) then
		e.self:Say("The western road passes through a dangerous part of the thickets. A rivalry between the strange Tegi clans is afoot. Pay close attention, for the darker ones seem much more hostile than the ones that came before them. The Northern road passes through to the [Paludal] caverns. Once it was a rather safe trade route to the city of Shadow Haven. It has since fallen to regular brigand attacks.. We still get traders coming to sell their wares, but the journey is far more treacherous these days.");
	elseif(e.message:findi("paludal")) then
		e.self:Say("What is Paludal? The Paludal caverns mark the trade route to Shadowhaven. A series of tunnels that burrow into the very heart of Luclin. I would be very careful of the creatures that burrow through these caverns. They are very dangerous and will show no mercy on young adventurers. If you come across these creatures bring me four different carapaces shells and I will reward you with a shield made from them.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
