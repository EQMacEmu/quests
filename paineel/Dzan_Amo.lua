function event_say(e)
	if(e.other:GetFactionValue(e.self) >= -100) then -- not exact faction, dubious doesn't work and 0 indifferent works
		if(e.message:findi("hail")) then
			e.self:Say("Welcome to the Tabernacle of Terror. Perhaps you can control your fear long enough to be of [service] to us.");
		elseif(e.message:findi("service")) then
			e.self:Say("I need some things fetched from the creatures just outside our city for some ritual experimentation. Bring me two tufts of bat fur and two fire beetle legs and I will school you in the ways of terror.");
		end
	else
		e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!")	
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I need no fewer than four infected rat livers!! Now, go get me what I require!!"; -- he says this for the quest hand-in, sern adolia is who this text was meant for, but sony messed up
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13069, item2 = 13069, item3 = 13250, item4 = 13250},1,text)) then --Bat Fur x 2, Fire Beetle Leg x 2
		e.self:Say("Very good young one. Here is something to assist in your studies of the principles of terror.");
		e.other:Faction(e.self,265, 5);  --Heretics
		e.other:Faction(e.self,242, -5);  --Deepwater Knights
		e.other:Faction(e.self,254, -5); --Gate Callers
		e.other:Faction(e.self,231, -5);  --Craftkeepers
		e.other:Faction(e.self,233, -5);  --Crimson Hands
		e.other:QuestReward(e.self,0,0,0,0,15209,1000); --Spell: Spook the Dead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75018 -- Dzan_Amo
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
