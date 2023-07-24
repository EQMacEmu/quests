-- Quest file for Najena - Linara Parlone: Mystic Cloak

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please [help] me out of this horrid place! My family must be terribly worried!");
	elseif(e.message:findi("help")) then
		e.self:Say("If you can find the [key] to my restraints. I should be able to escape.");
	elseif(e.message:findi("key")) then
		e.self:Say("Last I knew, Najena's priest had the key. I fear he has left this place though. I heard talk of traveling to some estate. I know not where. Oh dear, oh dear! I shall never leave this place!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12269})) then -- tarnished bronze key
		e.self:Say("Oh my! Thank you so very much! here, take this note to my father. I am sure he will reward you well for my safety.");
		e.other:Faction(e.self,275,10); -- Faction: Keepers of the Art
		e.other:Faction(e.self,279,2); -- Faction: King Tearis Thex
		e.other:Faction(e.self,246,1); -- Faction: Faydarks Champions
		e.other:Faction(e.self,239,-2); -- Faction: The Dead
		e.other:QuestReward(e.self,0,0,0,0,5573); -- Item: A Folded Note
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
