--The tormented tradesman is actually the skeleton/spirit of the Haggle Baron, Dalnir. Giving this skeleton the Mirror of Self Loathing will spawn Haggle Baron Dalnir so you can finish the Greenmist quest.
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("End my suffering... I cannot think beyond this pain! Why am I in this place? What have I done?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3889})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		eq.signal(104072,1); -- NPC: The_undead_entity
		e.other:QuestReward(e.self,0,0,0,0,3896);
		eq.spawn2(104075,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 3896})) then --Crusaders of Greenmist (Greenmist Quest 8/8)
		eq.signal(104072,1); -- NPC: The_undead_entity
		e.other:Ding();
		eq.spawn2(104075,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--Submitted by Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
