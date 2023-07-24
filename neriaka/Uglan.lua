function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Me Uglan. Mighty ogre. Member of Crakneks. We crush for dark elves. Do you [like dark elves] or they be [mean] to you?");
	elseif(e.message:findi("like")) then
		e.self:Say("Me love friends dark elves.");
	elseif(e.message:findi("mean")) then
		e.self:Say("You smart person. Me know dark elves not friendly. They just use ogres. Me not like Neriak anymore.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13357})) then
		e.self:Say("You from Oggok. Me waiting for you. Me know dark elves have dark plan for ogres. We must stop plan. You must go to Nektulos Forest. Wait for blue orc. He deliver message for dark elf king. Not good. You kill blue orc runners. If message on them then you take to Lork in Oggok. Ogres must know plan.");
		e.other:Faction(e.self,239,5); -- Faction: The Dead
		e.other:Faction(e.self,303,1); -- Faction: Queen Cristanos Thex
		e.other:Faction(e.self,278,-1); -- Faction: King Naythox Thex
		e.other:Faction(e.self,275,-1); -- Faction: Keepers of the Art
		e.other:Faction(e.self,245,-1); -- Faction: Eldritch Collective
		e.other:Faction(e.self,1522,-10); -- Faction: Primordial Malice
		e.other:QuestReward(e.self,0,0,0,0,0,500);
		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
