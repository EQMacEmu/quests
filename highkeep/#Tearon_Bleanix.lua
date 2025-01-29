function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello sir. Are you a citizen of Highpass?");			
	elseif(e.message:findi("I am not a citizen")) then
		e.self:Say("Nor am I. I find this city's love of greed appalling. Do not you?");
	elseif(e.message:findi("appalling")) then
		e.self:Say("Yes. This city of vices is second only to Neriak. And it is trouble with Neriak that has sent me here, in search of my people's princess.");
	elseif(e.message:findi("princess")) then
		e.self:Say("The Princess Lenya Thex is the daughter of His Royal Majesty, King Tearis Thex of Felwithe. She was on her way to Qeynos when we believe she was kidnapped by Carson McCabe, the governor of this vile city. I await the paladin from Felwithe.");
	elseif(e.message:findi("become a hero")) then
		if(e.other:GetFactionValue(e.self) >= 500) then
			e.self:Say("Well let's get started on making you a hero. You must take the Elite Guard Bracer. Look for Princess Lenya. When you find her give her the bracer to prove you are with the Koada'dal. She should trust you then. Then return to me with Princess Lenya and return my bracer. Be safe my friend.");
			e.other:SummonCursorItem(13108); -- Item: Tearons Bracer
		elseif(e.other:GetFactionValue(e.self) >= 0) then
			e.self:Say("When you have furthered your service to the Paladins of Tunare, we shall make conversation.");
		else
			e.self:Say("You have some nerve to approach a loyal member of the Paladins of Tunare! Run, while you can!");		
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 13112})) then -- Tearon's Bracer (returned) 
		e.self:Say("King Tearis Thex thanks you my friend. Could you please hand the princess this amulet. It is hers. I pryed it from the hands of some beggar.");
		e.other:Faction(e.self,226,25); -- Faction: Clerics of Tunare
		e.other:Faction(e.self,279,25); -- Faction: King Tearis Thex
		e.other:Faction(e.self,5002,18); -- Faction: Anti-mage
		e.other:QuestReward(e.self,0,0,0,0,13109,50); -- Item: Royal Amulet of Thex
		eq.depop_with_timer();
		eq.unique_spawn(6007,0,0,52.0,13.0,3.70,161); -- Princess
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
