function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Avast you! Ya best be shovin off if ye know whats good for you.  We be pirate raiders and ya best not be messin with the likes of us!");
		if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(110052)) then
			eq.get_entity_list():GetMobByNpcTypeID(110052):Say("Squawk! Pieces of eight! Pieces of eight!");
			e.self:Say("The cap'n said PIRATES! Not parrots ye knucklehead!' He whacks the other raider upside the head. 'now whars the tinkered rope!?'");
			eq.get_entity_list():GetMobByNpcTypeID(110052):Say("We be out.  Youll be needin to make more. Arg!");
		end
	elseif(e.message:findi("tinkered rope")) then
		e.self:Say("Batten down yer yapper! Ahl be doin the talkin here.   We be needin the rope to tie ye down fer ransom.  Now fetch me the beard of a frost giant scout so's I can make some more rope to tie ye up with.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 30048}, 0)) then
		e.self:Say("Arg! By blubberbeards nostril!  Ye'v done it!'  He braids the beard together into a sturdy rope. 'Now take this here rope and tie yerself up!  Come lets go tell the cap'n we'v captured us some prisoners!'");
		e.other:Faction(e.self,447,1); -- Faction: Pirates of Iceclad
		e.other:QuestReward(e.self,0,0,0,0,30049,1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
