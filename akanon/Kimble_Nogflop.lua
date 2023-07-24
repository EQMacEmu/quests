-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am the keeper of this zoo. I advise you to stay on the upper tiers to observe the animals.");
	elseif (e.message:findi("regurgitonic")) then
		if(e.other:GetFactionValue(e.self) >= -100) then
			e.self:Say("I formulate the Regurgitonic myself. My animals kept eating the occasional spectator here and there. Femurs and ribs kept getting stuck inside, not to mention a few platinum pieces. Sometimes my batch would come out wrong and the animals would go berserk!! I hope I got the formula right this time.");
		else
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFactionValue(e.self) >= -100 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13945})) then -- Flask of Nitrates
		e.self:Say("The flask of nitrates I sent for!! As was the deal, here is my [Regurgitonic]. Give it to whoever may need it and they will surely cough up whatever may be inside them with no harm to them whatsoever.");
		-- confirmed live factions
		e.other:Faction(e.self,255,10,0); 	-- Gem Choppers
		e.other:Faction(e.self,288,2,0); 	-- Merchants of Ak'Anon
		e.other:Faction(e.self,333,2,0); 	-- King Ak'Anon
		e.other:Faction(e.self,238,-2,0); 	-- Dark Reflection
		e.other:Faction(e.self,1604,-1,0); 	-- Clan Grikbar
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(12140,12139),100);	-- Bad Regurgitonic or Regurgitonic
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
