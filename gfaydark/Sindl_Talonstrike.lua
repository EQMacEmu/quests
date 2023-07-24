function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings.  Is not Kelethin the most glorious city you have seen?  A part of the forest itself. it is.  The forest is our life force.  It shelters us and we feed from its vegetation.  The [Soldiers of Tunare] have [harvesters] upon the grounds at all times.  We have our hunters.");
	elseif(e.message:findi("soldiers of tunare")) then
		e.self:Say("The Soldiers of Tunare are lovers of the forest.  They are druids who protect and nurture the forest.  The forest is the genesis of their mana.  The soldiers are comprised of Fier'Dal and Koada'Dal.  Imagine that!  A Koada'Dal not afraid to get dirt under his nails!!");
	elseif(e.message:findi("harvesters")) then
		e.self:Say("Just as our young warriors are employed as hunters to supply all the meat for Kelethin. the druids have their young scour the grounds of the forest for all the vegetation we need to survive."); 
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:gfaydark  ID:54103 -- Sindl_Talonstrike 