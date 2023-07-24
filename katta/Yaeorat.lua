-- Gemmed Sword Hilt

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, hello there stranger. I do not often receive visitors in my workshop, what brings you here today?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4762}, 0)) then -- Gemmed Sword Hilt
		e.self:Say("Ah, a Gemmed sword hilt attached with a note from my old friend Daloran. It is a shame that I have not seen him for such a long time. Being so busy with my work has prevented me from seeing and of my family or friends, really. Alas, this hilt has a positive energy eminating from it and not destructive as Daloran feared. Please take this back to him as I'm sure he awaits it.");
		e.other:QuestReward(e.self,0,0,0,0,4763,5000); -- Gem Encrusted Sword Hilt
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
