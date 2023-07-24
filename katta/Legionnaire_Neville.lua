-- Zone Katta   Legionnaire_Neville  ID  160263

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("coughs a bit and looks up at you with tired, bleary eyes, 'Ugh, I have not had such a cold as this since I was a boy. I have heard of a tea-maker in the city of the Vah Shir that makes a stamina enhancing tea. I would like to try some and see if it might help.'");
	elseif(e.message:findi("tea maker")) then
		e.self:Say("ACHOO! Excuse me. It was some kind of root tea... saucy greyroot... sparkly greenroot... something like that I think. The brewer's name was... Adam... Lama... Oh I just cannot think straight.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 31772}, 0)) then
		e.self:Say("Oh that is good. I feel a little better already, thanks " .. e.other:GetCleanName() .. "! A little more of that stuff and I'll be better in no time.");
		-- verified on live
		e.other:Faction(e.self,1503, 2); -- Validus Custodus
		e.other:Faction(e.self,1502, 1); -- Katta Castellum Citizens
		e.other:Faction(e.self,1504, 1); -- Magus Conlegium
		e.other:Faction(e.self,1505, -1); -- Nathyn Illuminious
		e.other:Faction(e.self,1506, -1); -- Coterie of the Eternal Night
		e.other:Faction(e.self,1483, -1); -- Seru
		e.other:Faction(e.self,1484, -1); -- Hand of Seru
		e.other:Faction(e.self,1485, -1); -- Eye of Seru
		e.other:Faction(e.self,1541, -1); -- Hand Legionnaries
		e.other:QuestReward(e.self,0,0,0,0,0,20000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
