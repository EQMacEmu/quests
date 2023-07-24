function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
	elseif(e.message:findi("summoning of terror")) then
		if(e.other:GetFactionValue(e.self) >= 100) then
			e.self:Say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("I sense the potential to learn the ways of fear within you. Continue striving to master your fear and one day perhaps you can be of service to our Lord Cazic-Thule.");		
		else
			e.self:Say("Begone from this place! Infidels like you have no place among the faithful of Cazic-Thule!");			
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local text = "I require all four reagents, anything less is useless. Incompetence will get you nowhere amongst the faithful of Cazic-Thule!";
	
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 10523, item2 = 19032, item3 = 14110, item4 = 14109},1,text)) then --Eye of Urd, Basalt Drake Scales, Lens of Lord Soptyvr, Widowmistress Hair
		e.self:Say("Yes! Can you feel the terror in the air, prickling your flesh, and standing your hair on end? The chanters have summoned the avatar of Terror! Quickly take this mundane mask to him and he shall forge it into a valuable symbol to be worn by loyal apostles of Terror!");
		e.other:Faction(e.self,265,200,0); -- Faction: Heretics
		e.other:Faction(e.self,242,-200,0); -- Faction: Deepwater Knights
		e.other:Faction(e.self,254,-200,0); -- Faction: Gate Callers
		e.other:Faction(e.self,231,-200,0); -- Faction: Craftkeepers
		e.other:Faction(e.self,233,-200,0); -- Faction: Crimson Hands
		e.other:QuestReward(e.self,math.random(9),math.random(9),math.random(9),math.random(9),14106,5000); --Mundane Mask
		eq.unique_spawn(75195,0,0,421,1182,-37,128); -- spawn avatar of terror
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
