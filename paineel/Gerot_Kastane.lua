-- Part of SK Epic 1.0

function event_say(e)
	if(e.message:findi("hail") and e.other:GetFactionValue(e.self) >= -83 ) then
		e.self:Say("" .. e.other:GetCleanName() .. "! My hero! I am at your service. I have been told to tell you all I know of the Head of the Valiant. Its construction is a mockery to the gods of Light, an abomination above all others. The method of creation of the Head of the Valiant was passed down through my family for centuries. All I require of you is the physical head of a valiant warrior. I have the rest of the materials right here to fashion this item for you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 14375})) then
		e.self:Say("At last! I have been waiting for my brother for weeks! We are doomed! Innoruuk will taint our seed into some perverse, twisted, maddened breed. The prophecy has begun to unfold and there are none capable of stopping it. Quickly, return this note to Marl, we must hide! We have failed the master! We must escape the hateful one's wrath!");
		e.other:Faction(e.self,404, 3); -- Faction: True Spirit
		e.other:QuestReward(e.self,{itemid = 14376}); -- Item: Note to Marl
	elseif(e.other:GetFactionValue(e.self) >= -72 and item_lib.check_turn_in(e.self, e.trade, {item1 = 14378})) then  -- Faction: True Spirit
		e.self:Say("Good travels, dark one! May Innoruuk curse your enemies!");
		e.other:Faction(e.self,404, 3); -- Faction: True Spirit
		e.other:QuestReward(e.self,{itemid = 14369}); -- Item: Head of the Valiant
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
