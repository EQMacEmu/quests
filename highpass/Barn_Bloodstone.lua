function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You seem a little out of place here. You should go back to the nice little village you came from. This place will eat you alive. The [Golden Rooster] is no place for you.");
	elseif(e.message:findi("blackburrow stout")) then
		e.self:Say("Blackburrow Stout is the finest drink available. It is the nectar of the gods. Well.. nectar of the gnolls at least. I can't wait until they hold another drink special in the Rooster. When I hear that. I am there!");
	elseif(e.message:findi("golden rooster")) then
		e.self:Say("The Golden Rooster only happens to be the finest gambling house in Highpass. It is also the only place in these parts that serves [Blackburrow Stout].");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(e.other:GetFaction(e.self) < 5 and item_lib.check_turn_in(e.self, e.trade, {item1 = 13130})) then -- Blackburrow Stout
		e.self:Say("Why thank you, kind citizen! Mutt, throw me the package! Here. This is for your boss. Do not return return to Kane without the other two lists. Some other bixie boy might just beat you to one of the other pieces. Go to Freeport. There you will find a woman called Opal. Quite a looker. I hear she works with the Arcane Scientists. Tell her the disease is spreading. She will help you.");
		-- confirmed live factions
		e.other:Faction(e.self,336,20); -- Coalition of Tradefolk Underground
		e.other:Faction(e.self,63,20); -- Coalition of Tradefolk
		e.other:Faction(e.self,329,2); -- Carson McCabe
		e.other:Faction(e.self,230,1); -- Corrupt Qeynos Guards
		e.other:Faction(e.self,330,3); -- Freeport Militia
		e.other:QuestReward(e.self,0,math.random(5),0,0,18808,100); -- Bayle List I
	end
	item_lib.return_items(e.self, e.other, e.trade)
end	
